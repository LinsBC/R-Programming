## This file contains the r code I ran to obtain the answers to 
## Week 1 quiz

## Question 11
## In the dataset provided for this Quiz, what are the column names of the
## dataset?
## I extracted the zip file outside of R
data <- read.csv("hw1_data.csv")

## I could also have opened the zip file but haven't quite figured this
## out yet. Maybe later and add here.

## Question 12
## Extract the first 2 rows of the data frame and print them to the
## console. What does the output look like?
head(data,2)

## Question 13
## How many observations (i.e. rows) are in this data frame?
nrow(data)

## Question 14
## Extract the last 2 rows of the data frame and print them to the
## console. What does the output look like?
tail(data,2)

## Question 15
## What is the value of Ozone in the 47th row?
data[47,"Ozone"]

## Question 16
## How many missing values are in the Ozone column of this data frame?
ok <- complete.cases(data)
sum(!ok)

## Can also write as:
sum(!complete.cases(data))

## Question 17
## What is the mean of the Ozone column in this dataset? Exclude missing
## values (coded as NA) from this calculation.
mean(data[ok,"Ozone"])

## Question 18
## Extract the subset of rows of the data frame where Ozone values are
## above 31 and Temp values are above 90. What is the mean of Solar.R in
## this subset?
mean(data[data$Ozone>31&data$Temp>90,"Solar.R"],,na.rm=TRUE)

## Question 19
## What is the mean of "Temp" when "Month" is equal to 6?
mean(data[data$Month==6,"Temp"])

## Question 20
## What is the mean of "Temp" when "Month" is equal to 6?
max(data[data$Month==5,"Ozone"],na.rm=TRUE)


