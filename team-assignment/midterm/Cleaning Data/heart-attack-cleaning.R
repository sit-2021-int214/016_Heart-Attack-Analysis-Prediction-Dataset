exAngina <- count(heart %>% filter(exng == 1))
print(exAngina)
avg_exAngina <- exAngina / count(heart)
paste(round(100*avg_exAngina , 2) , "%")

