getData_LineByLine <- function() {
# Precondition: Directory set to where the file is.
#               Data are sorted by chronologically in ascending order.
    
    ## Read original data file
    con <- file("household_power_consumption.txt")
    open(con,"r")
         
    temp = readLines(con, n = 1)
    colNames <- scan(text = temp, what = append(list(),rep("",9)),
                     na.strings = "?", sep = ";", n = 9)

    
    whatlist = append(list("",""), rep(0,7))
    rowData <- data.frame()
    names(rowData) <- colNames
for (i in 1:10) {
    temp = readLines(con, n = 1)
    rowDataTemp <- data.frame(scan(text = temp, what = whatlist, 
                              na.strings = "?", sep = ";", n = 9))
    names(rowDataTemp) <- colNames
    rowData <- rbind (rowData,rowDataTemp)
}
    
    close(con)
} 

getData_dates <- function(from = "01/07/2007", to = "02/07/2007") {
    # Precondition: Directory set to where the file is.
    #               Data are sorted by chronologically in ascending order.
    #               Dates are in the form "%d/%m/%Y"
    
    date.format = "%d/%m/%Y"
    from <- as.Date(from, format = date.format)
    to   <- as.Date(to, format = date.format)
    
    ## Read original data file
    con <- file("household_power_consumption.txt")
    open(con,"r")
    
    consub <- file("household_power_consumption_subset2.txt")
    open(consub, "w")
    
    ## Process header
    temp = readLines(con, n = 1)
    writeLines(temp, consub)
    colNames <- scan(text = temp, what = append(list(),rep("",9)),
                     na.strings = "?", sep = ";", n = 9)

    whatlist = append(list("",""), rep(0,7))
    temp = readLines(con, n = 1)

   
    while (length(temp)>0){


        row <- scan(text = temp, what = whatlist, 
                    na.strings = "?", sep = ";", n = 9, quiet = TRUE)
        row.date <- as.Date(row[[1]], date.format) 
        if (row.date >= from) 
            break
        else
            temp = readLines(con, n = 1)
    } ## Post condition: temp is the first line in the date range or EOF
    
    while (length(temp)>0) {
        row <- scan(text = temp, what = whatlist, 
                    na.strings = "?", sep = ";", n = 9, quiet = TRUE)
        row.date <- as.Date(row[[1]], date.format) 
        if(row.date <= to) {
            writeLines(temp, consub)
            temp = readLines(con, n = 1)
        } else 
            break
    }  ## All lines in the date range written out.
    
if(FALSE) {   
    while (length(temp) > 0 & i <=5){
        writeLines (text = temp, consub)
        temp = readLines(con, n = 1)
        i = i + 1
    }
}
    
    close(con)
    close(consub)
}  


#scan(con, n = 9, sep = ";", na.string = "?",
#what = list("","","","","","","","",""))

## The code below generate x as a list of 1 element. 
## The sole element is a list of 9 empty strings.
## But how can make x into a simple list of 9 empty string?
#> x <- rep("",9)
#> x <- list(rep("",9))
# 
# vs
#
# x <- append(list(),rep("",9))