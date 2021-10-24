# Library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)


# Dataset
Superstore_Sales <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv");

View(Superstore_Sales);

#1 
customerMostBuy <- Superstore_Sales %>% select(`Customer ID`,`Customer Name`,Sales) %>% 
  filter(Superstore_Sales$Sales == min(Superstore_Sales$Sales));

as_tibble(customerMostBuy);

#2
NY_Customer <- Superstore_Sales %>% select(`Customer Name`, City, `Product Name`) %>% 
  filter(City == "New York City");

as_tibble(NY_Customer);

#3
maxsales <- Superstore_Sales %>% select(Sales) %>% max(Superstore_Sales$Sales);

as_tibble(maxsales);


#4
LA_Overmean <- Superstore_Sales %>% select(`Customer ID` , `Customer Name` , Sales , City) %>% filter(Sales >= mean(Sales) , City == "Los Angeles");

as_tibble(LA_Overmean);

#5
countSales <- Superstore_Sales %>% select(Region) %>% count(Superstore_Sales$Region) %>% 
  arrange(desc(n));

as_tibble(countSales);

#6
countcus <- Superstore_Sales %>% select(`Customer Name`) %>% count(Superstore_Sales$`Customer Name`) %>% arrange(desc(n));
as_tibble(countcus);

#ggplot

Category_plot <- ggplot(Superstore_Sales, aes(x= Category)) + geom_bar(); 

Category_plot + ggtitle("Number of Sales Category") +
  xlab("Category") + ylab("Sales")

Country_plot <- ggplot(Superstore_Sales, aes(x = Sales, y = Category))+
  geom_bar(stat="identity")+
  scale_x_continuous(breaks=c(50000 ,250000 ,450000 ,650000 ,850000));

Country_plot + ggtitle("Total of Sales Category") +
  xlab("Total Sales") + ylab("Category");