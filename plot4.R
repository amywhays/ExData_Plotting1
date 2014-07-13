
## Loading data for Feb. 1-2, 2007, into a data frame 

md <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';', stringsAsFactors=FALSE)

## Adding the column names.

colnames(md) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

## Combining the date and time fields to make it easier to convert the field class.

dt <- paste(md$Date, md$Time, sep=" ")

## Converting to date and time format

datetime <- strptime(dt, format="%d/%m/%Y %H:%M:%S")

## Adding the datetime field to the rest of the data.

data <- cbind(datetime, md)

## Opening the png device.

png(filename="./ExData_Plotting1/plot4.png", width = 480, height = 480)

## Setting up the layout for the graphs
par(mfrow = c(2,2))

## Graphing the 4 plots.
plot(data$datetime, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")

plot(data$datetime, data$Voltage, xlab="datetime", ylab="Voltage ", type="l")

with(data, plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))
with(data, points(datetime, Sub_metering_2, col="red", type="l"))
with(data, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$datetime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

## closing the png device.
dev.off()