# Hypothesis Testing

### Step to do:

0. Assign variables:
   - u0 
   - u1
   - xbar or pbar = 149.6469
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


### Step 0 : Assign variables
``` r
```
### Step 1 : State the hypothesis
``` r
```

### Step 2 : Select Level of significance
``` r
```

### Step 3 : Select Test statistic
```r
```
#### Result
``` r
```
### Step 4 : Finding P-value approach or Critical Value approach
```r
```
#### Result
``` r
```

### Step 5 : Compare P-value with alpha or t with talpha
``` r
```

### Step 6 : Conclusion

