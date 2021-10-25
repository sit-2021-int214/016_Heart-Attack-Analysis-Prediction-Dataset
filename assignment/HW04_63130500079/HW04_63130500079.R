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
#?????? na
is.na(topbook) %>% table()
#summary
topbook %>% select(-Book_title, -Description, -Type,) %>% summary()
#????????????????????? reviews ????????? char ???????????? number
topbook$Reviews <- gsub(",","",topbook$Reviews)
topbook$Reviews <- as.numeric(topbook$Reviews)
typeof(topbook$Reviews)
#Part2
## ??????????????????????????? output ??????????????????????????????????????????????????????????????? ?????????????????????????????? head ??????????????????????????????
##select
head(topbook %>% select(Book_title,Price,Rating))
##filter
head(topbook %>% select(Book_title,Price) %>% filter(Price < 30))
##arrange
head(topbook %>% select(Book_title,Rating) %>% arrange(desc(Rating), .by_group = TRUE)) 

#Part3

#3.1
topbook %>% count(Type) %>% arrange(desc(n))

#3.2
topbook %>% select(Book_title , Rating , Price) %>% filter(Price == min(Price)) 

#3.3
topbook %>% select(Book_title,Rating) %>% arrange(desc(Rating)) %>% head(n=10)

#3.4
topbook %>% select(Book_title,Rating,Price) %>% arrange(desc(Price)) %>% head(n=10) 

#3.5
topbook %>% group_by(Type) %>% summarise(avr_price = mean(Price))

#3.6
topbook %>% select(Reviews,Book_title,Price) %>% arrange(desc(Reviews)) %>% head(n=10)

#3.7
sum(topbook$Reviews)

#3.8
topbook %>% filter(Rating > "4.5") %>% select(Reviews,Book_title,Rating) %>% arrange(desc(Reviews)) %>% head(n=5) 


#Part4
#4.1
topbook %>% filter(Rating > "4.5") %>% ggplot(aes(x=Rating)) + geom_bar() + ggtitle("Number of type book")

topbook %>% arrange(desc(Reviews)) %>% head(n=5) %>% ggplot(aes(x=Price,y=Rating))+ geom_point() +
  geom_point(aes(color=Type))+ ggtitle("Relation between Rating and Price of book 4.5 Star+") + geom_smooth(method="lm")
