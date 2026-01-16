library(tidyverse)

fev1 <- read_csv("fev1.csv")

plot <- ggplot(fev1, aes(x = age, y = FEV1)) +
  geom_point()

plot2 <- plot +
  labs(
    x = "Age (years)",
    y = "FEV1 (litres)",
    title = "Relationship between Age and Lung Function (FEV1)"
  ) +
  theme_minimal() +
  geom_smooth(
    method = "loess",
    se = FALSE,
    colour = "steelblue",
    linewidth = 1
  )

plot2