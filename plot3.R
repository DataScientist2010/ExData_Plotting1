###Exploratory Data Analysis -- Week1
##Assignment: Course Project 1 --Generating Plot3.PNG
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

#Plotting for sub_metering_1 ~ Datetime, Plot3.PNG
with(housePC_partial,{plot(Sub_metering_1 ~ Datetime, 
                          xlab="", ylab = "Global Active Power (kilowatts)", type="l")
                         lines(Sub_metering_2 ~ Datetime, col="Red") 
                         lines(Sub_metering_3 ~ Datetime, col="Blue")
                          })
# adding the legend
legend("topright", col = c("black","red","blue"), lty=1, lwd = 2,
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#Save the file as "Plot3.png"
dev.copy(png, "Plot3.png")
#png(filename = "Plot3.png", width = 480, height = 480, units="px", pointsize = 12, bg="white",res=NA)
dev.off()
