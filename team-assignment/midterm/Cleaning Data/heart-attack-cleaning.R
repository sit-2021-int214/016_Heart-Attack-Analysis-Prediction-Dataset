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

#Change datatype Numberic to Charactors 
#Chagne 0 to feamale and 1 to male
heart$sex[heart$sex == 0] <- "female"
heart$sex[heart$sex == 1] <- "male"

#Remove unused columns
##Remove oldpeak columns
heart$oldpeak <- NULL
##Remove slp columns
heart$slp <- NULL
##Remove thall columns
heart$thall <- NULL

#Export to CSV
write.csv(heart,"C:\\Users\\Neko7687\\Desktop\\214\\016_Heart-Attack-Analysis-Prediction-Dataset\\team-assignment\\midterm\\Cleaning Data\\heart-attack-cleaning.csv")


