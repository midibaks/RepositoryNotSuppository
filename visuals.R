fev1 <- read_csv(here("2491_eda-main/data/fev1.csv"), col_types = list('id' = 'f'))

ggplot(fev1, aes(x = age, y = FEV1)) + geom_point() + geom_smooth(method = 'loess') +
  labs(title = "Relationship between FEV1 and Age", x = "Age (years)", y = "FEV1 (L)") +
  theme_classic()

set.seed(10)
fev1_sampled <- fev1 %>%
  count(id) %>%
  filter(n > 6) %>%
  slice_sample(n = 20) %>%
  select(id) %>%
  inner_join(fev1)

ggplot(fev1_sampled, aes(x = age, y = FEV1, color = id)) + geom_point() +
  labs(title = "Relationship between FEV1 and Age", x = "Age (years)", y = "FEV1 (L)")
