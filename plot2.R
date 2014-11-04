# Exploratory Data Analysis
# Course Project 1
# Plot 2
# Plot time series of global active power
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

# MUTATE THIS COL TO NUMERIC
data <- mutate(data,Global_active_power=as.numeric(Global_active_power))

# OPEN png graphics device
png(filename="plot2.png", bg="transparent")

# PLOT TIME SERIES
len = nrow(data)
plot(1:len,data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     xaxt="n")
axis(1,c(1,len/2,len),c("Thu","Fri","Sat"))
#axis(2)
#box()

# SAVE png file
dev.off()
