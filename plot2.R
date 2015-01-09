## Loading the data and converting the date format
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, 
                      comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Retrieve the data within the date range
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Need to convert the dates using POSIX commands
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot the graph using plot()
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Copy from screen device to PNG device
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()