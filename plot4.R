
#Loading the data:
  
Data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#converting the Date and Time variables to Date/Time classes:
  
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
Data_Final <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
Data_Final$dateTime <- strptime(paste(Data_Final$Date, Data_Final$Time), "%Y-%m-%d %H:%M:%S")

#Plot 4:
  
Data_Final$dateTime <- as.POSIXct(Data_Final$dateTime) 

par(mfrow = c(2, 2)) 

plot(Data_Final$Global_active_power ~ Data_Final$dateTime, type = "l", ylab = "Global Active Power", xlab = "") 


plot(Data_Final$Voltage ~ Data_Final$dateTime, type = "l") 

plot(Data_Final$Sub_metering_1 ~ Data_Final$dateTime, type = "l", ylab = "Energy sub metering",  
     xlab = "") 
lines(Data_Final$Sub_metering_2 ~ Data_Final$dateTime, col = "Red") 
lines(Data_Final$Sub_metering_3 ~ Data_Final$dateTime, col = "Blue") 
legend("topright", lty = 1, cex = 0.5,  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n") 


plot(Data_Final$Global_reactive_power ~ Data_Final$dateTime, type = "l") 

#saving the image file:

dev.copy(png, file = "plot4.png", height = 480, width = 480) 
dev.off() 
