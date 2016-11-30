
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("kknn")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# load data
x = read.csv("fes76.csv", sep = "", dec = ".")
x = x[, c("NIC", "FOO")]
x = x[order(x$NIC), ]

n.grid = 100
NIC.grid = seq(min(x$NIC), max(x$NIC), length = n.grid)
test.grid = data.frame(NIC = NIC.grid, FOO = rep(0, n.grid))

mhuw = kknn(FOO ~ NIC, x, test.grid, k = 50, kernel = "rectangular")  # unweighted knn
mhbw = kknn(FOO ~ NIC, x, test.grid, k = 50, kernel = "biweight")  # biweighted knn

# plot
plot(x, col = "lightblue", pch = 20, main = "Engel Curve: k-NN regression, biweight kernel")
lines(NIC.grid, fitted(mhbw))
dev.new()
plot(x, col = "lightblue", pch = 20, main = "Engel Curve: k-NN regression, rectangular kernel")
lines(NIC.grid, fitted(mhuw))
