###Exploratory Data Analysis -- Week1
##Assignment: Course Project 1 --Generating Plot2.PNG
#Setting Working directory
setwd("C:/PersonalFiles/DataScience/Coursera/ExploratoryDataAnalysis/Week1/data")

#Reading total dataset
fileName <- "household_power_consumption.txt"
housePC_Full <- read.csv(fileName, header = TRUE, sep = ";", na.strings = "?",
                           nrows = 2075259, stringsAsFactors = FALSE,check.names = FALSE, 
                           comment.char ="")

housePC_Full$Date <- as.Date(housePC_Full$Date, format = "%d/%m/%Y")
# Subsetting to Feb 1st and 2nd of 2007
housePC_partial <- subset(housePC_Full, Date >= "2007-02-01" & Date <= "2007-02-02")

# Transforming Date and Time into Datetime as one column
Datetime <- paste(as.Date(housePC_partial$Date), housePC_partial$Time )
housePC_partial$Datetime <- as.POSIXct(Datetime)

#Plotting for Gobal active power ~ Datetime, Plot2.PNG
plot(housePC_partial$Global_active_power ~ housePC_partial$Datetime, xlab="", ylab = "Global Active Power (kilowatts)", type="l")

#Save the file as "Plot2.png"
dev.copy(png, "Plot2.png")
#png(filename = "Plot2.png", width = 480, height = 480, units="px", pointsize = 12, bg="white",res=NA)
dev.off()
