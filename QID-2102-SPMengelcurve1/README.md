
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SPMengelcurve1** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : SPMengelcurve1

Published in : Nonparametric and Semiparametric Models

Description : Computes the regression of food on net-income for the UK 1973 expenditure data.

Keywords : nonparametric, regression, plot, graphical representation, data visualization

See also : SPMengelcurve, SPMengelconf, SPMengelconfsample, SPMspline, SPMsplineregression

Author : Awdesch Melzer

Submitted : Wed, January 16 2013 by Maria Osipenko

Datafiles : agg73sh.dat

```

![Picture1](SPMengelcurve1-1.png)


### R Code:
```r

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

```
