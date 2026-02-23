plot <- 
  ggplot(
  data = df_cleaned,
  mapping = aes(x = obesity_rate, y = t2_rate)
) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, colour = "#000000") +
  labs(
    title = NULL, 
    subtitle = "", 
    x = "Obesity prevalence (%)", 
    y = "Type 2 diabetes prevalence (%)"
  ) +
  theme_minimal(base_family = "serif") +
  scale_x_continuous(
    limits = c(0, 50),
    breaks = seq(0, 50, by = 10),
    expand = c(0, 0)
  ) +
    scale_y_continuous(
    limits = c(0, 25),
    breaks = seq(0, 25, by = 5),
    expand = c(0, 0)
  ) +
  theme(
    text = element_text(family = "serif"), 
    panel.grid = element_blank(),

    axis.line = element_line(linewidth = 1, colour = "black"),
    axis.ticks = element_line(linewidth = 1, colour = "black"),
    axis.ticks.length = unit(0.25, "cm"),

    axis.title = element_text(size = 14),
    axis.text  = element_text(size = 12),

    plot.title = element_text(size = 18)
  )

ggsave(
  "plot.png", 
  plot = get_last_plot()
)





