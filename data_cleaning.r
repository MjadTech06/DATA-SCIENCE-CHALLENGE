# ==============================================================================
# CODE BLOCK B
# ==============================================================================
# What does this code do? Give it a name: _______________

cat(paste(rep("=", 70), collapse=""), "\n")
cat("METHOD 3: FILL WITH MEDIAN\n")
cat(paste(rep("=", 70), collapse=""), "\n\n")

data_method3 <- data %>%
  mutate(across(all_of(numeric_cols), ~ifelse(is.na(.), median(., na.rm = TRUE), .)))

cat("Result:\n")
cat("  • All rows kept:", nrow(data_method3), "\n")
cat("  • Missing after:", sum(is.na(data_method3)), "\n\n")

saveRDS(data_method3, "current_dataset_CLEANED.rds")
write_csv(data_method3, "data_CLEANED.csv")

cat("✓ Saved: data_CLEANED.csv\n\n")
