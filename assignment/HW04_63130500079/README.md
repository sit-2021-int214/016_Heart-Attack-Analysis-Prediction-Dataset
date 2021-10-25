# R-Assignment 4

Created by Napasorn Patanadecha (ID: 63130500063)

## Choose Dataset:

2. Superstore Sales Dataset (Data from Rohit Sahoo,[Kaggle](https://www.kaggle.com/rohitsahoo/sales-forecasting)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv)

### What you need to do:

1. Explore the dataset that you have select.
2. Transform data with dplyr and finding insight the dataat least 6 issues. Show your code, result and summary in form of sentence/paragraphs.
3. Using ggplot2 to create 2 graphs and explain each graph.
4. In this part, you need to using command from tidyverse (e.g. lubridate, stringr, forcats) that not learned in class and explain this command how to used it. If you can't implement to this dataset, you can select one command and show example how to used it.
5. Do in Markdown File (md or Rmd) and push into your folder in Team Repository. (Same as Workshop I)
6. Copy link to access this folder and paste into PDF file Part A

### Part 1: Explore the dataset that you have select.
```r
#Install Package tidyr
install.packages("tidyr")
#library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)

#dataset
topbook <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
```

ใช้คำสั่ง glimps() เพื่อดูชุดข้อมูลทั้งหมดและชนิดของชุดข้อมูล
```
glimpse(topbook)
```

Result :
```r
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73, 3.87, 3.87, 3.95, ~
$ Reviews         <chr> "3,829", "1,406", "0", "1,658", "1,325", "117", "5,938", "1,817", "2,093", "0", "160", "481", "3~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Responsive Web Design~
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throughout, the emphasis~
$ Number_Of_Pages <int> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288, 392, 304, 336, 54~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "Paperback", "Hardcov~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 14.364706, 14.502941~
```
ซึ่งในชุดข้อมูลนี้มี จำนวน 271 Rows และ 7 Columns

* Rating : คะแนนความนิยมของหนังสือแต่ละเล่ม
* Reviews : จำรวรความคิดเห็นของผู้อ่าน
* Book_title : ชื่อของหนังสือ
* Description : คำอธิบายของหนังสือ
* Number_Of_Pages : จำนวนหน้าทั้งหมดของหนังสือ
* Type : ประเภทของหนังสือ 
* Price : ราคาของหนังสือ

ตรวจหาค่า null ในชุดข้อมูล
```r
is.na(topbook) %>% table()
```
Result :
```
FALSE 
 1897 
```
สรุปภาพรวมของชุดข้อมูล
```r
topbook %>% select(-Book_title, -Description, -Type,) %>% summary()
```
Result :
```
> topbook %>% select(-Book_title, -Description, -Type,) %>% summary()
     Rating        Reviews          Number_Of_Pages      Price        
 Min.   :3.000   Length:271         Min.   :  50.0   Min.   :  9.324  
 1st Qu.:3.915   Class :character   1st Qu.: 289.0   1st Qu.: 30.751  
 Median :4.100   Mode  :character   Median : 384.0   Median : 46.318  
 Mean   :4.067                      Mean   : 475.1   Mean   : 54.542  
 3rd Qu.:4.250                      3rd Qu.: 572.5   3rd Qu.: 67.854  
 Max.   :5.000                      Max.   :3168.0   Max.   :235.650
```
## Part 2: Learning function from Tidyverse
###### เนื่องจาก output ที่ออกมาดูค่อนข้างยาก จึงใช้แท็ก head ครอบคำสั่ง
* Function `select()` from package [dplyr](https://dplyr.tidyverse.org/reference/select.html). : เลือกเฉพาะคอมลัมน์ที่เราต้องการให้แสดงผลออกมา
```r
topbook %>% select(Book_title,Price,Rating)
```
Result :
```
                                                           Book_title     Price Rating
1                                               The Elements of Style  9.323529   4.17
2                       The Information: A History, a Theory, a Flood 11.000000   4.01
3                        Responsive Web Design Overview For Beginners 11.267647   3.33
4 Ghost in the Wires: My Adventures as the World's Most Wanted Hacker 12.873529   3.97
5                                                    How Google Works 13.164706   4.06
6                                                    The Meme Machine 14.188235   3.84
```

* Function `filter()` from package [dplyr](https://dplyr.tidyverse.org/reference/filter.html). : เลือกเฉพาะข้อมูลที่ตรงกับเงื่อนไขที่เรากำหนด
##### ในที่นี้ได้เลือกหนังสือที่ราคาน้อยกว่า 30
```r
head(topbook %>% select(Book_title,Price) %>% filter(Price < 30))
```
Result :
```
                                                           Book_title     Price
1                                               The Elements of Style  9.323529
2                       The Information: A History, a Theory, a Flood 11.000000
3                        Responsive Web Design Overview For Beginners 11.267647
4 Ghost in the Wires: My Adventures as the World's Most Wanted Hacker 12.873529
5                                                    How Google Works 13.164706
6                                                    The Meme Machine 14.188235
```
* Function `arrange()` from package [dplyr](https://dplyr.tidyverse.org/reference/arrange.html). : เรียงข้อมูลจากมากไปน้อยตามคอลัมน์ที่กำหนด 
##### ในที่นี้ได้กำหนดให้เรียงตอลัมน์ Rating จากคะแนนมากสุดไปน้อยสุด
```r
head(topbook %>% select(Book_title,Rating) %>% arrange(desc(Rating), .by_group = TRUE)) 
```
```
                                                                                                Book_title Rating
1                                                                                  Your First App: Node.js   5.00
2                                                  The Art of Computer Programming, Volumes 1-4a Boxed Set   4.77
3 Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems   4.72
4              Build Web Applications with Java: Learn every aspect to build web applications from scratch   4.67
5                                                 Fluent Python: Clear, Concise, and Effective Programming   4.67
6                                          ZX Spectrum Games Code Club: Twenty fun games to code and learn   4.62
```

## Part 3: Transform data with dplyr and finding **insight the data** at least 6 issues. Show your code, result and summary in form of sentence/paragraphs.

## Part 4: Using ggplot2 to create 2 graphs and explain each graph.

