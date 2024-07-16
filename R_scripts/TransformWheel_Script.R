## This script is used to convert rotary encoder data into distance travelled and velocity 
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

# Step 2. Read in data
dforig <- read.csv("C:\\Users\\18057\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\HabSample_Mouse_Wheel.csv",header=F)
colnames(dforig) <- c('time','wheel')
dforig$time <- round(dforig$time, digits=-1) #round time since some instances data is about 1 millisecond off. 

#Get basename of file path that will be used to build data frame of wheel data
dforigname<- basename("C:\\Users\\18057\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\HabSample_Mouse_Wheel.csv")

#Function to convert wheel data into distance travelled and velocity
TransformWheel <- function(y, C, r){
  df <- as.data.frame(y)
  df <- df[seq(0, nrow(df), 2),] # downsample data to 5hz
  
  #create columns that take information from file name to assign for subject and experiment
  # also convert wheel data to either be absolute to account for all movement (wheelabs), or to account
  # for movement only in forward direction (wheel_pos), or backward direction (wheel_neg)
  df <- df %>%
    mutate_if(is.character, as.numeric)%>% 
    mutate(subject= str_sub(dforigname,4,10), experiment=str_sub(dforigname, 1,3))%>%
    relocate(subject, experiment, time, .before=wheel)%>%
    mutate(wheelabs = abs(wheel), wheelpos = ifelse(wheel>0, wheel, 0))
  
  #remove underscores from data set
  df[] <- lapply(df, function(x) {
    # If the column is character type, remove underscores
    if (is.character(x)) {
      return(gsub("_", "", x))
    } else {
      return(x)
    }
  })
  
  ratio=C/r
  
  # Convert wheel data to distance travelled and speed. Will only focus on all movement
  newdf <- df%>%mutate(absdist= (wheelabs*ratio),  absspeed=absdist/0.2, 
                       posdist = (wheelpos*ratio), posspeed=posdist/0.2,
                       bothdist = (wheel*ratio), dirspeed=bothdist/0.2,
                       absspeedf=medfilt1(absspeed, n=5), posspeedf=medfilt1(posspeed,n=5), dirspeedf=medfilt1(dirspeed,n=5))
  
  return(newdf)
}

#Step 3. Provide circumference of wheel and resolution of encoder 
C = 67.83
r=1024

#Step 4. Run original wheel data through TransformWheel function
y <- dforig
df <- TransformWheel(y, C, r)

#Step 5. Make plots of wheel data
wheelorigplot <- ggplot(subset(df,time<=900000), aes(time,wheel)) + geom_line() +scale_x_continuous(breaks=seq(0,90000,30000), limits=c(0,90000)) +
  scale_y_continuous(breaks=seq(-20,30,10), limits=c(-20,30))+
  labs(title='Original_Encoder_output', x='Time (ms)', y='Rotary Encoder outpupt')

wheeldist <- ggplot(subset(df,time<=90000), aes(time,absdist)) + geom_line() +scale_x_continuous(breaks=seq(0,90000,30000), limits=c(0,90000)) +
  scale_y_continuous(breaks=seq(0,2,.4), limits=c(0,2))+
  labs(title='Encoder converted to distance', x='Time (ms)', y='Distance moved (cm)')

wheelvel <- ggplot(subset(df,time<=90000), aes(time,absspeed)) + geom_line() +scale_x_continuous(breaks=seq(0,90000,30000), limits=c(0,90000)) +
  scale_y_continuous(breaks=seq(0,10,2), limits=c(0,10))+
  labs(title='Encoder convert to Velocity', x='Time (ms)', y='Velocity (cm/s)')

#Step 6. Save plots as pdf that can later be formatted
pdf(file="C:\\Users\\18057\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\Samplemouseplot_wheel.pdf")
cowplot::plot_grid(wheelorigplot, wheeldist, wheelvel, nrow = 2)
dev.off()

#Step 7. Save data
write.csv(df, "C:\\Users\\18057\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\processed_wheeldata.csv")



####### Optional. Here we provide some functions inspired by Carlsen et al., 2022b to extract out other locomotion measurments
#Separate out bouts of locomotion
locquant <- function(x){
  x2 <- data.frame()
  xs <- x[]
  #create empty columns to flag locomotion bouts and to calculate length of locomotion bout, average speed, and max speed reached during that locomotion bout
  empty_cols <- c('speedthres','boutindex','boutdur','boutvelmean','boutvelmax') 
  xs[,empty_cols] <- 0
  spt <- which(xs$absspeed>0)
  xs$speedthres[spt] <- 1
  
  tstart <- with(rle(xs$speedthres), cumsum(lengths)[values==1]-lengths[values==1] + 1) # start and end of potential locomotor bout
  tend <- with(rle(xs$speedthres), cumsum(lengths)[values==0]-lengths[values==0] + 1)
  if (tend[1]==1){ #if the end of the bout is from the first row (i.e. beginning of session, remove this from the list)
    tend = tend[-1]
  }
  #if the end point of locomotion gets cut off because of session, then will remove that from analysis
  if (setequal(length(tstart), length(tend))!=TRUE){
    tstart= head(tstart,-1)
  }
  
  if (length(tstart)>0){
    for (i in 1:length(tstart)){
      left <- xs$time[tstart[i]]
      right <- xs$time[tend[i]]
      tt <- subset(xs, between(time, left, right)==TRUE)
      dur <- right-left
      maxvel <- max(tt$absspeed)
      meanvel <- mean(tt$absspeed)
      
      #threshold for locomotion is to have movement time over 400ms. 
      if (dur>=400 & maxvel>=1.5){
        xs$boutindex[tstart[i]] <- 'Start'
        xs$boutindex[tend[i]] <- 'Stop'
        xs$boutdur[(tstart[i]):tend[i]]  <- dur
        xs$boutvelmax[(tstart[i]):tend[i]] <- maxvel
        xs$boutvelmean[(tstart[i]):tend[i]] <- meanvel
      }
    }
    xnew <- xs[]
    x2 <- rbind(x2, xnew)
  } else{
    xnew2 <- xs[]
    x2 <- rbind(x2, xnew2)
  }
  return(x2)
}

df2 <- locquant(df)

wheelvel2 <- ggplot(subset(df2,time<=90000), aes(time,absspeed)) + geom_line() +scale_x_continuous(breaks=seq(0,90000,30000), limits=c(0,90000)) +
  scale_y_continuous(breaks=seq(0,10,2), limits=c(0,10))+
  geom_vline(xintercept = subset(df2,time<=90000 & boutindex=='Start')$time, colour='red')+
  labs(title='Velocity with locomotion bouts labeled', x='Time (ms)', y='Velocity (cm/s)')


