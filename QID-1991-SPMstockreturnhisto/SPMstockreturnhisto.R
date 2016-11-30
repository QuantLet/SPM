
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("stockres.dat")
y = seq(-0.2, 0.2, 0.02)

# plot
his = hist(as.matrix(x), y, xlab = "Data x", main = "Histogram of Stock Returns")
