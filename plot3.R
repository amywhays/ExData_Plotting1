
md <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';', stringsAsFactors=FALSE)
colnames(md) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

dt <- paste(md$Date, md$Time, sep=" ")


datetime <- strptime(dt, format="%d/%m/%Y %H:%M:%S")

data <- cbind(datetime, md)

png(filename="./ExData_Plotting1/plot3.png", width = 480, height = 480)

with(data, plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))
with(data, points(datetime, Sub_metering_2, col="red", type="l"))
with(data, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.off()