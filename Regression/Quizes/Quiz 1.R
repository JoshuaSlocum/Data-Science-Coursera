# Course: Regression
# Date: 1/5/2015
# Quiz 1

# Question 1 --------------------------------------------------------------
# find value of 'u' that minimizes sum(w*(x-u)^2)
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2,1,3,1)
u <- c(0.0025,0.3,0.1471,1.007)

# Answer 1 ----------------------------------------------------------------
# From theory...
mean(w*x)

for(i in u){
  print(sum(w*(x-i)^2))
}


# Question 2 --------------------------------------------------------------
# Fit a regression through the origin and get the slope. Y is the outcome and X is the regressor.
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)


# Answer 2 ----------------------------------------------------------------
# Find beta1
# Can't use cor and sd since line must go through origin (don't center!)
b1 <- sum(x*y) / sum(x^2)



# Question 3 --------------------------------------------------------------
# load mtcars and fit mpg ~ weight. Give the slope
data(mtcars)


# Answer 3 ----------------------------------------------------------------
lm(mpg ~ wt, data = mtcars)


# Question 4 (on paper) ---------------------------------------------------


# Question 5 (on paper)--------------------------------------------------------------


# Question 6 --------------------------------------------------------------
# what is the first measure of x if we normalize x
x       <- c(8.58, 10.46, 9.01, 9.64, 8.86)
x1.norm <- (x[1] - mean(x))/sd(x)


# Question 7 --------------------------------------------------------------
# What is the intercept of the model fitted y ~ x?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

lm(y ~ x)


# Question 8 (on paper) ---------------------------------------------------


# Question 9 --------------------------------------------------------------
# What value minimizes the SSD between points and itself
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
z <- c(0.8, 0.573, 0.36, 0.44)

for(i in z){
  m <- sum((x-i)^2)
  print(m)
}

# aka mean(x)







