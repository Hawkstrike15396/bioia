ggplot(
  data = df,
  mapping = aes(x = obesity_rate, y = t2_rate)
) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, colour = "#000000") +
  labs()
