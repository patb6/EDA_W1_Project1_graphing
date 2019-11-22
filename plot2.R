
###### Week 1 Programming assignment

# Set working directory to w1
setwd("~/OneDrive/#_DataScience&AI/_COURSERA-JH-Data_Scientist_Toolbox/Exploritory_Data_Analysis/w1")
#setwd("~/Documents/GitHub/ExploratoryDataAnalysis")

### Load required libraries for the project
# pkg <- .packages()
# [1] "lattice"    "lubridate"  "dplyr"      "data.table" "stats"      "graphics"   "grDevices" 
# [8] "utils"      "datasets"   "methods"    "base"   

library(data.table)
library(dplyr)
library(lubridate)

#
#
# Read dataset
df <- fread('./household_power_consumption.txt', header = TRUE, sep = ";",na.strings = "?")

#
#
# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
d_ucidays <- df %>% filter(dmy(Date) >= ymd("2007-02-01") & dmy(Date) <= ymd("2007-02-02"))
#
#Create date-time & day of week variables
d_ucidays$datetime <- strptime(paste(d_ucidays$Date,d_ucidays$Time), "%d/%m/%Y %H:%M:%S")
d_ucidays$wkday <- wday(d_ucidays$Date, label = TRUE)

##--- end common code for assignments.


# Plot 2 Line plot
png(filename = "plot2.png", width = 480, height = 480)
plot(d_ucidays$datetime,d_ucidays$Global_active_power, type = "l",
     main = "",
     ylab = "Global Active Power (kilowatts)", 
     xlab = ""
     )

dev.off()
