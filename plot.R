ggplot(
  data = df, 
  mapping = aes(x = obesity_rate, 
                y = igt_rate)
  ) +
  geom_point()
