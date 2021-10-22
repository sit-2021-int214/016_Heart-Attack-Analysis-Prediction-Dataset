## Exploration Data
### Step 0 : Add Library
```r
library(stringr)
library(readr)
library(assertive)
library(dplyr)

heart <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/016_Heart-Attack-Analysis-Prediction-Dataset/b432f56eabee0a2092e7f08f5846b774e0290e21/heart-attack-analysis-prediction-dataset.csv")
```
* ดาวน์โหลดและเพิ่ม Library จำเป็นต้องใช้
* Original Dataset : [Heart Attack Analysis & Prediction Dataset](https://www.kaggle.com/rashikrahmanpritom/heart-attack-analysis-prediction-dataset)
### Step 1 : Observe Data
```r
glimpse(heart)
```
Result :
```
Rows: 303
Columns: 14
$ age      <int> 63, 37, 41, 56, 57, 57, 56, 44, 52, 57, 54, 48, 49, 64, 58, 50, 58, 66, 43, 69~
$ sex      <int> 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, ~
$ cp       <int> 3, 2, 1, 1, 0, 0, 1, 1, 2, 2, 0, 2, 1, 3, 3, 2, 2, 3, 0, 3, 0, 2, 0, 2, 3, 1, ~
$ trtbps   <int> 145, 130, 130, 120, 120, 140, 140, 120, 172, 150, 140, 130, 130, 110, 150, 120~
$ chol     <int> 233, 250, 204, 236, 354, 192, 294, 263, 199, 168, 239, 275, 266, 211, 283, 219~
$ fbs      <int> 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, ~
$ restecg  <int> 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ~
$ thalachh <int> 150, 187, 172, 178, 163, 148, 153, 173, 162, 174, 160, 139, 171, 144, 162, 158~
$ exng     <int> 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, ~
$ oldpeak  <dbl> 2.3, 3.5, 1.4, 0.8, 0.6, 0.4, 1.3, 0.0, 0.5, 1.6, 1.2, 0.2, 0.6, 1.8, 1.0, 1.6~
$ slp      <int> 0, 0, 2, 2, 2, 1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 1, 2, 0, 2, 2, 1, 2, 2, 1, 2, 2, ~
$ caa      <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, ~
$ thall    <int> 1, 2, 2, 2, 2, 1, 2, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2, 2, 2, 3, 2, ~
$ output   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ~
```
* มี 303 Observations และมี 14 Variables

### Step 2 : Dataset Summary
```r
summary(heart)
```
Result :
```
      age             sex               cp            trtbps           chol            fbs        
 Min.   :29.00   Min.   :0.0000   Min.   :0.000   Min.   : 94.0   Min.   :126.0   Min.   :0.0000  
 1st Qu.:47.50   1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:120.0   1st Qu.:211.0   1st Qu.:0.0000  
 Median :55.00   Median :1.0000   Median :1.000   Median :130.0   Median :240.0   Median :0.0000  
 Mean   :54.37   Mean   :0.6832   Mean   :0.967   Mean   :131.6   Mean   :246.3   Mean   :0.1485  
 3rd Qu.:61.00   3rd Qu.:1.0000   3rd Qu.:2.000   3rd Qu.:140.0   3rd Qu.:274.5   3rd Qu.:0.0000  
 Max.   :77.00   Max.   :1.0000   Max.   :3.000   Max.   :200.0   Max.   :564.0   Max.   :1.0000  
    restecg          thalachh          exng           oldpeak          slp             caa        
 Min.   :0.0000   Min.   : 71.0   Min.   :0.0000   Min.   :0.00   Min.   :0.000   Min.   :0.0000  
 1st Qu.:0.0000   1st Qu.:133.5   1st Qu.:0.0000   1st Qu.:0.00   1st Qu.:1.000   1st Qu.:0.0000  
 Median :1.0000   Median :153.0   Median :0.0000   Median :0.80   Median :1.000   Median :0.0000  
 Mean   :0.5281   Mean   :149.6   Mean   :0.3267   Mean   :1.04   Mean   :1.399   Mean   :0.7294  
 3rd Qu.:1.0000   3rd Qu.:166.0   3rd Qu.:1.0000   3rd Qu.:1.60   3rd Qu.:2.000   3rd Qu.:1.0000  
 Max.   :2.0000   Max.   :202.0   Max.   :1.0000   Max.   :6.20   Max.   :2.000   Max.   :4.0000  
     thall           output      
 Min.   :0.000   Min.   :0.0000  
 1st Qu.:2.000   1st Qu.:0.0000  
 Median :2.000   Median :1.0000  
 Mean   :2.314   Mean   :0.5446  
 3rd Qu.:3.000   3rd Qu.:1.0000  
 Max.   :3.000   Max.   :1.0000  
```
### ความหมายของแต่ละ Variables

* Age = อายุของผู้ป่วยกลุ่มตัวอย่าง <int>
* Sex = เพศของผู้ป่วยกลุ่มตัวอย่าง (0 = ผู้หญิง , 1 = ผู้ชาย) <int>
* cp = อาการเจ็บหน้าอกของผู้ป่วยกลุ่มตัวอย่าง
      * 0 : อาการเจ็บหน้าอกที่เกี่ยวข้องกับโรคหัวใจขาดเลือดโดยตรง
      * 1 : อาการเจ็บหน้าอกที่ไม่สามารถระบุได้ชัดเจนว่าเกี่ยวข้องกับโรคหัวใจขาดเลือดหรือไม่หรือไม่
      * 2 : อาการเจ็บหน้าอกที่ไม่เกี่ยวกับโรคหัวใจขาดเลือด
      * 3 : ไม่มีอาการเจ็บหน้าอก
* trtbps = ความดันเลือดในขณะที่ร่างกายกำลังพักผ่อน
* chol = ปริมาณคอเลสเตอรอลที่ถูกวัดค่าโดย BMI Sensor
* fbs = ปริมาณน้ำตาลในเลือดมากกว่า 120 มิลลิกรัมต่อเดซิลิตร (0 = False , 1 = True)
* restecg = ผลบันทึกคลื่นไฟฟ้าหัวใจขณะพัก
* thalachh = อัตราการเต้นหัวใจสูงสุดที่บันทึกได้
* exng = การออกกำลังกายส่งผลให้เกิดอาการเจ็บหน้าอกหรือไม่ (0 = False , 1 = True)
* caa = 
* output = ค่าของคนที่มีโอกาสเกิดโรคหัวใจ (0 = คนที่มีโอกาสน้อยที่จะเกิดโรคหัวใจ , 1 = คนที่มีแนวโน้มสูงที่จะเกิดโรคหัวใจ)

### Step 3 : Analyze Data
      #### ทำการตรวจสอบชุดข้อมูล
      * ตรวจสอบหาข้อมูลซ้ำ ใช้ Distinct
      * ตรวจสอบหาค่า NA
      * เปลี่ยน variable ของ sex จาก 0,1 เป็น female และ male
      #### ทำการคัดข้อมูลที่ไม่ได้ใช้ออก
      * thall (ไม่ได้ใช้)
      * slp (ไม่ได้ใช้)
      * oldpeak (ไม่ได้ใช้)