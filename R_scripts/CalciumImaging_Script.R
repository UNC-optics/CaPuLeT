## This script contain code to plot out calcium imaging data in the form of a heatmap and to plot out locomotion and pupil data
# Code written by Maria Ortiz-Juza

## Step 1. Install required libraries 
options(stringsAsFactors = FALSE)
library(devtools) # use this to install packages from github repository
library(tidyverse)
library(cowplot)
library(gridExtra)
library(reshape2)
library(dplyr)
library(magrittr)
library(patchwork)
library(data.table)
library(zoo)
library(scales)
library(RColorBrewer)
library(colorspace) #open this library to set colors for figures. and use > choose_palette() to open up palette custom 


## Step 2. Read in data
# Data is compiled to have neuronal traces stacked. There is 78 neurons in data set. 
df <- read.csv("C:\\Users\\mariamag\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\Samplecalciumimagingdf.csv", header=T)

#Step 3. Convert time to seconds instead of milliseconds and plot out first 2 minutes
df.2 <- df%>% mutate(time=time/1000,neuron=as.character(neuron))%>%subset(time<=120)

# Step 4. Plot out wheel and pupillometry data. Since behavior data repeats across all neurons, need to subset just one neuron to get 
# behavior data across entire trial
wheelplot <- ggplot(data=subset(df.2, neuron==1), aes(x=time, y=absspeed)) + geom_line() +
  scale_y_continuous(breaks=seq(0,6,2), limits=c(0,6))+
  scale_x_continuous(breaks=seq(0,120,20), limits=c(0,120)) +
  labs(title="Sample_M1_locomotion", x="Time(seconds)", y="Velocity(cm/s)")

pupplot <- ggplot(data=subset(df.2, neuron==1), aes(x=time, y=pupilmm)) + geom_line() +
  scale_y_continuous(breaks=seq(0,3.5,.5), limits=c(0,3.5))+
  scale_x_continuous(breaks=seq(0,120,20), limits=c(0,120)) +
  labs(title="Sample_M1_locomotion", x="Time(seconds)", y="Pupil (mm)")

# Step 5.Bin neural data across 1 seconds time bin for heatmap
time_bin <- seq(0,120,1) # Change this to your desired time bin

# Aggregate data across time bins
aggregated_data <- df.2 %>%
  mutate(time_bin = cut(time, time_bin, labels = FALSE)) %>%
  group_by(time_bin,neuron) %>%
  summarise(
    trace = mean(traces, na.rm = TRUE)
  )%>% ungroup()

#Step 6. Scale neural trace data
df.a <- aggregated_data %>% mutate(neuron=as.character(neuron))%>%
  group_by(neuron)%>%
  mutate(scaletrace= rescale(trace,to=c(0,8), na.rm=T, finite=T))%>%
  select(neuron,scaletrace,time_bin)%>%ungroup()
df.a <- as.data.frame(df.a)

#Step 7. Convert data to wide format
allneu <- spread(df.a, key=time_bin, value=scaletrace)
rownames(allneu) <- allneu$neuron
allneu <- allneu[,-1]

neu.wide <- data.matrix(allneu) # convert data frame into a matrix
neu.wide <- reshape2::melt(neu.wide)

#Step 8. Specify color range and colors for neural heatmap
col.ranged=c(0,8)
dpalramp <-colorRampPalette(brewer.pal(9,"Blues"))(256)

#Step 9. Plot out heatmap using ggplot library
nheat<-ggplot(neu.wide, aes(x=Var2, y=Var1, fill=value))+ geom_tile() + scale_fill_gradientn(colours = dpalramp, limits=col.ranged, breaks=col.ranged, na.value=NA) +
  labs(title="Neural_heatmap_2P_example_data", x= "time(s)", y="Neuron", subtitle="n=78")


#Step 10. Save data plots and data
pdf(file="C:\\Users\\mariamag\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Plots\\CalciumImagingFigure.pdf")
print(cowplot::plot_grid(wheelplot, pupplot, ncol=2, nrow=2))
print(nheat)
dev.off()

write.csv(neu.wide, "C:\\Users\\mariamag\\OneDrive - University of North Carolina at Chapel Hill\\Protocol Paper STAR Protocol\\Code\\R_Scripts\\Sample_Mouse_Data\\Calciumimagingdata_aggregated.csv")





