
## Reading of semi-colon delimited data and subsetting Feb. 1 and 2 2007 data 
raw_data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data_sub <- raw_data[which(raw_data[, 1] == "1/2/2007"|raw_data[, 1] == "2/2/2007"), ]

## Generation of histogram and saving as a png file
png("plot1.png")
hist(data_sub[,3], col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

