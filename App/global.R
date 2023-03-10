# Shiny App sur la classification des étoiles dans le cadre d'un projet ingénieur M2
# Date du projet : novembre 2022
# Auteurs : 
# - Alexandre HOMO alexandre.homo@agrocampus-ouest.fr
# - Marie JOIGNEAU marie.joigneau@agrocampus-ouest.fr
# - Marion MOUSSAY marion.moussay@agrocampus-ouest.fr

### ----- I. INTRODUCTION --------------------
### -- I.1. LIBRARY --------------------------

library(shiny)
library(rAmCharts)
library(colourpicker)
library(data.table)
library(DT)
library(ggplot2)
library(FactoMineR)
library(factoextra)
library(magick)
library(plotly)
library(shinyWidgets)
library(colourpicker)
library(shinythemes)
library(tidyverse)
library(dplyr)
library(Hmisc)
library(corrplot)
library(dplyr)
library(nnet)
library(caret)
library(pls)
library(leaps)
library(RcmdrMisc)
library(heatmaply)
library(visNetwork)
library(ggpubr)
library(rstatix)
library(rpart)
library(visNetwork)
library(plyr)
library(sparkline)
library(car)
library(vip)

### -- I.2. DATASET --------------------------

# We open the table and convert it in data.table :
stars <- fread("./data/stars_by_Marie.csv",sep=",")
stars <- data.table(stars)

stars.V2 <- stars %>% dplyr::rename(temperature = Temperature.K, 
                             luminosite = Luminosity.L.Lo, 
                             rayon = Radius.R.Ro, 
                             magnitude = Absolute_Magnitude.Mv, 
                             couleur = Star_Color, 
                             spectre = Spectral_Class, 
                             type = Star_Type) %>% mutate(type = as.factor(type), 
                                                          couleur = as.factor(couleur), 
                                                          spectre= as.factor(spectre))

levels(stars.V2$type) <- c("Naine brune", "Hyper géante", "Séquence principale", "Naine Rouge", "Super géante", "Naine blanche")
