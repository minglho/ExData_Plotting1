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

par(mfcol = c(1,1))

plot(dat$Sub_metering_1, xaxt = "n", xlab = "", ylim = c(0,80),
     ylab = "Energy sub metering", type = "l", col = "black")

par(new = TRUE)
plot(dat$Sub_metering_2, xaxt = "n", xlab = "", ylab = "", 
     type = "l", col = "red", ylim = c(0,80))

par(new = TRUE)
plot(dat$Sub_metering_3, xaxt = "n", xlab = "", ylab = "", 
     type = "l", col = "blue", ylim = c(0,80))

# Assume that the power consumption data is taken once every minute.
# There are 24 * 60 = 1440 minutes in one day.
# Index 1 is the measurement for "1/7/2007 00:00:00". 
# Thus, Index 1441 is for "2/7/2007 00:00:00".
axis(side = 1, at = c(1, 1441, 2881), labels = c("Sun", "Mon", "Tue")) 


temp <- legend("topleft", legend = c(" "," "," "), col = c("black", "red", "blue"),
               text.width = strwidth("Sub_metering_3"),
               lty = 1)
text(temp$rect$left + temp$rect$w, temp$text$y,
     c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pos = 2)
# I don't really understand the first two arguments to the function "text".
# I copied them from "?text" and can't really make heads or tail.
# If you can explain it to me, please do so in the feedback for the assignment.

dev.copy(png, file = "plot3.png")
dev.off()

# DateTime = paste(dat$Date, dat$Time, sep = " ") 
# DateTime = strptime(DateTime, "%d/%m/%Y %H:%M:%S") 
# dat <- cbind(dat,DateTime)
