exAngina <- count(heart %>% filter(exng == 1))
print(exAngina)
avg_exAngina <- exAngina / count(heart)
paste(round(100*avg_exAngina , 2) , "%")

fig.align = 'center'
head(topbook %>% select(Book_title,Price) %>% filter(Price < 30))
knitr::kable(head(topbook %>% select(Book_title,Price) %>% filter(Price < 30)))
