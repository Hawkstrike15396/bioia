df <- 
  inner_join(t1_all, t1_children, 
             join_by(country == country)) |>
    mutate(t1_adult = t1_all_ages - t1_children, 
           .keep = "unused") |> 
  inner_join(diabetes, 
             join_by(country == country)) |> 
    mutate(t2_adult = diabetes_total - t1_adult, 
           .keep = "unused") |>
    drop_na() |>
  inner_join(adult, 
             join_by(country == country)) |>
    mutate(t2_rate = 100 * t2_adult / population, 
           .keep = "unused") |>
  inner_join(obesity, 
             join_by(country == country))


