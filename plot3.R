# Exploratory Data Analysis
# Course Project 1
# Plot 3
# Plot three time-series plots in different colors, and a legend

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
data <- read.csv("./household_power_consumption.txt",
                 nrows=70000,
                 sep=";",
                 stringsAsFactors=F)

# FILTER RELEVANT ROWS using regex
data <- filter(data,
               grepl("[12]/2/2007",
                     data$Date))

# MUTATE Cols to Numeric
data <- mutate(data,
               Sub_metering_1=as.numeric(Sub_metering_1),
               Sub_metering_2=as.numeric(Sub_metering_2),
               Sub_metering_3=as.numeric(Sub_metering_3))

# WHAT I NOTICE about Roger Peng's 3rd Plot
# Background is transparent (hatched or gray pattern).
# Three time-series plots
# Legend exists with border
# X-axis is relabled.
# Y-label exists.
# Plot box is square.

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

# OPEN png graphics device
png(filename="./plot3.png", width=480, height=480,bg="transparent")

# PLOT TIME SERIES
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
     c(1,len/2+1,len+1),
     c("Thu","Fri","Sat"))

# Add legend
legend("topright",
       lty="solid",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# SAVE png file
dev.off()
