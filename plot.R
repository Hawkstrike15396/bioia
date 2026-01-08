ggplot(
  data = df, 
  mapping = aes(x = obesity_rate, 
                y = t2_rate)
  ) +
  geom_point()
