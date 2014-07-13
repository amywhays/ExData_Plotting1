

md <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';', stringsAsFactors=FALSE)
colnames(md) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

dt <- paste(md$Date, md$Time, sep=" ")


datetime <- strptime(dt, format="%d/%m/%Y %H:%M:%S")

data <- cbind(datetime, md)

png(filename="./ExData_Plotting1/plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts) ", type="l")


dev.off()