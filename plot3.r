##C4 
## Week 1 assignment 

## Memory:
## memory required = no. of column * no. of rows * 8 bytes/numeric 
##                 = 9 * 2,075,259  * 8 = 149,418,648 bytes = 0.149 GB

library(data.table)


dat <- fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("?",""))
subdat <- dat[Date=="1/2/2007"| Date == "2/2/2007"]
subdat$DateNTime <-paste(subdat$Date, subdat$Time, sep = " ")
newdat <- subdat[,DateNTime:= as.POSIXct(DateNTime,"%d/%m/%Y %H:%M:%S")]

##PLOT3
png(file = "plot3.png", width = 480, height = 480)
plot(newdat$DateNTime, newdat$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(newdat$DateNTime, newdat$Sub_metering_2, col = "red", type = "l")
lines(newdat$DateNTime, newdat$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = c(1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


dev.off()
