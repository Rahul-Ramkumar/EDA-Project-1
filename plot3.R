#Loading the Data:

Data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#converting the Date and Time variables to Date/Time classes:
  
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
Data_Final <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
Data_Final$dateTime <- strptime(paste(Data_Final$Date, Data_Final$Time), "%Y-%m-%d %H:%M:%S")

#Plot 3:

plot(Data_Final$Sub_metering_1 ~ Data_Final$dateTime, type = "l", ylab = "Energy sub metering", xlab = "") 
lines(Data_Final$Sub_metering_2 ~ Data_Final$dateTime, col = "Red") 
lines(Data_Final$Sub_metering_3 ~ Data_Final$dateTime, col = "Blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, cex = 0.7, col=c("black", "red", "blue"))

#Saving the image:

dev.copy(png, file = "plot3.png", height = 480, width = 480) 
dev.off() 
