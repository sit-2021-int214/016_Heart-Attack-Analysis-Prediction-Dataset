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

### 1.ตรวจว่าข้อมูลใน Dataset มีตัวที่ค่าเป็น null หรือไม่
```
is.na(topBook) %>% table()
```
Result:
```
FALSE 
 1897 
```
### 2.สรุปข้อมูลของ Dataset เบื้องต้น
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
books %>% select(Price,Type)
```

- Function `filter()` from package [dplyr](https://dplyr.tidyverse.org/reference/filter.html). : เลือกเฉพาะข้อมูลที่ตรงกับเงื่อนไขที่เรากำหนด
```
books %>% filter(Rating  > 3)
```

- Function `arrange()` from package [dplyr](https://dplyr.tidyverse.org/reference/arrange.html). : เรียงข้อมูลจากน้อยไปมากตามคอลัมน์ที่กำหนด
```
books %>% arrange(Price)
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


