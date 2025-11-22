# ==============================================================================
# CODE BLOCK E
# ==============================================================================
# What does this code do? Give it a name: _______________

csv_files <- list.files(pattern = "\\.csv$")

cat("Available CSV files:\n")
for(i in seq_along(csv_files)) {
  cat(sprintf("  %d. %s\n", i, csv_files[i]))
}

file_number <- 1
dataset_name <- csv_files[file_number]
dataset_label <- tools::file_path_sans_ext(dataset_name)

data <- read_csv(dataset_name, show_col_types = FALSE)

cat("✅ Data loaded!\n")
cat("Rows:", nrow(data), "\n")
cat("Columns:", ncol(data), "\n\n")

glimpse(data)

saveRDS(data, "current_dataset.rds")
saveRDS(list(name = dataset_name, label = dataset_label), "dataset_info.rds")
