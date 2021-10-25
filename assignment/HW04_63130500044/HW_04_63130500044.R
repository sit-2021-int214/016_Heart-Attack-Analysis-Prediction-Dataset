library(dplyr)
library(stringr)
library(readr)
library(assertive)
library(tidyr)
library(ggplot2)

#Part1
#DataSet
superstore_sale <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
glimpse(superstore_sale)

#Part2
Select_Customer <- superstore_sale %>% select(`Customer.ID` , `Customer.Name` , Sales , City) 
as_tibble(Select_Customer)

#Part3
#1
superstore_sale %>% select(`Customer.ID` , `Customer.Name` , Sales , City) %>% 
  filter(Sales >= mean(Sales) , City == "Henderson")
#2
superstore_sale %>% group_by(City) %>% summarise("total" = length(City))

#3
superstore_sale %>% select(Product.ID , Product.Name , Sales) %>% filter(Sales == min(Sales))

#4
superstore_sale %>% select(Customer.ID , Customer.Name) %>% group_by(Customer.Name) %>% count(Customer.ID) %>% arrange(desc(n)) %>% head(5) 

#5
superstore_sale %>% select(Sub.Category) %>% count(Sub.Category) %>% arrange(desc(n)) %>% head(1)

#6
superstore_sale %>% select(Category) %>% count(Category) %>% arrange(desc(n))


#Part 4
#1
PlotSC <- ggplot(superstore_sale , aes(x= Sub.Category)) + geom_bar() + theme_minimal()
PlotSC + ggtitle("Number of Sales Sub Category") + xlab("Sub.Category") + ylab("Sales")


#2
SubCategory <- superstore_sale %>% select(Sub.Category) %>% count(Sub.Category) %>% arrange(desc(n)) %>% head(3)

PlotSCNumber <- ggplot(SubCategory , aes(x = SubCategory$Sub.Category , y = SubCategory$n , fill = SubCategory$Sub.Category)) + 
  geom_bar(stat = "identity") + theme_minimal()

PlotSCNumber + scale_fill_manual(values = c("#999999","#E69F00","#56B4E9")) + ggtitle("Total of Sub Category") + xlab("Sub Category") + ylab("Total Number")




