# Welcome to Bikeshare Data Analysis Udacity 2020
# Lazola Makhupula (--Data Analysis & Viz using R--)

library(readr)
chicago <- read_csv("C:/Users/Lazola.Makhupula/OneDrive - mothers2mothers/MITx_Pro/Programming for Data Science_R and Python/R/bikeshare-data-master/chicago.csv")
View(chicago)
new_york_city <- read_csv("C:/Users/Lazola.Makhupula/OneDrive - mothers2mothers/MITx_Pro/Programming for Data Science_R and Python/R/bikeshare-data-master/new_york_city.csv")
View(new_york_city)
washington <- read_csv("C:/Users/Lazola.Makhupula/OneDrive - mothers2mothers/MITx_Pro/Programming for Data Science_R and Python/R/bikeshare-data-master/washington.csv")
View(washington)

# Perform Statistical summary of data (Average, min, max)
summary(chicago)
summary(new_york_city)
summary(washington)


# Histogram to eplore distribution of bike_share trip durations by Year of Birth
Birth_Year <- chicago$`Birth Year`
hist(Birth_Year)
hist(Birth_Year, freq = FALSE)
hist(Birth_Year, probability = TRUE, breaks = 100)


# Measure Trip Duration by Gender and year of birth
#Install packages needed
install.packages("ggplot2")
install.packages("reshape2")
install.packages("gridExtra")
install.packages("breakDown")

#Call packages required to plot
library(reshape2)
library(ggplot2)
library(breakDown)
library(dplyr)

# City of New York
YoB <- new_york_city$`Birth Year`
Trip <- new_york_city$`Trip Duration`
Sex <- new_york_city$Gender

NYC <- ggplot(new_york_city,aes(x =YoB , y=Trip , color=Sex)) + geom_line()


# City of Chicago
YoB <- chicago$`Birth Year`
Trip <- chicago$`Trip Duration`
Sex <- chicago$Gender

library(gridExtra)

CC <- ggplot(chicago,aes(x =YoB , y=Trip , color=Sex)) + geom_line()

#Creat a grid plot to compare the two cities with age data (excluding DC)
grid.arrange(NYC, CC, nrow=2, ncol=1)


# Bar plot, distribution of trips by user type
user <- table(chicago$`User Type`)
barplot(user[order(user, decreasing=TRUE)], col = user, main = 'Users of Bikeshare by type')

# Count number of F vs M who are using bikeshare services
table(chicago$Gender)
Sex <- table(chicago$Gender)
table(chicago$Gender)/238948
prop <- table(chicago$Gender)/238948
pie(prop, main = 'Distributionof Users by Gender')

