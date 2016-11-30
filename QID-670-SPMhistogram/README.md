
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SPMhistogram** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : SPMhistogram

Published in : Nonparametric and Semiparametric Models

Description : Computes a histogram for stock returns data with binwidth h = 0.02 and origin x0 = 0.

Keywords : 'plot, graphical representation, data visualization, histogram, financial, returns,
asset, binwidth'

See also : 'SPMhisdiffbin, SPMhisdiffori, SPMhistmse, SPMhiststock, SPMstockreturnhisto,
SPMHistoConstruct, SPMhistobias2, SPMbuffahisto'

Author : Marlene Mueller

Submitted : Mon, March 15 2010 by Lasse Groth

Datafiles : stockres.txt

Input: 
- x0: origin
- h: binwidth

```

![Picture1](SPMhistogram-1.png)


### R Code:
```r

# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.csv("stockres.txt") 
x = unlist(x)

x0 = 0     # Origin
h  = 0.02  # Binwidth

# Select bins
breaks = function(x, x0, h) {
    b = floor((min(x) - x0)/h):ceiling((max(x) - x0)/h)
    b = b * h + x0
    return(b)
}

# Plot histogram
hist(x, freq = FALSE, breaks = breaks(x, x0, h), main = "Histogram of Stock Returns", 
    xlab = "Data x", ylab = "Histogram")
```
