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

ts_gap <- ts(dat$Global_active_power, frequency = 1, 
   start = 0)

par(mfcol = c(1,1))

plot(ts_gap, xaxt = "n", xlab = "",
     ylab = "Global Active Power (kilowatts)")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Sun", "Mon", "Tue")) 
# I "cheated" by manually finding out that July 1, 2007, was a Sunday.
# Then I hardcoded the labels. If there's an easy way to find
# the three-letter abbreviation of the week and then generate the 
# same for the following two days automatically, please let me 
# know when you give feedback. Thanks!

dev.copy(png, file = "plot2.png")
dev.off()

# DateTime = paste(dat$Date, dat$Time, sep = " ") 
# DateTime = strptime(DateTime, "%d/%m/%Y %H:%M:%S") 
# dat <- cbind(dat,DateTime)
