sat <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")

sat$math_score <- as.numeric(sat$math_score)
sat$reading_score <- as.numeric(sat$reading_score)
sat$writing_score <- as.numeric(sat$writing_score)
#1 How many observation of this dataset (before cleaning) ?
sat %>% count()  #485 row
#2  Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
sat %>% duplicated() %>% table() #duplicate 7 row
sat %>% filter(duplicated(sat)) 
#3 How many distinct school in this dataset ? (Know after drop duplicate data)
sat <-
sat %>% distinct()

sat %>% count() #478 row
#4 What is min, max, average, quartile of each part in SAT ?
# --------------------------------------------------------------------
sat %>% filter(math_score == max(math_score,na.rm = T))
sat %>% filter(math_score == min(math_score,na.rm = T))
mean(sat$math_score,na.rm = T )
quantile(sat$math_score,na.rm = T)
# --------------------------------------------------------------------
sat %>% filter(reading_score == max(reading_score,na.rm = T))
sat %>% filter(reading_score == min(reading_score,na.rm = T))
mean(sat$reading_score,na.rm = T )
quantile(sat$reading_score,na.rm = T)
# --------------------------------------------------------------------
sat %>% filter(writing_score == max(writing_score,na.rm = T))
sat %>% filter(writing_score == min(writing_score,na.rm = T))
mean(sat$writing_score,na.rm = T )
quantile(sat$writing_score,na.rm = T)
# --------------------------------------------------------------------
#5  What is min, max, average, quartile of total score in SAT ?

#6  Which school is get highest SAT score ?
