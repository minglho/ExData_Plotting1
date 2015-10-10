# Precondition: Must have already executed
#    source("plot0.R")
# to create the file "household_power_consumption_subset.txt" 
# containing the data subset for the assignment. 
#
#

#Read data 
dat <- read.table("household_power_consumption_subset.txt", 
           header = TRUE, sep = ";", na.string = "?",
           stringsAsFactors = FALSE)

par(mfcol = c(2,2))  ## 2x2 panels, by columns

# Panel 1
plot(dat$Global_active_power, xaxt = "n", xlab = "", type = "l",
     ylab = "Global Active Power")
axis(side = 1, at = c(1, 1441, 2881), labels = c("Sun", "Mon", "Tue"))
# Assume that the power consumption data is taken once every minute.
# There are 24 * 60 = 1440 minutes in one day.
# Index 1 is the measurement for "1/7/2007 00:00:00". 
# Thus, Index 1441 is for "2/7/2007 00:00:00".

# Panel 2
plot(dat$Sub_metering_1, xaxt = "n", xlab = "", ylim = c(0,80),
     ylab = "Energy sub metering", type = "l", col = "black")

par(new = TRUE)
plot(dat$Sub_metering_2, xaxt = "n", xlab = "", ylab = "", 
     type = "l", col = "red", ylim = c(0,80))

par(new = TRUE)
plot(dat$Sub_metering_3, xaxt = "n", xlab = "", ylab = "", 
     type = "l", col = "blue", ylim = c(0,80))

axis(side = 1, at = c(1, 1441, 2881), labels = c("Sun", "Mon", "Tue")) 

legend("topleft", pch = 19, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
# For the legend, I don't know how to show a line. Using hyphen is 
# short and hard to see. So I use a solid circle. Please show me in 
# your feedback how I can use a long line as the legend symbol.

# Panel 3
plot(dat$Voltage, xaxt = "n", xlab = "datetime", ylab = "Voltage", type = "l")
axis(side = 1, at = c(1, 1441, 2881), labels = c("Sun", "Mon", "Tue"))

# Panel 4
plot(dat$Global_reactive_power, type = "l", xaxt = "n", 
     xlab = "datetime", ylab = "Global Reactive Power")
axis(side = 1, at = c(1, 1441, 2881), labels = c("Sun", "Mon", "Tue"))


dev.copy(png, file = "plot4.png")
dev.off()


