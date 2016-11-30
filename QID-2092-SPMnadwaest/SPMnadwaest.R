
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("agg73sh.dat")

h = 0.15
# nadaraya watson kernel regression employing gaussian kernel
mh = ksmooth(x[, 1], x[, 4], kernel = "normal", bandwidth = h)

# plot
plot(x[, 1], x[, 4], pch = 20, col = "cyan", xlab = "Net-income", ylab = "Food", cex = 0.7, 
    sub = paste("Bandwidth, h = ", h))
title("Nadaraya-Watson Estimate")
lines(mh, lwd = 2)


