library(dplyr)
library(magrittr)
library(org.Hs.eg.db)

df <- data.frame(
  a = c(1, 2, 3),
  b = c(4, 5, 6)
)

df %>% select(a)

library(conflicted)

df %>% select(a)
