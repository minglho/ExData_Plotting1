cat("TITLE extra line", 
    "2 3 5 7", "", 
    "11 13 17", 
    file = "ex.data", sep = "\n")

i = 0
txtln <- readLines("ex.data", n = 1)
while (i <= 10 & length(txtln) > 0) {
    i = i + 1  
    print(txtln)
    txtln <- readLines("ex.data", n = 1)
}
print(i)
