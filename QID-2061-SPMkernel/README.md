
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SPMkernel** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : SPMkernel

Published in : Nonparametric and Semiparametric Models

Description : 'Plots different kernel functions: uniform, triangle, epanechnikov, quartic,
gaussian.'

Keywords : 'kernel, uniform, Epanechnikov, quartic, gaussian, plot, graphical representation, data
visualization'

See also : SPMkernelregression, SPMsplinekernel, SPMkernelcontours

Author : Andrija Mihoci, Awdesch Melzer, Dedy D. Prastyo

Submitted : Thu, November 15 2012 by Dedy Dwi Prastyo

```

![Picture1](SPMkernel-1.png)


### R Code:
```r

# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# Different Kernel Functions
u = seq(-3, 3, 0.01)
K_Uniform      = 0.5 * (abs(u) <= 1)                   # kernel of uniform distribution
K_Triangle     = (1 - abs(u)) * (abs(u) <= 1)          # kernel of triangle distribution
K_Epanechnikov = 0.75 * (1 - u^2) * (abs(u) <= 1)      # epanechnikov kernel
K_Quartic      = 0.9375 * (1 - u^2)^2 * (abs(u) <= 1)  # kernel of quadratic biweighted distribution
K_Gaussian     = 0.3989 * exp(-0.5 * u^2)              # kernel of a gaussian distribution

# Plot Kernels
par(mfrow = c(2, 3))
plot(u, K_Uniform, type = "s", col = "blue3", ylim = c(0, 1), ylab = "", xlab = "", 
    lwd = 2.5)
title("Uniform")
plot(u, K_Triangle, type = "s", col = "blue3", ylim = c(0, 1), ylab = "", xlab = "", 
    lwd = 2.5)
title("Triangle")
plot(u, K_Epanechnikov, type = "s", col = "blue3", ylim = c(0, 1), ylab = "", xlab = "", 
    lwd = 2.5)
title("Epanechnikov")
plot(u, K_Quartic, type = "s", col = "blue3", ylim = c(0, 1), ylab = "", xlab = "", 
    lwd = 2.5)
title("Quartic (biweight)")
plot(u, K_Gaussian, type = "s", col = "blue3", ylim = c(0, 1), ylab = "", xlab = "", 
    lwd = 2.5)
title("Gaussian")


```
