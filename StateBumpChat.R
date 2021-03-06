#In this chart I am using the plotrix package

install.packages("plotrix")
library(plotrix)


#https://rdrr.io/cran/plotrix/man/bumpchart.html

library(tidyverse)
library(readxl)
library(dplyr)
library(tidyr)

#set working directory
setwd("C:/YOUR DIRECTORY")

#load data file
dfo<-read_excel("LP20192020.xlsx", sheet = "Sheet1")

df01<-dfo %>%arrange(desc(`2019`)) %>% top_n(5,`2019`) %>% mutate(group="lp")

#bumpchart function takes in matrices , convert data frame to matrix
dfm<-data.matrix(df01[,2:3])
rnames <- df01$State
rownames(dfm)<- rnames

#label data points with state names and respective values, add a space

vallab<-c(paste(dfm[,2],rownames(dfm),sep="  "),
          paste(rownames(dfm),dfm[,1],sep="  "))
# now show the raw percentages and add central ticks
bumpchart(dfm,labels=vallab,arrows=TRUE,
          length=0.2)

title(main="State Labor Productivity\nTop five states in 2019, their growth in 2020\n\n")
 
#capture image for reporting purposes
dev.copy(png,'StateRanks.png')
 dev.off()


