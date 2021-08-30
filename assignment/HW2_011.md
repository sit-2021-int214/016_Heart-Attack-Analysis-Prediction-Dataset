# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) หาค่าเฉลี่ยการเต้นของหัวใจ (Pulse) ของทั้งผู้ชายและผู้หญิง และหาว่ามีค่าเฉลี่ยต่างกันเท่าไหร่
```{R}
avgFemalePulse <- mean(survey$Pulse[survey$Sex == "Female"],na.rm = TRUE) #75.12632
avgMalePulse <- mean(survey$Pulse[survey$Sex == "Male"],na.rm = TRUE) #73.19792
avgFemalePulse - avgMalePulse #1.928399
```

2.) หาค่าเฉลี่ยของอายุ ของทั้งผู้ชาย และผู้หญิง และหาว่ามีมีค่าเฉลี่ยต่างกันเท่าไหร่
```{R}
AgeF <- mean(survey$Age[survey$Sex == 'Female'] , na.rm = TRUE) # 20.40753
AgeM <- mean(survey$Age[survey$Sex == 'Male'] , na.rm = TRUE) # 20.33196
AgeF - AgeM # 0.07557627
```
3.) หาค่าเฉลี่ย Hwt ของแมวตัวเมีย
```{R}
mean(cats$Hwt[cats$Sex == 'F'] , na.rm = TRUE) #9.202128
```
4.) หาค่าความสูงที่มากที่สุด ของนักเรียนที่มีอายุมากกว่า 19 ปี
```{R}
max(survey$Height[survey$Age> 19], na.rm = TRUE) #196
```
5.) หาค่าเฉลี่ย Bwt แมวตัวเมียและตัวผู้ จากนั้นหาว่าต่างกันเท่าไหร่
```{R}
maleWt <- mean(cats$Bwt[cats$Sex == 'M'] , na.rm = TRUE) #2.9
femaleWt <- mean(cats$Bwt[cats$Sex == 'F'] , na.rm = TRUE) #2.359574
maleWt - femaleWt #0.5404255
```


### Team:016-ใจเกเร
1.  จิรสิน  ฉัตร์บรรยงค์  StudentID: 63130500011
2.  ทรรศภูมิ  คงนิธิเฉลิม StudentID: 63130500044
3.  ธนกฤต แคนขา StudentID: 63130500045
4.  นฤเบศร์ ภัทรสัญญา StudentID: 63130500068
5.  ปรียาทร ไชยคำ StudentID: 63130500079
