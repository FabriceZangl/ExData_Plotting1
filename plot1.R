### Course 4 - week 1 - Assignment 1 ###

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "course4_assignment1.zip")
unzip("course4_assignment1.zip")
df <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = F)
sub_df <- df[df$Date == "1/2/2007"|df$Date == "2/2/2007",]
rm(df)
sub_df$Date <- as.Date(sub_df$Date, "%d/%m/%Y")

### Plot 1
png(filename = "plot1.png", width=480, height=480)
hist(sub_df$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
