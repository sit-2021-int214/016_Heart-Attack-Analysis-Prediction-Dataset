# R-Assignment 4

**Created by Naruebet Phattarasanya (ID: 63130500068)**

Choose Dataset:
Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)


### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```
# Library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)

# Dataset
Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)
glimpse(topCompBooks)
```

In this dataset has .....
```
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73, 3.87, 3.87, 3.95, ~
$ Reviews         <dbl> 3829, 1406, 0, 1658, 1325, 117, 5938, 1817, 2093, 0, 160, 481, 33, 1255, 593, 417, 80, 279, 370,~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Responsive Web Design~
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throughout, the emphasis~
$ Number_Of_Pages <dbl> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288, 392, 304, 336, 54~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "Paperback", "Hardcov~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 14.364706, 14.502941~
```


## Part 2: Learning function from Tidyverse

- Function `mutate()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)).  it’s often useful to add new columns that are functions of existing columns.

```
starwars %>% mutate(height_m = height / 100)
```

## Part 3: Transform data with dplyr and finding insight the data

### 1. 5 อันดับแรกของหนังสือประเภท "Hardcover" ที่มีจำนวนการ Reviews มากที่สุด

```
topComputerBooks %>% filter(Type == "Hardcover") %>% arrange(desc(Reviews)) %>% head(n=5) %>% select(-Rating, -Number_Of_Pages, -Description, Rating)
```

Result:

```
  Reviews Book_title                                                                                Type      Price Rating
    <dbl> <chr>                                                                                     <chr>     <dbl>  <dbl>
1    5938 Start with Why: How Great Leaders Inspire Everyone to Take Action                         Hardcover 14.2    4.09
2    3829 The Elements of Style                                                                     Hardcover  9.32   4.17
3    2629 The Phoenix Project: A Novel About IT, DevOps, and Helping Your Business Win              Hardcover 24.3    4.27
4    2093 Weapons of Math Destruction: How Big Data Increases Inequality and Threatens Democracy    Hardcover 14.5    3.87
5    2092 The Innovators: How a Group of Hackers, Geniuses and Geeks Created the Digital Revolution Hardcover 17.2    4.1 
```
//Explain

- อันดับแรกจะทำการ Filter Type ให้เป็น Hardcover ก่่อน
- กำหนดการเรียงลำดับจำนวนการ Review จากมากไปน้อย โดยใช้คำสั่ง arrange()
- กำหนดจำนวนลำดับของผลลัพธ์ที่ต้องการเป็น 5 โดยใช้ head()

### 2. หนังสือมีหน้ามากกว่่า 150 หน้า แต่ไม่เกิน 300 หน้า

```
topComputerBooks %>% arrange(Number_Of_Pages) %>% filter(Number_Of_Pages > 150 & Number_Of_Pages < 300) %>%
select(Book_title, Number_Of_Pages, Price)
```

Result:

```
   Book_title                                                                  Number_Of_Pages Price
   <chr>                                                                                 <dbl> <dbl>
 1 JavaScript: The Good Parts                                                              153  22.7
 2 Think Complexity: Complexity Science and Computational Modeling                         160  39.6
 3 Agile Retrospectives: Making Good Teams Great                                           170  23.8
 4 The Pattern on the Stone: The Simple Ideas that Make Computers Work                     176  22.8
 5 Apprenticeship Patterns: Guidance for the Aspiring Software Craftsman                   176  26.0
 6 The Golden Ticket: P, Np, and the Search for the Impossible                             176  32.8
 7 Learn You a Haskell for Great Good!                                                     176  36.7
 8 DIV, Grad, Curl, and All That: An Informal Text on Vector Calculus                      176  51.2
 9 The It Handbook for Business: Managing Information Technology Support Costs             180  51.2
10 What Is Life? with Mind and Matter and Autobiographical Sketches                        184  21.9
# ... with 56 more rows
```
//Explain

- arrange() จะเป็นการเรียงลำดับ โดย default จะเป็นการเรียงค่าจากน้อยไปมาก
- ตั้งเงื่อนไขของ Number_Of_Pages โดยให้มีค่าอยู่ระหว่าง มากกว่า 150 และ น้อยกว่า 300

### 3. หนังสือมีราคามากกว่าค่าเฉลี่ยของราคาหนังสือทั้งหมด

```
topComputerBooks %>% filter(Price > mean(Price))
```

Result:

