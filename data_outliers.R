# 1. Define the variables you want to clean
cols_to_clean <- c("t2_rate", "obesity_rate")

# 2. Function to identify rows that are NOT outliers
get_clean_rows <- function(x) {
  Q1 <- quantile(x, 0.25, na.rm = TRUE)
  Q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr_val <- Q3 - Q1
  
  # Return TRUE for values WITHIN the range [Q1 - 1.5*IQR, Q3 + 1.5*IQR]
  return(x >= (Q1 - 1.5 * iqr_val) & x <= (Q3 + 1.5 * iqr_val))
}

# 3. Apply the filter to both columns
# This keeps rows where BOTH columns are within the 'clean' range
df_cleaned <- df[get_clean_rows(df[[cols_to_clean[1]]]) & 
                 get_clean_rows(df[[cols_to_clean[2]]]), ]

# Check the difference in row counts
cat("Original rows:", nrow(df), "\nCleaned rows:", nrow(df_cleaned))

write_rds(df_cleaned, "df_cleaned")

