number <- c(10.4, 5.6, 3.1, 6.4, 21.7)
var(number)
median(number)
sd(number, na.rm = FALSE)
sum(number,na.rm = FALSE)
mean(number)
#average = 9.44
#sum = 47.2
#median = 6.4 
#sd = 7.33846 
#variance = 53.853









names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# Or using Function
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

length(names)
names[19]

#The numbers of movies = 27
#Finding the 19th movies name = "Avengers: Infinity War"
#Which year is most released movies = 2021,2017