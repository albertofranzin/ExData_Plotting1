# read dataset
dataset <- read.table("household_power_consumption.txt",
                      header=T,
                      sep=';',
                      stringsAsFactors=F)

# convert relevant columns
dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time), "%Y-%m-%d %H:%M:%S")

# select time period
rows <- which(dataset$Date >= as.Date("01/02/2007", "%d/%m/%Y") &
              dataset$Date <= as.Date("02/02/2007", "%d/%m/%Y"))
dataset <- dataset[rows,]

# draw plot
plot(dataset$Time,
     dataset$Sub_metering_1,
     type="n",
     ylab="Energy sub metering")

lines(dataset$Time,
      dataset$Sub_metering_1,
      col="black")

lines(dataset$Time,
      dataset$Sub_metering_2,
      col="red")

lines(dataset$Time,
      dataset$Sub_metering_3,
      col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1),
       col=c("black", "red", "blue"))

# save to png
dev.copy(png,
         file="plot3.png",
         width=480,
         height=480)
dev.off()
