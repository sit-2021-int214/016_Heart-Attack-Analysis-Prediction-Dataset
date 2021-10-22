## Library
library(stringr)
library(readr)
library(assertive)
library(dplyr)

#Data set
heart <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/016_Heart-Attack-Analysis-Prediction-Dataset/b432f56eabee0a2092e7f08f5846b774e0290e21/heart-attack-analysis-prediction-dataset.csv")

#Remove Duplicate
heart <- heart %>% distinct()

#Check NA
length(which(is.na(heart)))

#
heart$sex[heart$sex == 0] <- "female"
heart$sex[heart$sex == 1] <- "male"
heart$sex