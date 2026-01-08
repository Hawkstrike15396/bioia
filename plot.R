plot <- 
  ggplot(
  data = df,
  mapping = aes(x = obesity_rate, y = t2_rate)
) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, colour = "#000000") +
  labs(
    title = "Figure 1: Association between obesity prevalence (%) and \n estimated type 2 diabetes rate (%) in 181 countries", 
    subtitle = "", 
    x = "Obesity prevalence (%)", 
    y = "Estimated type 2 diabetes rate (%)"
  ) +
  theme_minimal(base_family = "serif") +
  scale_x_continuous(
    limits = c(0, 80),
    breaks = seq(0, 80, by = 10),
    expand = c(0, 0)
  ) +
    scale_y_continuous(
    limits = c(0, 30),
    breaks = seq(0, 30, by = 5),
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





