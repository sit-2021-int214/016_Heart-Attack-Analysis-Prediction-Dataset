## CLEANING DATA

### STEP 1 : REMOVE DUPLICATE
```r
heart <- heart %>% distinct()
```
*ทำการลบข้อมูลที่ซ้ำกันใน data ออกไปก่อน