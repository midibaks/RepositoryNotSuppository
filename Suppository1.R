library(tidyverse)

fev1 <- read.csv("../fev1.csv")

set.seed(10)
fev1_sampled <- fev1 %>%
  count(id) %>%
  filter(n > 6) %>%
  slice_sample(n = 20) %>%
  select(id) %>%
  inner_join(fev1)

fev1_sampled

class(fev1$id)

fev1_sampled$id <- as.factor(fev1_sampled$id)

ggplot(data = fev1_sampled, aes(x = age, y = FEV1, colour = id)) +
  geom_point() + 
  labs(x = "Age (years)",
       y = "FEV1 score (litres)") +
  theme(
    panel.grid = element_blank(),
    panel.border = element_blank()
  )
