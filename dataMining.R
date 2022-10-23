dataset <- read.csv("Dataset/DANE_PRZYGOTOWANE_80.csv")

View(dataset)

install.packages("tidyverse")
library("tidyverse")

#Renaming variables and eliminating columns
my_dataset <- dataset %>%
  select(Year, Player, height, weight, Pos, G, MP, X3PAr, FTr, TRB,
         X3P, X3PA, X2P, X2PA, FT, FTA, TRB, AST, STL, BLK, TOV, PTS) %>%
  rename(Games = G) %>%
  mutate(height = height / 100)

View(my_dataset)
