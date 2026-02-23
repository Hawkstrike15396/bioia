pearson_intermediates <- df_cleaned %>%
    mutate(
        # Your original code: deviations from the mean
        mean_obesity = mean(obesity_rate, na.rm = TRUE),
        mean_t2_rate = mean(t2_rate, na.rm = TRUE),
        sd_obesity = obesity_rate - mean_obesity,
        sd_t2_rate = t2_rate - mean_t2_rate,
        
        # New intermediates: squared deviations and cross-products
        sq_sd_obesity = sd_obesity^2,           # (x - mean_x)^2
        sq_sd_t2_rate = sd_t2_rate^2,           # (y - mean_y)^2
        multiply_thing = sd_obesity * sd_t2_rate # (x - mean_x)(y - mean_y)
    )

# 2. Sum the intermediates to find Pearson's r
pearson_results <- pearson_intermediates %>%
    summarise(
        sum_cross_product = sum(multiply_thing),
        sum_sq_obesity = sum(sq_sd_obesity),
        sum_sq_t2_rate = sum(sq_sd_t2_rate)
    ) %>%
    mutate(
        r = sum_cross_product / sqrt(sum_sq_obesity * sum_sq_t2_rate)
    )
# Define parameters
n <- 174              # Number of data points
alpha <- 0.01         # Significance level (e.g., 0.05 for 95% confidence)
df <- n - 2           # Degrees of freedom

# 1. Find the critical t-value (two-tailed test)
# We divide alpha by 2 for a two-tailed test and use the upper tail probability
t_critical <- qt(p = alpha/2, df = df, lower.tail = FALSE)

# 2. Calculate the critical r-value using the t-critical value and df
r_critical <- sqrt(t_critical^2 / (t_critical^2 + df))

# Print the result
print(paste("The critical r value for n =", n, "and alpha =", alpha, "is:", round(r_critical, 4)))


