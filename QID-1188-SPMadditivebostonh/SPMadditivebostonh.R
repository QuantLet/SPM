
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("gam")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# load data
x = read.csv2("bostonh.txt", dec = ".")

y   = x$VALUEOFHOME
x1  = log(x$CRIMERATE)
x2  = log(x$NONRETAIL)
x3  = log(x$NOCONCENTRATION)
x4  = log(x$NOOFROOMS)
x5  = log(x$AGE)
x6  = log(x$DISTANCE)
x7  = log(x$TAXRATE)
x8  = log(x$PUPILTEACHER)
x9  = log(x$BLACKPEOPLE)
x10 = log(x$LOWERSTATUS)
x11 = x$RIVER  # add without s()

am  = gam(y ~ s(x1) + s(x2) + s(x3) + s(x4) + s(x5) + s(x6) + s(x7) + s(x8) + s(x9) + 
    s(x10) + x11, family = gaussian)
print(summary(am))
print(coef(am))  # # coefficients of linear parts
plot(am, ask = TRUE)
