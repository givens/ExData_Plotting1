# Exploratory Data Analysis
# Course Project 1
# Plot 2
# Plot time series of global active power

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

# MUTATE THIS COL TO NUMERIC
data <- mutate(data,Global_active_power=as.numeric(Global_active_power))

# WHAT I NOTICE about Roger Peng's 2nd Plot
# Background is transparent.
# One time-series plot
# X-axis is relabled. 
# Y-label exists

# A NOTE ABOUT X-AXIS
# The x-axis is Thu, Fri, and Sat.
# The starting points are
# THURSDAY at 1
# FRIDAY at 1441
# SATURDAY at 2881
# where the number of data points is 2880.
# I confirmed Thursday and Friday start at these rows.
# Saturday starts outside the range because the data
# is Thursday and Friday only. Saturday is the next
# data point.

# OPEN png graphics device
png(filename="plot2.png",width=480,height=480,bg="transparent")

# PLOT TIME SERIES
len = nrow(data)
plot(1:len,data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     xaxt="n")
axis(1,c(1,len/2+1,len+1),c("Thu","Fri","Sat"))

# SAVE png file
dev.off()
