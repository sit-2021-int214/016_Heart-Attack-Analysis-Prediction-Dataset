#Library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)

#Dataset
topComBooks <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv");

#View dataset
glimpse(topComBooks)
View(topComBooks)

is.na(topComBooks) %>% table()

topComBooks %>% select(-Book_title, -Description, -Type,) %>% summary()

topComBooks %>% select(Book_title,Price,Rating)
topComBooks %>% select(Book_title,Price) %>% filter(Price > 30)
topComBooks %>% select(Book_title,Rating) %>% arrange(Rating)

#1
topComBooks %>% count(Type) %>% arrange(n)

#2
topComBooks %>% select(-Description) %>% filter(Price == min(Price)) 

#3
topComBooks %>% group_by(Type) %>% summarise(mean_price = mean(Price))

#4
topComBooks %>% select(Book_title,Rating,Price) %>% arrange(desc(Rating)) %>% head(n=10)

#5
topComBooks %>% filter(Price < mean(Price)) %>% select(Book_title, Price) %>% arrange(desc(Price)) %>% head(n=5) 

#6
topComBooks %>% filter(Reviews > 1000) %>% select(Reviews,Book_title,Price) %>% arrange(desc(Reviews))

topComBooks %>% ggplot(aes(x=Type)) + geom_bar() + ggtitle("Number of type book")

topComBooks %>% filter(Price < mean(Price)) %>% ggplot(aes(x=Price,y=Rating))+ geom_point() +
  geom_point(aes(color=Type))+ ggtitle("Relation between Rating and Price less than mean") + geom_smooth(method="lm")




