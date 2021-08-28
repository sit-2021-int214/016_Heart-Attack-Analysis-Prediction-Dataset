#Assignment 
#ข้อ 1
num <- c(10.4, 5.6, 3.1, 6.4, 21.7)
ave(num)
sum(num)
median(num)
sd(num)

#ข้อ 2.1
# List of Marvel movies (Order by Marvel Phase released)
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)

marvel <- data.frame(names,years)
View(marvel)
#เหตุผลที่ใช้ dataframe เพราะมีข้อมูลเป็นตารางที่จัดเรียงไว้แล้ว ดูรายการได้ง่าย ไม่สับสน

#ข้อ 2.2
length(names)
names[19]
max.col(years)
table(years)
