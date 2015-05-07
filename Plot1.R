

# Download the data and saved it into a directory located in the working directory

household_power_consumption_url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(household_power_consumption_url, "household_power_consumption.zip")
unzip("household_power_consumption.zip", exdir = "household_power_consumption")

# Read the data
data1 <- read.table("household_power_consumption.txt", header= TRUE, sep= ";", na= "?")

# Select only the two days of interest

data1.1 <- data1[which(as.character(data1$Date)=="1/2/2007"|as.character(data1$Date)=="2/2/2007"),]
str(data1.1) # Get a general idea of the data internal structure
head(data1.1) # Take a look at the first 6 rows
tail(data1.1) # Take a look at the last 6 rows


# Make plot

#Don't consider any NA values in the dataset
# 
data1.1 <- as.character(data1.1[, 3])
#str(data1.1)
#head(data1.1, 3)
data1.1 <- as.numeric(data1.1)
data1.1 <- data1.1[!is.na(data1.1)] 
str(data1.1)
head(data1.1)

png("plot1.png", 480, 480)
hist(data1.1, col= "orange", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()


