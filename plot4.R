# Exploratory Data Analysis
# Course Project 1
# Plot 4
# Plot two-by-two grid of plots
# Givens, 04Nov2014

# LIBRARIES
# dplyr is assumed to be an installed package
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

# Do quartz
#quartz(bg="transparent")

# png graphics device
png(filename="plot4.png", width=480, height=480,bg="transparent")

# Start Plotting
par(mfcol=c(2,2),
    cex.lab=0.8,
    cex.axis=0.8,
    pty="m")

# Some changes:
# change background color to gray
# reduce margin sizes:  mar, omi
# reduce text sizes on x- and y-labels:  cex.lab
# reduce text size on axis:  cex.axis
# reduce text size on legend: cex
# remove black line around legend:  bty="n"
# change plot's length to width ratio

# plot 1,1
# note change in y-label
len = nrow(data)
plot(1:len,data$Global_active_power,
     type="l",
     xlab=NA,
     ylab="Global Active Power",
     xaxt="n")
axis(1,
     c(1,len/2,len),
     c("Thu","Fri","Sat"))

# plot 2,1
len = nrow(data)
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
     c(1,len/2,len),
     c("Thu","Fri","Sat"))

# Add legend
legend("topright",
       lty="solid",
       bty="n",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.9)

# reduce margin sizes
# reduce text sizes on x- and y-labels
# make plots wider


# plot 1,2
len = nrow(data)
plot(1:len,data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage",
     xaxt="n")
axis(1,
     c(1,len/2,len),
     c("Thu","Fri","Sat"))

# plot 2,2
plot(1:len,data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power",
     cex.axis=0.8,
     cex.lab=0.8,
     xaxt="n")
axis(1,
     c(1,len/2,len),
     c("Thu","Fri","Sat"),
     cex.axis=0.8)

# close device
dev.off()
