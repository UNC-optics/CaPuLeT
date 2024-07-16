## This script is used to transform pupil data output after processed from DeepLabCut 
# into metric representation. Also this script contains function to normalize pupil size to % max pupil.
# Code written by Maria Ortiz-Juza

# Step 1. Install required libraries
options(stringsAsFactors = FALSE)
library(tidyverse)
library(cowplot)
library(reshape2)
library(cutoff)
library(zoo) #used to replace NA by interpolation
library(gsignal) #Last two are libraries that can be used to smooth data
library(smoother) #contains functions to smooth numerical data. specifically can smooth with gaussian function

#Step 2. Read in original DLC data by specifying file path location
dforig<- read.csv("C:\\Users\\18057\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\HabSample_Mouse_DLC.csv", skip=1, header=F)
names(dforig) <- paste(dforig[1,], dforig[2,] , sep="_") 
dforig <- dforig[-c(1,2),]

#Get basename of file path that will be used to build data frame of pupil data
dforigname<- basename("C:\\Users\\18057\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\HabSample_Mouse_DLC.csv")

# Step 3. Read in x and y coordinate data for calibration points collected from imageJ
dfcal <- read.csv("C:\\Users\\18057\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\corner_pts_Sample_Mouse.csv")

##Function to tranform DLC output values. Usually use this function to loop through
# several excel sheets. So can be modified  
TransformDLC <- function(x, ppmm){
  df <- as.data.frame(x)
  timeseq <- seq(0,900000,100) #Create time variable 
  points <- c("one", "two", "three", "four", "five", "six", "seven", "eight")
  
  newdf <- data.frame(df[,1])
  
  #Loop through each point and identify which points have likelihood of confidence
  #below 90% and set as NA that will be later interpolated
  for (p in 1:length(points)){
    f <- select(df, contains(points[p]))
    likehood <- grep("likelihood", colnames(f))
    NAs <- which(f[,likehood[1]]<= 0.9)
    
    if (length(NAs)>0){
      f[NAs,c(1:2)] <- NA
      ff <- select(f,!ends_with("likelihood"))
      newdf <- cbind(newdf, ff)
      
    } else{
      ff <- select(f, !ends_with("likelihood"))
      newdf <- cbind(newdf, ff)
    }
  }
  #interpolate NA values
  col_interpolate <- colnames(newdf)[2:ncol(newdf)]
  
  for(c in col_interpolate){
    newdf[[c]] <- na.approx(newdf[[c]], na.rm=FALSE) #will keep NAs at the start and end of the dataframe. 
  }
  
  #create columns that take information from file name to assign for subject and experiment
  newdf <- newdf %>%
    mutate_if(is.character, as.numeric)%>% 
    mutate(subject= str_sub(dforigname,4,10), experiment=str_sub(dforigname, 1,3), time=timeseq[1:nrow(df)])%>%
    relocate(subject, experiment, time, .before=one_x)
  
  #remove underscores from data set
  newdf[] <- lapply(newdf, function(x) {
    # If the column is character type, remove underscores
    if (is.character(x)) {
      return(gsub("_", "", x))
    } else {
      return(x)
    }
  })
  
  #calculate px/mm ratio and multiply all points with that value. Calculation was with points of corner to corner of mouse eye. Which is 6mm
  col_ratio <- colnames(newdf)[5:ncol(newdf)]
  ratio_calc <- subset(ppmm, subject==unique(newdf$subject) & experiment==unique(newdf$experiment))
  newdf <- newdf%>% 
    mutate(dist=sqrt((ratio_calc$x1-ratio_calc$x2)^2 + (ratio_calc$y1-ratio_calc$y2)^2))%>%
    mutate(ratio=3.6/dist)
  ratiof <- function(x,na.rm=F){
    (x*newdf$ratio)
  }
  
  newdf <- newdf[seq(1, nrow(newdf), 2),] # to downsample data to 5hz
  
  newdf <- newdf%>%
    mutate_at(vars(col_ratio), list(mm=ratiof))%>%
    mutate(odist1= sqrt((one_x-five_x)^2 + (one_y-five_y)^2), 
            odist2= sqrt((two_x-six_x)^2 + (two_y-six_y)^2),
            odist3= sqrt((three_x-seven_x)^2 + (three_y-seven_y)^2),
            odist4= sqrt((four_x-eight_x)^2 + (four_y-eight_y)^2),
            dist1= sqrt((one_x_mm-five_x_mm)^2 + (one_y_mm-five_y_mm)^2), 
            dist2= sqrt((two_x_mm-six_x_mm)^2 + (two_y_mm-six_y_mm)^2),
            dist3= sqrt((three_x_mm-seven_x_mm)^2 + (three_y_mm-seven_y_mm)^2),
            dist4= sqrt((four_x_mm-eight_x_mm)^2 + (four_y_mm-eight_y_mm)^2))%>%
    select(!ends_with(c("x","y","mm")))%>%
    group_by(time)%>%
    mutate(pupilorig = mean(c(odist1,odist2,odist3,odist4), na.rm=T),pupilmm = mean(c(dist1,dist2,dist3,dist4),na.rm=T))%>%
    ungroup()%>%
    select(!starts_with(c("o","dist","ratio","df")))
  
  #get max pupil valus during first 10s
  maxval <- max(subset(newdf, time<=10000)$pupilmm, na.rm=T)
  
  #normalize pupil based off max pupil value and apply .5s rolling median filter to remove any noise
  newdf['pupilnorm'] <- medfilt1(newdf$pupilmm/maxval, n=5)
  newdf['pupilmm'] <- medfilt1(newdf$pupilmm, n=5)
  newdf['pupilorig'] <- medfilt1(newdf$pupilorig, n=5)
  
  
  return(newdf)
}

#Step 4. Run data through TransformDLC function to get original pupil diameter in pixel, metric, and normalized
x <- dforig
ppmm <- dfcal

df <- TransformDLC(x,ppmm)

# Step5. Sample plots of pupil 
pupilorigplot<-ggplot(subset(df,time<=120000), aes(time,pupilorig)) + geom_line() +scale_x_continuous(breaks=seq(0,120000,30000), limits=c(0,120000)) +
    scale_y_continuous(breaks=seq(0,160,40), limits=c(0,160))+
    labs(title='Pupil before conversion', x='Time (ms)', y='Pupil Diameter (a.u.)')

pupilmmplot<-ggplot(subset(df,time<=120000), aes(time,pupilmm)) + geom_line() +scale_x_continuous(breaks=seq(0,120000,30000), limits=c(0,120000)) +
  scale_y_continuous(breaks=seq(0,3,.6), limits=c(0,3))+
  labs(title='Pupil converted to mm', x='Time (ms)', y='Pupil Diameter (mm)')

pupilnormplot<-ggplot(subset(df,time<=120000), aes(time,pupilnorm)) + geom_line() +scale_x_continuous(breaks=seq(0,120000,30000), limits=c(0,120000)) +
  scale_y_continuous(breaks=seq(0,1,.2), limits=c(0,1))+
  labs(title='Pupilmm normalized', x='Time (ms)', y='Normalized pupil (% max diameter)')


# Step 6. Save plots as pdfs that can be opened later to be formated 
pdf(file="C:\\Users\\18057\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Hab_SampleMouse\\Samplemouseplot.pdf")
cowplot::plot_grid(pupilorigplot, pupilmmplot, pupilnormplot, nrow = 2, ncol=2)
dev.off()


# Step 7. Save transformed data 
write.csv(df, "C:\\Users\\18057\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\processed_pupildata.csv")
