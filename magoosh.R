library(dplyr)
library(ggplot2)
library(tidyr)
library(scales) #percentage scales
library(RColorBrewer)

#open CSV with either correct or incorrect answers
INCORRECT = read.csv("/Users/salvarez/Desktop/incorrect2.csv", header = TRUE)
INCORRECT$Subject[INCORRECT$Subject==""]<- "Data Interpretation"

INCORRECT %>%
  count(INCORRECT$Subject) %>%
  mutate(perc = n /nrow(INCORRECT)) -> INCORRECT2
names(INCORRECT2) <- c("Subject", "n", "perc")

INCORRECT2 <- INCORRECT2[order(INCORRECT2$n),] 
ggplot(data = INCORRECT2, aes(x=reorder(Subject,n), y = perc)) + 
  geom_bar(stat="identity") + 
  coord_flip()
  #scale_fill_brewer(palette = "YlOrRd")
y <- levels(INCORRECT$Date)
