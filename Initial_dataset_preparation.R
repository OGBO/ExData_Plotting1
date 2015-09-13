if(file.exists("exdata-data-household_power_consumption.zip"))
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
consfl <- unzip(temp)
unlink(temp)

pwr <- read.table(consfl, header=T, sep=";")
View(pwr)
# Convert dates to Date class
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")

# Subset dataset to select required dates in 2007
subs <- pwr[(pwr$Date=="2007-02-01") | (pwr$Date=="2007-02-02"),
str(subs)
# Change Column data types from Xter to Numeric
subs$Global_active_power <- as.numeric(as.character(subs$Global_active_power))
subs$Global_reactive_power <- as.numeric(as.character(subs$Global_reactive_power))
subs$Voltage <- as.numeric(as.character(subs$Voltage))
# Convert Date & time to POSIXct format
subs <- transform(subs, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
# Change Column data types from Xter-(factor) to Numeric
subs$Sub_metering_1 <- as.numeric(as.character(subs$Sub_metering_1))
subs$Sub_metering_2 <- as.numeric(as.character(subs$Sub_metering_2))
subs$Sub_metering_3 <- as.numeric(as.character(subs$Sub_metering_3))
