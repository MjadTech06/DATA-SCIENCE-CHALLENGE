# ==============================================================================
# CODE BLOCK F
# ==============================================================================
# What does this code do? Give it a name: _______________

data <- readRDS("current_dataset_CLEANED.rds")
dataset_info <- readRDS("dataset_info.rds")

numeric_cols <- names(data)[sapply(data, is.numeric)]
character_cols <- names(data)[sapply(data, is.character)]

if(length(numeric_cols) >= 1) {
  col1 <- numeric_cols[1]
  
  p1 <- data %>%
    ggplot(aes(x = .data[[col1]])) +
    geom_histogram(fill = "#3498db", alpha = 0.7, bins = 30, color = "white") +
    labs(title = paste("Distribution of", col1), x = col1, y = "Count") +
    theme_minimal()
  
  print(p1)
  ggsave("02_distribution.png", p1, width = 10, height = 6)
  cat("✓ Saved: 02_distribution.png\n\n")
}

if(length(character_cols) >= 1 && length(numeric_cols) >= 1) {
  cat_col <- character_cols[1]
  num_col <- numeric_cols[1]
  
  p2 <- data %>%
    group_by(.data[[cat_col]]) %>%
    summarise(Total = sum(.data[[num_col]], na.rm = TRUE), .groups = "drop") %>%
    ggplot(aes(x = reorder(.data[[cat_col]], Total), y = Total, fill = .data[[cat_col]])) +
    geom_col(show.legend = FALSE) +
    coord_flip() +
    labs(title = paste(num_col, "by", cat_col)) +
    theme_minimal()
  
  print(p2)
  ggsave("03_comparison.png", p2, width = 10, height = 6)
  cat("✓ Saved: 03_comparison.png\n\n")
}
