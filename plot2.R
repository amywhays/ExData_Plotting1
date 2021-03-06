
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

## Opening the png device and writing the plot to it and then closing it.

png(filename="./ExData_Plotting1/plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts) ", type="l")


dev.off()