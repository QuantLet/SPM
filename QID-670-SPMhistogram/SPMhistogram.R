
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.csv("stockres.txt") 
x = unlist(x)

x0 = 0     # Origin
h  = 0.02  # Binwidth

# Select bins
breaks = function(x, x0, h) {
    b = floor((min(x) - x0)/h):ceiling((max(x) - x0)/h)
    b = b * h + x0
    return(b)
}

# Plot histogram
hist(x, freq = FALSE, breaks = breaks(x, x0, h), main = "Histogram of Stock Returns", 
    xlab = "Data x", ylab = "Histogram")