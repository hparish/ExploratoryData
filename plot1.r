##C4 
## Week 1 assignment 

## Memory:
## memory required = no. of column * no. of rows * 8 bytes/numeric 
##                 = 9 * 2,075,259  * 8 = 149,418,648 bytes = 0.149 GB

library(data.table)

dat <- fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("?",""))
subdat <- dat[Date=="1/2/2007"| Date == "2/2/2007"]

##PLOT1
png(file = "plot1.png", width = 480, height = 480)
hist(subdat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

