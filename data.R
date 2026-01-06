igt <- 
  read_csv("igt_2024.csv", 
           na = "-", 
           col_names = FALSE, 
           col_select = c(1, 4), 
           skip = 10) |> 
  mutate(country = X1, 
         igt_rate = X4, 
         .keep = "none")

diabetes_death <- 
  read_csv("diabetes_death.csv", 
           na = "-", 
           col_names = FALSE, 
           col_select = c(1, 4), 
           skip = 10) |> 
  mutate(country = X1, 
         igt_rate = X4, 
         .keep = "none")

obesity <- 
  read_csv("obesity.csv") |>
  filter(Dim1 == "Both sexes") |>
  mutate(country = Location, 
         obesity_rate = FactValueNumeric, 
         .keep = "none")

df <- 
  inner_join(diabetes_death, obesity, 
             join_by(country == country))






