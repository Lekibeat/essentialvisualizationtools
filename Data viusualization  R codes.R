DATA VISUALIZATION

#All Datasets used are R-base Dataset from the Dataset Package


data(mtcars)
## BAR CHART VISUALIZATION Cylinder and Gears in mtcars

barza <- table(mtcars$cyl,mtcars$gear)
barza
View(barza)
barplot(barza, main = 'Automobile cylinder by Number of Gear in a car', col = c('Pink','orange','purple'), legend = rownames(barza), xlab ='Number of Gears', ylab='Frequency')
View(mtcars)




##Histogarm of Frequency of Temperature values in Airquality Dataset

data(airquality)
View(airquality)
hist(airquality$Temp, col = 'purple', main = 'Maximum Daily Temp', xlab = 'Temprature(in degrees)')



##Heat Maps

#Heat maps shows intensity of the relationship btw two variable
#SImulate a dataset of 20 points(rnorm to generate random numbers)
eex <- rnorm (20, mean = rep(1:5,each = 4), sd=0.7)
eey <- rnorm (20, mean = rep(c(1,19),each = 10), sd=0.1)

dataFrame <- data.frame(eex=eex,eey=eey)
set.seed(143)
#To plot Heatmap, you need to make use of a matrix
dataMatrix <- as.matrix(dataFrame)[sample (1:20),]
heatmap(dataMatrix)



##Scatter Plots

##Ozone and Temperature for month of August in airquality
with(subset(airquality, Month ==8), plot(Temp,Ozone,col = 'midnightblue', pch=20, cex=1.2)) #( pch and cex defines the width features on my plot)


## Box Plots
# Ploting the mpg and cyl columns in Mtcars as a  boxplot 

mtcars <- transform(mtcars, cyl=factor(cyl))
class(mtcars$cyl)
boxplot(mpg~cyl, mtcars, xlab ='Numbers of cylinders', ylab = 'Miles per Gallon', main = 'Miles per Gallon for Automobile Cylinder', cex.main = 1.2) #cex.main have the main title(font)
##box plot check for outlier outside the box plot



## Corellogram
#before you plot a corellogram pls plot a correlation matrix of your dataset
#Corrplot Package is used to plot a corellogram
library(corrplot)
#your dataset must be of the numeric class
as.numeric(mtcars)
class(mtcars)
data(mtcars) 
#converting to a correlation matrix
corr_matrix <- cor(mtcars)
corrplot(corr_matrix,method = 'circle', type = 'lower')



##Area Charts
#Area Charts are used to express continuity
library(dplyr) #for data manipulation
library(ggplot2) #for visualization
data(airquality)
airquality %>%
  group_by(Day)%>%
  summarise(mean_wind = mean(Wind)) %>%
  ggplot() + geom_area(aes(x = Day, y= mean_wind)) +labs(title = "Area Chart of Average wind per Day", subtitle = "using airquality data", y = "Mean Wind")


#It is encouraged that you do a more inductive study on these visualization tools. Please note that for accuracy, you need to make use of the appropriate data visualization tool for your dataset. 