```
   Rating Reviews Book_title                         Description                              Number_Of_Pages Type   Price
    <dbl>   <dbl> <chr>                              <chr>                                              <dbl> <chr>  <dbl>
 1   3.91      57 Effective Programming: More Than ~ "Jeff Atwood began the Coding Horror bl~             283 ebook   54.7
 2   4.18     302 Building Microservices: Designing~ "Distributed systems have become more f~             262 Paper~  54.9
 3   4.21       8 Exceptional C++: 47 Engineering P~ "Exceptional C++ shows by example how t~             208 Paper~  56.1
 4   4.25       1 Reviewing Java                     "Reviewing Java provides you with all t~             658 Paper~  56.6
 5   4.35       2 Microsoft Visual C# Step by Step   "Your hands-on guide to Microsoft Visua~             816 Paper~  56.6
 6   4.25     275 Refactoring: Improving the Design~ "As the application of object technolog~             431 Hardc~  57.2
 7   4.19     116 Growing Object-Oriented Software,~ "Foreword by Kent Beck \"The authors of~             345 Paper~  57.2
 8   4.24      26 Modern C++ Design: Generic Progra~ "In Modern C++ Design, Andrei Alexandre~             360 Paper~  58.4
 9   4.46     164 Structure and Interpretation of C~ "Structure and Interpretation of Comput~             657 Paper~  58.9
10   4.46     164 Structure and Interpretation of C~ "There are new implementations of most ~             657 Hardc~  58.9
# ... with 95 more rows
```
//Explain

- mean() คือคำสั่งหาค่าเฉลี่ยของชุดข้อมูลที่เป็นตัวเลข หากต้องการหาข้อมูลที่มีค่ามากกว่าค่า mean ของข้อมูลชุดนั้น ๆ ให้ทำการ filter ค่า price ที่มีค่า Price ที่มีค่ามากกว่า ค่าเฉลี่ยของตัว Price เอง

### 4. ค่า Index ของหนังสือที่มีคำว่า "Machine" อยู่ใน Description

```
result <- grep("[mM]achine", topComputerBooks$Description)
print(result)
```

Result:

```
[1]  12  14  27  29  43 119 122 129 223 229 255 257
```
//Explain

- เนื่องจากคำว่า "Machine" จะมีทั้งตัวอักษร m (เล็ก) และ M (ใหญ่) จึงใส่วงเล็บก้ามปู ([]) ไว้และใส่ตัวอักษรที่เป็นไปได้ทั้งตัวเล็กและตัวใหญ่ เช่น [C]at เป็นต้น
- คำสั่ง grep() มีหน้าที่ในการ จับคู่นิพจน์ต่าง ๆ ที่เหมือนกันใน Vector นั้น ๆ โดยจะ return ค่าเป็น index ทั้งหมดของ String ที่เจอจากการค้นหาจากคำสั่งนี้

### 5. จำนวนของชื่อหนังสือ ที่มีคำว่า "Network" อยู่ในชื่อหนังสือ

```
result2 <- grep("[nN]etwork", topComputerBooks$Book_title)
length(result2)
```

Result:

```
> length(result2)
[1] 4
```
//Explain

- คำสั่ง grep() มีหน้าที่ในการ จับคู่นิพจน์ต่าง ๆ ที่เหมือนกันใน Vector นั้น ๆ โดยจะ return ค่าเป็น index ทั้งหมดของ String ที่เจอจากการค้นหาจากคำสั่งนี้
- เนื่องจาก grep() นั้นจะ return ค่าออกมาเป็น index เนื่องจากเราต้องการจำนวนของ index ทั้งหมดที่เราต้องการ จึงใช้ length() ในการหาจำนวนทั้งหมดของ index นั่นเอง

### 6. คะแนน Rating ที่ต่ำที่สุดของหนังสือในแต่ละ Type

```
topComputerBooks %>% group_by(Type) %>% summarise(Worst_Rating = min(Rating))
```

Result:

```
  Type                  Worst_Rating
  <chr>                        <dbl>
1 Boxed Set - Hardcover         4.49
2 ebook                         3.91
3 Hardcover                     3.45
4 Kindle Edition                3.33
5 Paperback                     3   
6 Unknown Binding               3.87
```
//Explain

- ใช้ group_by ในการจัดกลุ่มของ Type ของหนังสือทั้งหมด
- ใช้ summarise ในการค้นหา Rating ที่ต่ำที่สุดของหนังสือในแต่ละ type โดยหาค่า min ของ Rating

## Part 4: Visualization with GGplot2
### 1.) Graph show relation between height and mass
```
scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))

scat_plot+geom_smooth()
```
Result:

![Graph 1](graph1.png)

**Guideline:
Embed Image by using this syntax in markdown file
````
![Name](imageFile)
````
