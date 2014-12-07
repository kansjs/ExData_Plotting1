## Reading of semi-colon delimited data and subsetting Feb. 1 and 2 2007 data 
raw_data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data_sub <- raw_data[which(raw_data[, 1] == "1/2/2007"|raw_data[, 1] == "2/2/2007"), ]

## Generation of date-time sequence for ploting purposes
data_sub[ , 10] <- as.Date(data_sub[ , 1], format="%d/%m/%Y")
data_sub[ , 11] <- paste(data_sub[ , 10], data_sub[ , 2])
v <- strptime(data_sub[ , 11], "%Y-%m-%d %H:%M:%S")

## Generation of plot and saving as a png file
png("plot2.png")
plot(v, data_sub[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
