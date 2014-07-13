

## Loading data for Feb. 1-2, 2007, into a data frame 

md <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';', stringsAsFactors=FALSE)

## Adding the column names. 

colnames(md) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

## Combining the date and time fields to make it easier to convert the field class.
dt <- paste(md$Date, md$Time, sep=" ")


datetime <- strptime(dt, format="%d/%m/%Y %H:%M:%S")

data <- cbind(datetime, md)

png(filename="./ExData_Plotting1/plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()