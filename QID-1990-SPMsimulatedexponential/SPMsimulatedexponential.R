
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

set.seed(0)

n     = 100
beta  = 0.35
data  = -beta * log(runif(n, 0, 1))
histo = hist(data, plot = F)
data  = cbind(data, (0 * data))

# plot
plot(histo, main = "Histogram", xlab = "X", ylab = "Frequency")
points(data)
