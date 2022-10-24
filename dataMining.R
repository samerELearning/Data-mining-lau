dataset <- read.csv("Dataset/DANE_PRZYGOTOWANE_80.csv")

#install.packages("tidyverse")
library("tidyverse")

#Exploring the data set
dim(dataset)
str(dataset)
glimpse(dataset)
head(dataset)
tail(dataset)
names(dataset)
length(dataset)
View(dataset)

#Renaming variables and eliminating columns
my_dataset <- dataset %>%
  select(Year, Player, height, weight, Pos, MP, X3P, X3PA, PTS) %>%
  filter(Pos == "SG" | Pos == "PG", MP > 2000) %>%
  mutate(height = height / 100, X3P = X3P * 100)

View(my_dataset)

summary(my_dataset)
boxplot(my_dataset$X3P)
hist(my_dataset$X3P)

#Linear regression
linear_regression <- my_dataset %>%
  lm(my_dataset$X3P ~ my_dataset$Year, data = .) %>%
  summary()

hist(linear_regression$residuals)
