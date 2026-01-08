adult <- 
  read_csv("data/adult_in_1000s.csv", 
           col_names = FALSE, 
           skip = 1) |> 
  mutate(country = X1, 
         population = X2 * 1000, 
         .keep = "none")

diabetes <- 
  read_csv("data/diabetes_in_1000s.csv", 
           col_names = FALSE, 
           skip = 1) |> 
  mutate(country = X1, 
         diabetes_total = X2 * 1000, 
         .keep = "none")

t1_all <- 
  read_csv("data/t1_all.csv", 
           skip = 1, 
           col_names = FALSE) |>
  mutate(country = X1, 
         t1_all_ages = X2, 
         .keep = "none")

t1_children <- 
  read_csv("data/t1_children.csv", 
           skip = 1, 
           col_names = FALSE) |>
  mutate(country = X1, 
         t1_children = X2, 
         .keep = "none")

obesity <- 
  read_csv("data/obesity.csv") |>
  filter(Dim1 == "Both sexes") |>
  mutate(country = Location, 
         obesity_rate = FactValueNumeric, 
         .keep = "none")


