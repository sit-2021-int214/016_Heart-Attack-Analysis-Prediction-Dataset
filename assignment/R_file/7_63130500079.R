library(dplyr)
library(readr)


# 1.) ---------------

# Sample Data
sample(1:5, 3)

# Sample n rows from a table
mtcars %>% sample_n(2)

# Generated Random Data with Normal Distribution
population_1 <- rnorm(20, mean=65, sd=3.5)
population_1
# Sample Data
sample_1 <- sample(population_1 , 3)
sample_1

# 2.) ---------------

count(starwars)
glimpse(starwars)

# 2.1) ---------------

mean(starwars$height , na.rm =T)

starwars %>%  filter(sex == "male") %>% summarise(avg_height = mean(height , na.rm =T))

# 2.2) ---------------
# Proportion of male
i <- starwars %>% filter(sex == "male") %>% count() %>% pull();i
n <- starwars %>% count() %>% pull();n
p <- i/n; p

# 3.) ---------------

#pnorm (x , mean , sd)
x <- 12
xbar <- 10
sd <- 1
z <- (x-xbar)/sd
z
#Finding Area
prob1 <- pnorm(x, xbar, sd)
prob1
#Finding Z
z1 <- qnorm(prob1)
z1
# 4.) ---------------
n <- 36
sd <- 0.18
xbar <-2.92

alpha <- 0.01
u0 <- 3
#H0: u>=3 , Ha: u<3
z <- (xbar - u0) / (sd/sqrt(n))


# P-value approach
pvalue <- pnorm(z) 
pvalue

# Critical Value approach
zalpha <- qnorm(alpha)
zalpha

# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

