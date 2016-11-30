
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SPMdenepatri** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : SPMdenepatri

Published in : Nonparametric and Semiparametric Models

Description : 'Computes a kernel estimation of epanechnikov and triangle kernel for net-income data
from the U.K. Family Expenditure Survey.'

Keywords : kernel, kde, estimation, financial, plot, graphical representation, data visualization

See also : MVAkernelfunctions

Author : Awdesch Melzer

Submitted : Thu, November 01 2012 by Dedy Dwi Prastyo

Datafiles : nicfoo.dat

```

![Picture1](SPMdenepatri_1-1.png)

![Picture2](SPMdenepatri_2-1.png)


### R Code:
```r

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
x = read.table("nicfoo.dat")
x = x[, 1]

h = 0.18  # set bandwidth
fh1 = bkde(x, bandwidth = h, "epanech")  # density estimation using 'epanechnikov' kernel
fh2 = bkde(x, bandwidth = h, "triweight")  # density estimation using 'triweight' kenel

# plot
plot(fh1, type = "l", lwd = 2, ylab = "fh", xlab = "x", ylim = c(0, 0.8))
title(paste("Epanechnikov Kernel, h = ", h))

# plot
dev.new()
plot(fh2, type = "l", lwd = 2, ylab = "fh", xlab = "x", ylim = c(0, 0.8))
title(paste("Triweight Kernel, h = ", h))


```
