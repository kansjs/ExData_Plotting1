## Reading of semi-colon delimited data and subsetting Feb. 1 and 2 2007 data
raw_data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data_sub <- raw_data[which(raw_data[, 1] == "1/2/2007"|raw_data[, 1] == "2/2/2007"), ]

## Generation of date-time sequence for ploting purposes
data_sub[ , 10] <- as.Date(data_sub[ , 1], format="%d/%m/%Y")
data_sub[ , 11] <- paste(data_sub[ , 10], data_sub[ , 2])
v <- strptime(data_sub[ , 11], "%Y-%m-%d %H:%M:%S")

## Generation of plot, overlay lines and legend, and saving as a png file
png("plot3.png")
plot(v, data_sub[,7], type = "l", xlab = "", ylab = "Energy sub metering", col = "gray30")
lines(v, data_sub[,8], col = "red")
lines(v, data_sub[,9], col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("gray30", "red", "blue"))
dev.off()







