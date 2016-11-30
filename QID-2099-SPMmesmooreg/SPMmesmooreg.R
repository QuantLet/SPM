
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("agg73sh.dat")

k = 101
mk = runmed(x[, 4], k, endrule = "median")

# plot
plot(x[, c(1, 4)], type = "n", sub = paste("k =", k), xlab = "Net-income", ylab = "Food")
title("Median Smoothing Regression")
points(x[, c(1, 4)], col = "skyblue", pch = 20, cex = 0.7)
lines(x[, 1], mk, col = "black", lwd = 2)


