### Course 4 - week 1 - Assignment 1 ###

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "course4_assignment1.zip")
unzip("course4_assignment1.zip")
df <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = F)
sub_df <- df[df$Date == "1/2/2007"|df$Date == "2/2/2007",]
rm(df)
sub_df$Date <- as.Date(sub_df$Date, "%d/%m/%Y")
sub_df$DateTime <- paste(sub_df$Date, sub_df$Time)
sub_df$DateTime <- strptime(sub_df$DateTime, "%Y-%m-%d %H:%M:%S")

### Plot 3
png(filename = "plot3.png", width=480, height=480)
with(sub_df, plot(DateTime, Sub_metering_1, type="n", xlab = "", ylab="Energy Sub Metering"))
lines(sub_df$DateTime,sub_df$Sub_metering_1, col="black")
lines(sub_df$DateTime,sub_df$Sub_metering_2, col="red")
lines(sub_df$DateTime,sub_df$Sub_metering_3, col="blue")
legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()