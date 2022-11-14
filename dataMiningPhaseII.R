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

#Changing the X3P and height columns into qualitative columns
my_dataset$X3P <- ifelse(test = my_dataset$X3P >= 2, yes = "Good", no = "Bad")

View(my_dataset)

#converting columns into factors
my_dataset$height <- as.factor(my_dataset$height)
my_dataset$weight <- as.factor(my_dataset$weight)
my_dataset$MP <- as.factor(my_dataset$MP)
my_dataset$G <- as.factor(my_dataset$G)
my_dataset$X3P <- as.factor(my_dataset$X3P)
my_dataset$X2P <- as.factor(my_dataset$X2P)
my_dataset$FT <- as.factor(my_dataset$FT)
my_dataset$PTS <- as.factor(my_dataset$PTS)

View(my_dataset)



#Performing logistic regression model
logistic <- glm(X3P ~ height, data = my_dataset, family = "binomial")
summary(logistic)
