
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SPMstockreturnhisto** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : SPMstockreturnhisto

Published in : Nonparametric and Semiparametric Models

Description : Illustrates a histogram of stock returns.

Keywords : plot, graphical representation, data visualization, histogram, financial, returns, asset

See also : SPMhiststock, SPMhistogram, SPMashstock, SPMbuffahisto, SPMHistoConstruct, SPMhistobias2

Author : Awdesch Melzer

Submitted : Wed, October 24 2012 by Dedy Dwi Prastyo

Datafiles : stockres.dat

```

![Picture1](SPMstockreturnhisto-1.png)


### R Code:
```r

# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("stockres.dat")
y = seq(-0.2, 0.2, 0.02)

# plot
his = hist(as.matrix(x), y, xlab = "Data x", main = "Histogram of Stock Returns")

```
