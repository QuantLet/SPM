
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("KernSmooth")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# load data
x = read.csv("fes76.txt", sep = ";", dec = ".")
x = x[, c("NIC", "FOO")]
x = x[order(x$NIC), ]

# plot
plot(x, col = "lightblue", pch = 20, main = "Engel Curve")  # Plot data points
mh = locpoly(x$NIC, x$FOO, degree = 0, kernel = "normal", bandwidth = 20)  # Nadaraya-Watson regression
lines(mh, lwd = 2)
mh1 = locpoly(x$NIC, x$FOO, degree = 1, kernel = "normal", bandwidth = 20)  # Local linear regression
lines(mh1, col = "blue", lwd = 2)
legend("topright", c("NadWat", "LocLin"), col = c("black", "blue"), lwd = c(1, 2))
