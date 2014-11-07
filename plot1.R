# Exploratory Data Analysis
# Course Project 1
# Plot 1
# Make red histogram using global active power data

# LIBRARIES
# dplyr is ASSUMED to be an installed package
library(dplyr)

# DOWNLOAD DATA FILE
# Data file is assumed downloaded.
# Data file is assumed to be manually unzipped.
# Data file is assumed to be in same directory as this code.

# LOAD DATA
# Read first 70000 rows, which contains relevant rows
data <- read.csv("./household_power_consumption.txt",nrows=70000,sep=";",
                 stringsAsFactors=F)

# FILTER RELEVANT ROWS using regex
data <- filter(data,grepl("[12]/2/2007",data$Date))

# MUTATE THIS COL TO NUMERIC
data <- mutate(data,Global_active_power=as.numeric(Global_active_power))

# OPEN png graphics device
png(filename="./plot1.png",width=480,height=480,bg="transparent")

# I compare two blobs:
# https://github.com/givens/ExData_Plotting1/blob/master/plot1.png
# https://github.com/givens/ExData_Plotting1/blob/master/figure/unnamed-chunk-2.png

# WHAT I NOTICE about Roger Peng's 1st Plot
# Background is transparent (hatched or gray pattern).
# Histogram with red bars
# X-label exists
# Y-label exists
# Title exists
# Plot box is square

# PLOT histogram
hist(data$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power",
     col="red")

# SAVE png file
dev.off()