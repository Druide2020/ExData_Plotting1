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
 
data1.1_Global_activ <- as.character(data1.1[, 3])
data1.1_Global_activ <- data1.1_Global_activ[!is.na(data1.1_Global_activ)]
data1.1_Sub_metering_1 <- as.character(data1.1[, 7])
data1.1_Sub_metering_2 <- as.character(data1.1[, 8])
data1.1_Sub_metering_3 <- as.character(data1.1[, 9])
data1.1_Voltage <- as.character(data1.1[, 5])
data1.1_Global_reac <- as.character(data1.1[, 4])

data1.1_Global_activ <- as.numeric(data1.1_Global_activ)
data1.1_Sub_metering_1 <- as.numeric(data1.1_Sub_metering_1)
data1.1_Sub_metering_2 <- as.numeric(data1.1_Sub_metering_2)
data1.1_Sub_metering_3 <- as.numeric(data1.1_Sub_metering_3)
data1.1_Voltage <- as.numeric(data1.1_Voltage)
data1.1_Global_reac <- as.numeric(data1.1_Global_reac)



png("plot4.png", 480, 480)

par(mfrow= c(2,2)) # Display multiple graphs on the same plot in 2 rows and 2 columns

# Plot 2
plot(data1.1_date_time, data1.1_Global_activ, type= "l", main= "", xlab = "", ylab = "Global Active Power")

# 
plot(data1.1_date_time, data1.1_Voltage, main= "", col= "black", type= "l", xlab= "datetime", ylab= "Voltage")

# Plot 3
plot(data1.1_date_time,data1.1_Sub_metering_1, col= "black", type= "l", main= "", xlab = "", ylab = "Energy sub metering")
points(data1.1_date_time,data1.1_Sub_metering_2, col= "orange", type= "l")
points(data1.1_date_time,data1.1_Sub_metering_3, col= "green", type= "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "orange", "green"), lwd= 1)


plot(data1.1_date_time,data1.1_Global_reac, main= "", col= "black", type= "l", xlab= "datetime", ylab= "Global_reactive_power")

dev.off()

