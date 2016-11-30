
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


