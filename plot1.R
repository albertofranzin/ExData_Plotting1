# read dataset
dataset <- read.table("household_power_consumption.txt",
                      header=T,
                      sep=';',
                      stringsAsFactors=F)

# convert relevant columns
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time), "%Y-%m-%d %H:%M:%S")

# select time period
rows <- which(dataset$Date >= as.Date("01/02/2007", "%d/%m/%Y") &
              dataset$Date <= as.Date("02/02/2007", "%d/%m/%Y"))
dataset <- dataset[rows,]

# draw histogram
hist(dataset$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power Histogram")

# save to png
dev.copy(png,
         file = "plot1.png",
         width = 480,
         height = 480)
dev.off()


