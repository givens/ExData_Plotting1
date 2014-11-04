# Exploratory Data Analysis
# Course Project 1
# Plot 1
# Make red histogram using global active power data
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
data <- read.csv("./household_power_consumption.txt",nrows=70000,sep=";",
                 stringsAsFactors=F)

# FILTER RELEVANT ROWS using regex
data <- filter(data,grepl("[12]/2/2007",data$Date))

# SELECT RELEVANT COL
#data <- select(data,Global_active_power)
# unnecessary?

# MUTATE THIS COL TO NUMERIC
data <- mutate(data,Global_active_power=as.numeric(Global_active_power))

# PLOT histogram
hist(data$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power",
     col="red")

# SAVE png file
dev.copy(png,file="plot1.png")
dev.off()