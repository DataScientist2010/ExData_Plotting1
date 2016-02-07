###Exploratory Data Analysis -- Week1
##Assignment: Course Project 1 ---Generating Plot1.PNG


#Setting Working directory
setwd("C:/PersonalFiles/DataScience/Coursera/ExploratoryDataAnalysis/Week1/data")

#Reading data file with date starting [1,2]/2/2007 for all the columns
fileName <- file("household_power_consumption.txt")
housePC <- read.table(text = grep("^[1,2]/2/2007", readLines(fileName), value = TRUE), 
                 col.names = c("Date", "Time", "Global_active_power", 
                               "Global_reactive_power", "Voltage", "Global_intensity", 
                               "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                               sep = ";", header = TRUE)


#Plotting histogram for Gobal active power
hist(housePC$Global_active_power,main = "Global Active Power",col = "Red", xlab = "Global Active Power(Kilowatts)")

#Save the file as "Plot1.png"
dev.copy(png, "Plot1.png")
#png(filename = "Plot1.png", width = 480, height = 480, units="px", pointsize = 12, bg="white",res=NA)
dev.off()

