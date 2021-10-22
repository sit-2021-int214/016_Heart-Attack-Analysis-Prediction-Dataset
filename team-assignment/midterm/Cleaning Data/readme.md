## CLEANING DATA

### STEP 1 : REMOVE DUPLICATE
```r
heart <- heart %>% distinct()
```
* ทำการลบข้อมูลที่ซ้ำกันใน data ออกไปก่อน

### STEP 2 : CHECK NA
```r
length(which(is.na(heart)))
```

* ทำการเช็คข้อมูลว่ามีค่า NA หรือไม่