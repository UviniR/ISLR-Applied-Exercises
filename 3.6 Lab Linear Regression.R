# 3.6.2 Simple Linear Regression

# calling the islr2 library
library(ISLR2)

#checking Boston data set
head(Boston)
#more about the data set
?Boston

#fit regression line
lm.fit <- lm(medv ~ lstat, data = Boston)

# basic details
lm.fit

# more details
summary(lm.fit)

# to check the availability of other pieces of information
names(lm.fit)
coef(lm.fit)
# confidence interval
confint(lm.fit)

# produce confidence intervals and prediction intervals for the prediction of medv for a given value of lstat
predict(lm.fit, data.frame(lstat = (c(5, 10, 15))), interval = "confidence")


predict(lm.fit, data.frame(lstat = (c(5, 10, 15))),
        interval = "prediction")

#plot medv and lstat along with the least squares regression
attach(Boston)
plot(lstat, medv)
abline(lm.fit)

# customise the graph
plot(lstat, medv,col = "blue", pch =20)
abline(lm.fit, lwd = 3,col = "red")

# to split the screen
par(mfrow = c(2, 2))
# to plot diagnostic plots
plot(lm.fit)

# compute the residuals from a linear regression fit
plot(predict(lm.fit), residuals(lm.fit)) 
plot(predict(lm.fit), rstudent(lm.fit))

# Leverage statistics
plot(hatvalues(lm.fit))
# index of the largest element of a vector#
which.max(hatvalues(lm.fit))

# multiple linear regression
lm.fit <- lm(medv ~ lstat + age, data= Boston)
summary(lm.fit)

# regression using all of the predictors
lm.fit <- lm(medv ~ ., data = Boston)
summary(lm.fit)

library(carData)
#variance inflation factors
vif(lm.fit)

# regression using all of the predictors except one
lm.fit1 <- lm(medv ~ . - age, data = Boston)
summary(lm.fit1)
# alternative
lm.fit1 <- update(lm.fit, ~ . - age)

# interaction terms
summary(lm(medv ~ lstat * age, data = Boston))


# non linear Transformation 
#perform a regression of medv onto lstat and lstat2
# quadratic fit
lm.fit2 <- lm(medv ~ lstat + I(lstat^2))
summary(lm.fit2)

# linear fit
lm.fit <- lm(medv ~ lstat)
# quantify the extent to which the quadratic fit is superior to the linear fit
anova(lm.fit, lm.fit2)


par(mfrow = c(2, 2))
plot(lm.fit2)

# a fifth-order polynomial fit
lm.fit5 <- lm(medv ~ poly(lstat, 5))
summary(lm.fit5)
#This suggests that including additional polynomial terms, up to fifth order, 
#leads to an improvement in the model fit! 

# lof transformation
summary(lm(medv ~ log(rm), data = Boston))

# carseats data
head(Carseats)

# qualitative predictors will give rise to dummy variables
lm.fit <- lm(Sales ~ . + Income:Advertising + Price:Age, data = Carseats)
summary(lm.fit)

attach(Carseats)
# coding that R uses for the dummy variables
contrasts(ShelveLoc)

# creating a function
LoadLibraries <- function() {
  library(ISLR2)
  library(MASS)
  print("The libraries have been loaded.")
}

# what is in the function
LoadLibraries 

# call the function
LoadLibraries()




