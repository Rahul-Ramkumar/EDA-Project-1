#Loading the Data:

Data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#converting the Date and Time variables to Date/Time classes:
  
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
Data_Final <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
Data_Final$dateTime <- strptime(paste(Data_Final$Date, Data_Final$Time), "%Y-%m-%d %H:%M:%S")

#Plot 2:

Data_Final$dateTime <- as.POSIXct(Data_Final$dateTime)
plot(Data_Final$Global_active_power ~ Data_Final$dateTime, ylab = "Global Active Power (kilowatts)", xlab = "", type= "l") 

#Saving the image file:

dev.copy(png, file = "plot2.png", height = 480, width = 480) 
dev.off() 