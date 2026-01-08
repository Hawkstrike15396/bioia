fit_brm <-
  brm(
    formula = t2_rate ~ obesity_rate, 
    data = df, 
    seed = 22
  )

write_rds(fit_brm, "fit_brm")
