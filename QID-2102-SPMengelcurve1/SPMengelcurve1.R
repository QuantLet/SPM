
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
data = read.table("agg73sh.dat")
x = data[, 1]
y = data[, 4]
h = 0.2
mh = ksmooth(x, y, kernel = "normal", bandwidth = h)

# plot
plot(x, y, type = "n", ylab = "Food", xlab = "Net-income", sub = paste("bandwidth, h =", 
    h))
title("Engel Curve")
points(x, y, pch = 19, col = "skyblue", cex = 0.7)
lines(mh, lwd = 2)
