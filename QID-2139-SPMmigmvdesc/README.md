
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SPMmigmvdesc** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : SPMmigmvdesc

Published in : Nonparametric and Semiparametric Models

Description : 'Computes the descriptive statistics of migration data from Mecklenburg-Vorpommern,
GSOEP 1991.'

Keywords : descriptive, descriptive-statistics, mean, median

See also : SPM2density2D, SPMcontour2D, SPMlogit

Author : Awdesch Melzer

Submitted : Wed, March 20 2013 by Franziska Schulz

Datafiles : migmv.dat

```


### R Code:
```r

# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x  = read.table("migmv.dat")
x1 = x[, c(1, 3, 4, 5, 6)]  # 0-1 variables
x2 = x[, c(2, 7)]  # continuous variables

xvars1 = c("migration intension", "family/friends in west", "unemployed/job loss certain", 
    "city size 10,000-100,000", "female")
xvars2 = c("age (years)", "household income (DM)")
colnames(x1) = xvars1
colnames(x2) = xvars2

# frequency tables for the 0-1 variables
frequency = function(x) {
    tab = list()
    for (i in 1:ncol(x)) {
        tab[[i]] = table(x[, i])
    }
    T1 = as.matrix(apply(x, 2, sum))
    T1 = cbind(T1, nrow(x) - T1)
    colnames(T1) = c("yes", "no")
    T1 = T1/nrow(x1)
    return(T1)
}

# short summary tables for the continuous variables
summarize = function(x) {
    Minimum = apply(x, 2, min)
    Maximum = apply(x, 2, max)
    Mean = apply(x, 2, mean)
    Median = apply(x, 2, median)
    Std.Error = apply(x, 2, sd)
    table = cbind(Minimum, Maximum, Mean, Median, Std.Error)
    return(table = table)
}

frequency(x1)  # frequency table
summarize(x2)  # summary table



```
