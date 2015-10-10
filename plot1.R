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

hist(dat$Global_active_power, col = "red",
     xlab = "Global Active Power (killowatts)", 
     main = "Gloval Active Power")
dev.copy(png, file = "plot1.png")
dev.off()

