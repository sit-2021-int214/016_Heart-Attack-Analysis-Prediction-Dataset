# Hypothesis Testing

### Step to do:

0. Assign variables:
   - u = 149.5695
   - xbar or pbar = 156.6
   - n = 303
   - sd (or sigma) = 22.90516
   - alpha (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha)
3. Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd/sqrt(n))
   - z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
4. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare P-value with alpha or z/t with zalpha/talpha
6. Conclusion
## Define question
ผู้ป่วยที่มีอาการเจ็บหน้าอกประเภทหัวใจขาดเลือด มีอัตราการเต้นสูงสุดของหัวใจที่มากกว่าค่าเฉลี่ยของผู้ป่วยโรคหัวใจทั่วไป

### Step 0 : Assign variables
``` r
#sampledata
HeartInTent <- sample_n(heart,10)
glimpse(carInTent)
#sampledata

xbar <- mean(HeartInTent$thalachh) # 160.7
mue0 <- mean(heart$thalachh) #149.6469
sd_thalachh <- sqrt(var(heart$thalachh))#22.90516
n <- 303
```
### Step 1 : State the hypothesis
``` r
Ho : u <= 149.6469
Ha : u > 149.6469
```

### Step 2 : Select Level of significance
``` r
alpha <- 0.05
```

### Step 3 : Select Test statistic
```r
t_thalach <- -1*(xbar-mue0)/(sd_thalachh/sqrt(n)) 
```
#### Result
``` r
-8.399887
```
### Step 4 : Finding P-value approach or Critical Value approach
```r
# P-value approach
p_value_thalach <- pt(t_thalach, n-1)

# Critical Value approach
cri <- qt(alpha, n-1, lower.tail = FALSE)
```
#### Result
``` r
> p_value_thalach
   8.85
> cri
   1.649915
```

### Step 5 : Compare P-value with alpha or t with talpha
``` r
#with p-value
if(p_value_thalach<=alpha){
  print("reject H0")
}else{
  print("accept H0")
}

#with critical-value
if(t_thalach>=cri){
  print("reject H0")
}else{
  print("accept H0")
}

```
#### Result
``` r
#with p-value
   accept H0
#with critical-value
   accept H0
```

### Step 6 : Conclusion
ผู้ป่วยที่มีอาการเจ็บหน้าอกประเภทหัวใจขาดเลือด มีอัตราการเต้นสูงสุดของหัวใจที่มากกว่าค่าเฉลี่ยของผู้ป่วยโรคหัวใจทั่วไป

