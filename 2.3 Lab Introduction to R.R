# 2.3 Lab: Introduction to R

# 2.3.1 Basic Commands

# defining a vector
x <- c(1, 3, 2, 5) 
x

# defining a vector using =
x = c(1, 6, 2) 
x
y = c(1, 4, 3)

# add two vectors --> should be of same length
length(x) 
length(y)
x+y

# allthe objects we have saved so far
ls()
# to remove th eunwanted objetcs
rm(x, y)
# to remove all objects at once
rm(list = ls())

# to know about a function
?matrix

# create a matrix
x <- matrix(data = c(1, 2, 3, 4), nrow = 2, ncol = 2) 
x

# can escape the nrow, ncol features and simply porvide the required attributes
x <- matrix(c(1, 2, 3, 4), 2, 2)
x

# to populate by raws
matrix(c(1, 2, 3, 4), 2, 2, byrow = TRUE)

# get the quare root of matrix/vector
sqrt(x)
# get 2 power
x^2

# a vector of random normal variables, with first argument n the sample size
x <- rnorm(50)
# by default rnorm() creates standard normal random variables with a mean of 0 and a sd of 1
y <- x + rnorm(50, mean = 50, sd = .1)
cor(x, y)

# to reproduce the exact same set of random numbers
set.seed(1303)
rnorm(50)

# whenever we perform calculations involving random quantities. 
# In general this should allow the user to re- produce our results
set.seed(3)
y <- rnorm(100)
mean(y)
var(y)
sqrt(var(y)) #sd
sd(y) 

# 2.3.2 Graphics

x <- rnorm(100)
y <- rnorm(100)
plot(x, y)
plot(x, y, xlab = "this is the x-axis",
       ylab = "this is the y-axis", main = "Plot of X vs Y")

# to save the output
pdf("Figure.pdf") # create pdf
jpeg("Figure.jpeg") # create jpeg
plot(x, y, col = "green")
# done creating the plot
dev.off()

# create a sequence of numbers
# makes a sequence of numbers between 1 and 10
x <- seq(1, 10) 
x
# same with less callings
x <- 1:10
x
# makes a sequence of 50 numbers between -pi and piwith equally spaced 
x <- seq(-pi, pi, length = 50)
x

# contour plots for three-dimensional dat

y <- x
f <- outer(x, y, function(x, y) cos(y) / (1 + x^2))
contour(x, y, f)
contour(x, y, f, nlevels = 45, add = T)

fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels = 15)

# Heat maps (to plot temperature in weather forecast)

#works the same way as contour(), 
#except that it produces a color-coded plot
#colors depend on the z value
image(x, y, fa)

#to produce a three-dimensional plot
persp(x, y, fa)

# theta and phi control the angles at which the plot is viewed
persp(x, y, fa, theta = 30) 
persp(x, y, fa, theta = 30, phi = 20)
persp(x, y, fa,theta = 30, phi = 70)
persp(x, y, fa,theta = 30, phi = 40)

# 2.3.3 Indexing Data

A <- matrix(1:16, 4, 4)
A
A[2, 3]
A[c(1, 3), c(2, 4)]                                                       
A[, 1:2]
A[1, ]
# keep all rows or columns except those indicated
A[-c(1, 3), ]

#number of rows followed by the number of columns of a given matrix
dim(A)

# 2.3.4 Loading Data

Auto = read.csv("/Users/uvini/Downloads/auto.csv", header=TRUE, na.strings='?',stringsAsFactors = T)
View(Auto)
head(Auto)

dim(Auto)
Auto[1:4, ]

# omit nulls
Auto <- na.omit(Auto)
dim(Auto)

#check variables
names(Auto)

# 2.3.5 Additional Graphical and Numerical Summaries

plot(Auto$cylinders, Auto$mpg)
# alternative way
attach(Auto)
plot(cylinders, mpg)

#converts quantitative variables into qualitative variables
cylinders <- as.factor(cylinders)

# box plots wioll be generated automatically for qualitatives
plot(cylinders, mpg)
# customisation
plot(cylinders, mpg, col = "red")
plot(cylinders, mpg, col = "red", varwidth = T)
plot(cylinders, mpg, col = "red", varwidth = T, horizontal = T)
plot(cylinders, mpg, col = "red", varwidth = T, xlab = "cylinders", ylab = "MPG")

# histograms
hist(mpg)
hist(mpg, col = 2)
hist(mpg, col = 2, breaks = 15)

# scatterplot matrix
pairs(Auto)
# for a subset of varibles
pairs(
  ~mpg + displacement + horsepower + weight + acceleration, 
  data = Auto
  )

plot(horsepower, mpg)
# value of a particular variable for points on a plot
# Then clicking one or more points in the plot and hitting Escape 
#will cause R to print the values of the variable of interest
identify(horsepower, mpg, name)

# numerical summary 
summary(Auto)
summary(mpg)







