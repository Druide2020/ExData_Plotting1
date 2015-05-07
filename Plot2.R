
# Download the data and saved it into a directory located in the working directory

household_power_consumption_url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(household_power_consumption_url, "household_power_consumption.zip")
unzip("household_power_consumption.zip", exdir = "household_power_consumption")

# Read the data
data1 <- read.table("household_power_consumption.txt", header= TRUE, sep= ";", na= "?")

# Select only the two days of interest

data1.1 <- data1[which(as.character(data1$Date)=="1/2/2007"|as.character(data1$Date)=="2/2/2007"),]
#str(data1.1) # Get a general idea of the data internal structure
#head(data1.1) # Take a look at the first 6 rows
#tail(data1.1) # Take a look at the last 6 rows

# Convert date and time formats
data1.1$Date <- as.Date(data1.1$Date, format= "%d/%m/%Y")
#
date_time <- paste(as.character(data1.1$Date), data1.1$Time)
data1.1_date_time <- as.POSIXct(date_time)

# Make plot


data1.1_Global_Activ <- as.character(data1.1[, 3])

data1.1_Global_Activ <- as.numeric(data1.1_Global_Activ)
 



png("plot2.png", 480, 480)
plot(data1.1_date_time,data1.1_Global_Activ, type= "l", main= "", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()

