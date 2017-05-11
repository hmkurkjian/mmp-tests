## Analysis of Weight Experiment May 9, 2017

## to detect evaporation differences between MMPs and standard 96-well plates
## and edge effects

setwd("C:/Users/hmkur/Dropbox/Documents/Berkeley/Bacterial Networks Project/Data/Weight 20170509")

weights <- read.csv("weights.csv", header=T)

head(weights)

outs <- c("A1","A2","A3","A4","A5","A6","A7","A8","A9","A10","A11","A12",
          "B1","B12","C1","C12","D1","D12","E1","E12","F1","F12","G1","G12",
          "H1","H2","H3","H4","H5","H6","H7","H8","H9","H10","H11","H12")

weights <- na.omit(weights)

weights$inorout <- ifelse(weights$Well %in% outs, "out", "in")

head(weights)
tail(weights)

edgeeffects <- lm(Weight ~ Treatment*inorout, data=weights)
summary(edgeeffects)

boxplot(Weight ~ Treatment*inorout, data=weights)
