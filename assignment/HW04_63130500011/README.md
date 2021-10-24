# R-Assignment 4

**Created by Thanakrit Cankha (ID: 63130500011)**

Choose Dataset:
Superstore Sales Dataset (Data from Rohit Sahoo,[Kaggle](https://www.kaggle.com/rohitsahoo/sales-forecasting)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv)

### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)

# Dataset
store <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv");

glimpse(store);
```
ข้อมูลภายใน Dataset
```
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73, 3.87, 3.87, 3.95, 3.85, 3.94, 3.75, 4.10~
$ Reviews         <dbl> 3829, 1406, 0, 1658, 1325, 117, 5938, 1817, 2093, 0, 160, 481, 33, 1255, 593, 417, 80, 279, 370, 2092, 27, 676, 16, 12~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Responsive Web Design Overview For Beginner~
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throughout, the emphasis is on promoting a pla~
$ Number_Of_Pages <dbl> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288, 392, 304, 336, 542, 192, 242, 224, 412,~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "Paperback", "Hardcover", "Hardcover", "Har~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 14.364706, 14.502941, 14.641176, 15.229412~
```
ภายใน dataset ประกอบไปด้วยข้อมูลจำนวน 271 Row และ 7 Columns โดยที่
- Rating : คะแนนหนังสือ
- Reviews : จำนวนความคิดเห็น
- Book_title : ชื่อหนังสือ
- Description : คำอธิบาย
- Number_Of_Pages : จำนวนของหนังสือ
- Type : รูปแบบหนังสือ
- Price : ราคาหนังสือ

1.ตรวจว่าข้อมูลใน Dataset มีตัวที่ค่าเป็น null หรือไม่
```
is.na(topBook) %>% table()
```
Result:
```
FALSE 
 1897 
```
2.สรุปข้อมูลของ Dataset เบื้องต้น
```
topBook %>% select(-Book_title, -Description, -Type,) %>% summary()

```
Result:
```
     Rating         Reviews       Number_Of_Pages      Price        
 Min.   :3.000   Min.   :   0.0   Min.   :  50.0   Min.   :  9.324  
 1st Qu.:3.915   1st Qu.:   5.5   1st Qu.: 289.0   1st Qu.: 30.751  
 Median :4.100   Median :  35.0   Median : 384.0   Median : 46.318  
 Mean   :4.067   Mean   : 185.6   Mean   : 475.1   Mean   : 54.542  
 3rd Qu.:4.250   3rd Qu.: 116.5   3rd Qu.: 572.5   3rd Qu.: 67.854  
 Max.   :5.000   Max.   :5938.0   Max.   :3168.0   Max.   :235.650  
```
## Part 2: Learning function from Tidyverse

- Function `select()` from package [dplyr](https://dplyr.tidyverse.org/reference/select.html). : เลือกเฉพาะคอมลัมน์ที่เราต้องการให้แสดงผลออกมา
```
topBook %>% select(Book_title,Price,Rating)
```
Result:
```
   Book_title                                                                             Price Rating
   <chr>                                                                                  <dbl>  <dbl>
 1 The Elements of Style                                                                   9.32   4.17
 2 The Information: A History, a Theory, a Flood                                          11      4.01
 3 Responsive Web Design Overview For Beginners                                           11.3    3.33
 4 Ghost in the Wires: My Adventures as the World's Most Wanted Hacker                    12.9    3.97
 5 How Google Works                                                                       13.2    4.06
 6 The Meme Machine                                                                       14.2    3.84
 7 Start with Why: How Great Leaders Inspire Everyone to Take Action                      14.2    4.09
 8 Algorithms to Live By: The Computer Science of Human Decisions                         14.4    4.15
 9 Weapons of Math Destruction: How Big Data Increases Inequality and Threatens Democracy 14.5    3.87
10 ZX Spectrum Games Code Club: Twenty fun games to code and learn                        14.6    4.62
# ... with 261 more rows
```
- Function `filter()` from package [dplyr](https://dplyr.tidyverse.org/reference/filter.html). : เลือกเฉพาะข้อมูลที่ตรงกับเงื่อนไขที่เรากำหนด
```
topBook %>% select(Book_title,Price) %>% filter(Price > 30)
```
Result:
```
   <chr>                                                                            <dbl>
 1 Code: The Hidden Language of Computer Hardware and Software                       30.5
 2 Computability and Logic                                                           31.0
 3 Eloquent JavaScript: A Modern Introduction to Programming                         31.0
 4 Does God Play Dice?: The New Mathematics of Chaos                                 31.2
 5 Learn Java the Easy Way : A Hands-On Introduction to Programming                  31.5
 6 Make Your Own Neural Network: An In-depth Visual Introduction For Beginners       31.7
 7 The Golden Ticket: P, Np, and the Search for the Impossible                       32.8
 8 Pro Git                                                                           33.1
 9 Automate the Boring Stuff with Python: Practical Programming for Total Beginners  33.1
10 Best of Game Programming Gems                                                     33.5
# ... with 194 more rows
```

- Function `arrange()` from package [dplyr](https://dplyr.tidyverse.org/reference/arrange.html). : เรียงข้อมูลจากน้อยไปมากตามคอลัมน์ที่กำหนด
```
topBook %>% select(Book_title,Rating) %>% arrange(Rating)
```
Result:
```
   Book_title                                                                                                                           Rating
   <chr>                                                                                                                                 <dbl>
 1 Advanced Game Programming: A Gamedev.Net Collection                                                                                    3   
 2 Cross-Platform Game Programming (Game Development) (Charles River Media Game Development)                                              3   
 3 Lambda-Calculus, Combinators and Functional Programming                                                                                3   
 4 Game Programming Golden Rules                                                                                                          3.2 
 5 Beginning Java 2                                                                                                                       3.22
 6 Sams Teach Yourself JavaScript in 24 Hours                                                                                             3.32
 7 Responsive Web Design Overview For Beginners                                                                                           3.33
 8 Unity Virtual Reality Projects                                                                                                         3.37
 9 Sams Teach Yourself Perl in 24 Hours                                                                                                   3.38
10 3D Game Engine Design: A Practical Approach to Real-Time Computer Graphics (The Morgan Kaufmann Series in Interactive 3D Technology)   3.45
# ... with 261 more rows
```

## Part 3: Transform data with dplyr and finding insight the data

### 1.
```
```
Result:
```
```


### 2. 
```
```
Result :
```
```


### 3. 

```
```
Result :
```
```


### 4. 
```
```
Result :
```
```


### 5. 
```
```
Result :
```
```


### 6. 
```
```
Result :
```
```

## Part 4: Visualization with GGplot2
### 1. 
```
```
Result:
![Graph 1]()



### 2.
```
```
Result:
![Graph 2]()


