library(tidyverse)
library(brms)
library(tidybayes)
library(gtsummary)

fit_brm <- read_rds("fit_brm")

df <- read_rds("df")

correlation_coefficient <- read_rds("correlation_coefficient")
