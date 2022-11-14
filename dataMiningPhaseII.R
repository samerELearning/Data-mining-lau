#Phase II
dataset <- read.csv("Dataset/DANE_PRZYGOTOWANE_80.csv")

#install.packages("tidyverse")
#install.packages("ISLR")
library("tidyverse")
library("ISLR")

#Exploring the data set
dim(dataset)
names(dataset)
summary(dataset)
head(dataset)
str(dataset)
glimpse(dataset)
head(dataset)
tail(dataset)
names(dataset)
length(dataset)
View(dataset)

#Eliminating rows, renaming variables, and eliminating columns
my_dataset <- dataset %>%
  select(Year, Player, height, weight, Pos, MP, G, X3P, X2P, FT, PTS) %>%
  filter(Year == "2021") %>%
  mutate(height = height / 100, X3P = X3P * 100)

View(my_dataset)

#Changing the X3P column into a qualitative column
my_dataset$X3P <- ifelse(test = my_dataset$X3P >= 2, yes = "Good", no = "Bad")

View(my_dataset)

#Performing logistic regression model
