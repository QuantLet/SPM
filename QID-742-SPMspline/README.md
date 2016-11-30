
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SPMspline** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : SPMspline

Published in : Nonparametric and Semiparametric Models

Description : Computes the regression of food on net-income for the UK 1976 expenditure data.

Keywords : 'nonparametric, regression, spline, estimation, plot, graphical representation, data
visualization'

See also : 'SPMsplineregression, SPMengelcurve, SPMengelcurve1, SPMengelconf, SPMengelconfsample,
SPMsplinekernel'

Author : Marlene Mueller

Submitted : Wed, December 19 2012 by Dedy Dwi Prastyo

Datafiles : fes76.csv

```

![Picture1](SPMspline-1.png)


### R Code:
```r

# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("splines")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# load data
x = read.csv("fes76.csv", sep = "", dec = ".")
x = x[, c("NIC", "FOO")]
x = x[order(x$NIC), ]

# plot
plot(x, col = "lightblue", pch = 20, main = "Engel Curve: Spline regression")
mh = smooth.spline(x$NIC, x$FOO, df = 10)
lines(x$NIC, fitted(mh))


```
