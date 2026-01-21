pearson_save_me <- df  |> 
    mutate(
        mean_obesity = mean(df$obesity_rate), 
        mean_t2_rate = mean(df$t2_rate), 
        sd_obesity = obesity_rate - mean_obesity, 
        sd_t2_rate = t2_rate - mean_t2_rate, 
        multiply_thing = sd_obesity * sd_t2_rate
    ) 

sum(pearson_save_me$multiply_thing) / ((sum(pearson_save_me$sd_t2_rate) ^2 * sum(pearson_save_me$sd_obesity) ^2)^0.5)

# Define parameters
n <- 180              # Number of data points
alpha <- 0.05         # Significance level (e.g., 0.05 for 95% confidence)
df <- n - 2           # Degrees of freedom

# 1. Find the critical t-value (two-tailed test)
# We divide alpha by 2 for a two-tailed test and use the upper tail probability
t_critical <- qt(p = alpha/2, df = df, lower.tail = FALSE)

# 2. Calculate the critical r-value using the t-critical value and df
r_critical <- sqrt(t_critical^2 / (t_critical^2 + df))

# Print the result
print(paste("The critical r value for n =", n, "and alpha =", alpha, "is:", round(r_critical, 4)))


