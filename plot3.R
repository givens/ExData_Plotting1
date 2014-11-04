# Exploratory Data Analysis
# Course Project 1
# Plot 3
# Plot three time-series of sub-metering in different colors
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
               Sub_metering_1=as.numeric(Sub_metering_1),
               Sub_metering_2=as.numeric(Sub_metering_2),
               Sub_metering_3=as.numeric(Sub_metering_3))

# PLOT TIME SERIES
len = nrow(data)
plot(1:len,data$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",
     xaxt="n",
     type="n")
lines(1:len,data$Sub_metering_1,col="black")
lines(1:len,data$Sub_metering_2,col="red")
lines(1:len,data$Sub_metering_3,col="blue")

# Label X axis
axis(1,c(1,len/2,len),c("Thu","Fri","Sat"))

# Add legend
legend("topright",lty="solid",
       col=c("black","blue","red"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# SAVE png file
dev.copy(png,file="plot3.png")
dev.off()