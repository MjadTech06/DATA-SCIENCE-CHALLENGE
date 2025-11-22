# ==============================================================================
# CODE BLOCK H
# ==============================================================================
# What does this code do? Give it a name: _______________

data <- readRDS("current_dataset.rds")
dataset_info <- readRDS("dataset_info.rds")

numeric_cols <- names(data)[sapply(data, is.numeric)]

data_method1 <- data %>% drop_na()

cat("METHOD 1: Remove rows\n")
cat("  • Rows kept:", nrow(data_method1), "\n")
cat("  • Data loss:", round((1 - nrow(data_method1)/nrow(data)) * 100, 1), "%\n\n")

data_method2 <- data %>%
  mutate(across(all_of(numeric_cols), ~ifelse(is.na(.), mean(., na.rm = TRUE), .)))

cat("METHOD 2: Fill with mean\n")
cat("  • Missing after:", sum(is.na(data_method2)), "\n\n")
