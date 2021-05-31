install.packages("plotrix")
library(plotrix)


#https://rdrr.io/cran/plotrix/man/bumpchart.html

library(tidyverse)
library(readxl)
library(dplyr)
library(tidyr)
setwd("G:/DRIVE/LOOKING WORK/LinkedIn Posts/StateAnalysis")

#load data file
#UI claims seasonal adjusted
dfo<-read_excel("LP20192020.xlsx", sheet = "Sheet1")

df01<-dfo %>%arrange(desc(`2019`)) %>% top_n(5,`2019`) %>% mutate(group="lp")

dfm<-data.matrix(df01[,2:3])
rnames <- df01$State
rownames(dfm)<- rnames

vallab<-c(paste(dfm[,2],rownames(dfm),sep="  "),
          paste(rownames(dfm),dfm[,1],sep="  "))
# now show the raw percentages and add central ticks
bumpchart(dfm,labels=vallab,arrows=TRUE,
          length=0.2)
title(main="State Labor Productivity\nTop five states in 2019, their growth in 2020\n\n")
 dev.copy(png,'StateRanks.png')
 dev.off()

# margins have been reset, so use
par(xpd=TRUE)
boxed.labels(1.5,seq(65,90,by=5),seq(65,90,by=5))
par(xpd=FALSE)
