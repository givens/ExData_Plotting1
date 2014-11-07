# Exploratory Data Analysis
# Course Project 1
# Plot 4
# Plot two-by-two grid of plots

# LIBRARIES
# dplyr is ASSUMED to be an installed package
library(dplyr)

# DOWNLOAD DATA FILE
# Data file is assumed downloaded.
# Data file is assumed to be manually unzipped.
# Data file is assumed to be in same directory as this code.

# LOAD DATA
# Read first 70000 rows, which contains relevant rows
# alternately use readline to discover appropriate dates
data <- read.csv("./household_power_consumption.txt",nrows=70000,sep=";",
                 stringsAsFactors=F)

# FILTER RELEVANT ROWS using regex
data <- filter(data,grepl("[12]/2/2007",data$Date))

# MUTATE Cols to Numeric
data <- mutate(data,
               Global_active_power=as.numeric(Global_active_power),
               Global_reactive_power=as.numeric(Global_reactive_power),
               Voltage=as.numeric(Voltage),
               Sub_metering_1=as.numeric(Sub_metering_1),
               Sub_metering_2=as.numeric(Sub_metering_2),
               Sub_metering_3=as.numeric(Sub_metering_3))

# I compare two blobs
# https://github.com/givens/ExData_Plotting1/blob/master/plot4.png
# https://github.com/givens/ExData_Plotting1/blob/master/figure/unnamed-chunk-5.png

# WHAT I NOTICE about Roger Peng's 4th Plot
# Background is transparent (hatched or gray pattern).
# Plot is 2x2 subplots.
# Label text has a cex of 1.0.
# Axis text has a cex of 1.0.
# Legend text has a cex of 1.0.
# Legend does not have border.
# Some labels have changed.
# Plot boxes are not square.

# I checked plot by generating a 504 x 504 image and checking
# against his 504 x 504 image.  I regenerated the plot at
# 480 x 480 per specification.  So, the plot you see is
# 480 x 480.

# A NOTE ABOUT X-AXIS
# The x-axis is Thu, Fri, and Sat.
# The location of the x-tick marks are
# THURSDAY at 1
# FRIDAY at 1441
# SATURDAY at 2881
# where the number of data points is 2880.
# I confirmed Thursday and Friday start at these rows.
# Saturday starts outside the range because the data
# is Thursday and Friday only. Saturday is the next
# data point.

# png graphics device
png(filename="./plot4.png", width=480, height=480,bg="transparent")

# Start Plotting 2x2
par(mfcol=c(2,2),
    cex.lab=1.0,
    cex.axis=1.0,
    pty="m")
len = nrow(data)

# PLOT 1,1
# note change in y-label
plot(1:len,data$Global_active_power,
     type="l",
     xlab=NA,
     ylab="Global Active Power",
     xaxt="n")
axis(1,
     c(1,len/2+1,len+1),
     c("Thu","Fri","Sat"))

# PLOT 2,1
plot(1:len,data$Sub_metering_1,
     xlab=NA,
     ylab="Energy sub metering",
     xaxt="n",
     type="n")
lines(1:len,data$Sub_metering_1,col="black")
lines(1:len,data$Sub_metering_2,col="red")
lines(1:len,data$Sub_metering_3,col="blue")

# Label X axis
axis(1,
     c(1,len/2+1,len+1),
     c("Thu","Fri","Sat"))

# Add legend
legend("topright",
       lty="solid",
       bty="n",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=1.0)

# PLOT 1,2
plot(1:len,data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage",
     xaxt="n")
axis(1,
     c(1,len/2+1,len+1),
     c("Thu","Fri","Sat"))

# PLOT 2,2
plot(1:len,data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power",
     xaxt="n")
axis(1,
     c(1,len/2+1,len+1),
     c("Thu","Fri","Sat"))

# close device
dev.off()
