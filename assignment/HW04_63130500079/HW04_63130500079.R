#Part1
#Install Package tidyr
install.packages("tidyr")
#Library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)

#Dataset
topbook <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

#View dataset
glimpse(topbook)
View(topbook)

is.na(topbook) %>% table()

topbook %>% select(-Book_title, -Description, -Type,) %>% summary()

#Part2
## ??????????????????????????? output ??????????????????????????????????????????????????????????????? ?????????????????????????????? head ??????????????????????????????
##select
head(topbook %>% select(Book_title,Price,Rating))
##filter
head(topbook %>% select(Book_title,Price) %>% filter(Price < 30))
##arrange
topbook %>% select(Book_title,Rating) %>% arrange(Rating)

#1
topbook %>% count(Type) %>% arrange(n)

#2
topbook %>% select(-Description) %>% filter(Price == min(Price)) 

#3
topbook %>% group_by(Type) %>% summarise(mean_price = mean(Price))

#4
topbook %>% select(Book_title,Rating,Price) %>% arrange(desc(Rating)) %>% head(n=10)

#5
topbook %>% filter(Price < mean(Price)) %>% select(Book_title, Price) %>% arrange(desc(Price)) %>% head(n=5) 

#6
topbook %>% filter(Reviews > 1000) %>% select(Reviews,Book_title,Price) %>% arrange(desc(Reviews))

topbook %>% ggplot(aes(x=Type)) + geom_bar() + ggtitle("Number of type book")

topbook %>% filter(Price < mean(Price)) %>% ggplot(aes(x=Price,y=Rating))+ geom_point() +
  geom_point(aes(color=Type))+ ggtitle("Relation between Rating and Price less than mean") + geom_smooth(method="lm")
