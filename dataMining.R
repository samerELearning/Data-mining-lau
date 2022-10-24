dataset <- read.csv("Dataset/DANE_PRZYGOTOWANE_80.csv")

#install.packages("tidyverse")
library("tidyverse")

#Exploring the data set
dim(dataset)
str(dataset)
glimpse(dataset)
head(dataset)
tail(dataset)
View(dataset)
names(dataset)
length(dataset)

#Renaming variables and eliminating columns
my_dataset <- dataset %>%
  select(Year, Player, height, weight, Pos, G, MP,
         X3P, X3PA, X2P, X2PA, FT, AST, STL, BLK, TOV, PTS) %>%
  filter(Pos == "SG" | Pos == "PG") %>%
  rename(Games = G) %>%
  mutate(height = height / 100, X3P = X3P * 100)

View(my_dataset)
