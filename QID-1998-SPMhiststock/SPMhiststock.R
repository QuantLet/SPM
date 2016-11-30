
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("stockres.dat")
h = 0.005  # bandwidth
grid = seq(round(min(x), 3) - 0.003, round(max(x), 3) + h, h)  # grid points

# plot histogram
hist(as.matrix(x), grid, probability = T, xlab = "Stock Returns", main = "Ordinary Histogram")
