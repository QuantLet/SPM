# ------------------------------------------------------------------------------
# Book:        SPM - Nonparametric and Semiparametric Modelling
# ------------------------------------------------------------------------------
# Quantlet:    SPMlogitkredit
# ------------------------------------------------------------------------------
# Description  computes various logit and probit fits for the kredit data
# ------------------------------------------------------------------------------
# Usage:       -
# ------------------------------------------------------------------------------
# Inputs:      None
# ------------------------------------------------------------------------------
# Output:      Plot of the regression and data points.
# ------------------------------------------------------------------------------
# Keywords:    regression, logit, probit
# ------------------------------------------------------------------------------
# See also:    -
# ------------------------------------------------------------------------------
# Example:     -
# ------------------------------------------------------------------------------
# Author:      Marlene Mueller, 2009/01/14
# ------------------------------------------------------------------------------
#Close windows and clear variables
graphics.off()
rm(list=ls(all=TRUE))
# install.packages("lattice")
# install.packages("MASS")

library(lattice)
library(MASS)
library(plotly)
library(magick)
setwd("/Users/ruting/Library/Mobile Documents/com~apple~CloudDocs/SPM/SPM_Q")
file  <- read.csv('Datasets/kredit.csv',sep=';',dec='.') #load credit data
y <- 1-file$kredit        # default set to 1
prev    <- (file$moral >2)+0                            # previous loans were OK
employ  <- (file$beszeit >1)+0                          # employed (>=1 year)
dura    <- (file$laufzeit)                              # duration
d9.12   <- ((file$laufzeit >9)&(file$laufzeit <=12)) +0 #  9 < duration <= 12
d12.18  <- ((file$laufzeit >12)&(file$laufzeit <=18))+0 # 12 < duration <= 18
d18.24  <- ((file$laufzeit >18)&(file$laufzeit <=24))+0 # 18 < duration <= 24
d24     <- (file$laufzeit >24)+0                        # 24 < duration
amount  <- file$hoehe                                   # amount of loan
age     <- file$alter                                   # age of applicant
savings <- (file$sparkont > 4)+0                        # savings >= 1000 DM
phone   <- (file$telef==1)+0                            # applicant has telephone
foreign <- (file$gastarb==1)+0                          # non-german citizen
purpose <- ((file$verw==1)|(file$verw==2))+0            # loan is for a car
house   <- (file$verm==4)+0                             # house owner


for (i in c('laufzeit', 'sparkont','alter')){
  if (i == 'laufzeit'){
    Data_1 = file[file$laufzeit == 30,c('sparkont','alter')]
    name_x = 'Income'
    name_y = 'Age'
    title = "Duration fixed at 30"
    dens <- kde2d(Data_1$sparkont, Data_1$alter, n = 50)
    
  }
  
  if (i == 'sparkont'){
    Data_1 = file[file$sparkont == 3,c('laufzeit','alter')]
    name_x = 'duration'
    name_y = 'Age'
    title = "Income fixed at 3"
    dens <- kde2d(Data_1$laufzeit, Data_1$alter, n = 50)
    
  }
  
  if (i == 'alter'){
    Data_1 = file[file$alter == 47,c('laufzeit','sparkont')]
    name_x = 'duration'
    name_y = 'Income'
    title = "Age fixed at 47"
    dens <- kde2d(Data_1$laufzeit, Data_1$sparkont, n = 50)
    
  }
  
  # 3D density plot with fixed Duration
  plot1 <- plot_ly(x = dens$x, y = dens$y, z = dens$z) %>%
    add_surface(showscale = FALSE) %>%
    layout(scene = list(xaxis = list(title = name_x,gridcolor = 'rgb(50, 50, 50)'),
                        yaxis = list(title = name_y,gridcolor = 'rgb(50, 50, 50)'),
                        zaxis = list(title = 'Density',gridcolor = 'rgb(50, 50, 50)')),
           paper_bgcolor = 'rgba(0,0,0,0)',  # Set paper background to transparent
           plot_bgcolor = 'rgba(0,0,0,0)' ,   # Set plot background to transparent
           showlegend = FALSE  
    )
  
  save_plot_as_image <- function(plot, filename) {
    orca(plot, filename)
  }
  
  # Save images for GIF
  image_files <- c()
  for (angle in seq(90, 180, by = 10)) {
    p <- plot1 %>%
      layout(scene = list(camera = list(eye = list(x = 2 * cos(angle * pi / 180), 
                                                   y = 2 * sin(angle * pi / 180), 
                                                   z = 0.5))))
    image_filename <- paste0("plot1_", angle, ".png")
    save_plot_as_image(p, image_filename)
    image_files <- c(image_files, image_filename)
  }
  
  # Create GIF using magick
  images <- image_read(image_files)
  animation <- image_animate(images, fps = 10)
  image_write(animation, paste(title,".gif"))
  
  # Clean up temporary files
  file.remove(image_files)
  
}
  





