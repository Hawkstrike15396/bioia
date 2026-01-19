df_sample <-
  df |>
  slice_sample(n = 10)

df_raw_sample <-
  df_raw |>
  filter(country %in% df_sample$country)

write_csv(df_sample, "processed_data_table_sample.csv")
write_csv(df_raw_sample, "raw_data_table_sample.csv")
