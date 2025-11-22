# ==============================================================================
# CODE BLOCK G
# ==============================================================================
# What does this code do? Give it a name: _______________

data <- readRDS("current_dataset.rds")

missing_counts <- data %>%
  summarise(across(everything(), ~sum(is.na(.)))) %>%
  pivot_longer(everything(), names_to = "Column", values_to = "Missing_Count") %>%
  mutate(
    Total_Rows = nrow(data),
    Missing_Percentage = round(Missing_Count / Total_Rows * 100, 2)
  ) %>%
  arrange(desc(Missing_Count))

print(missing_counts)

if(sum(missing_counts$Missing_Count) > 0) {
  p_missing <- missing_counts %>%
    filter(Missing_Count > 0) %>%
    ggplot(aes(x = reorder(Column, Missing_Count), y = Missing_Count)) +
    geom_col(fill = "#e74c3c", alpha = 0.8) +
    coord_flip() +
    labs(title = "Missing Values", x = "Column", y = "Missing Count") +
    theme_minimal()
  
  print(p_missing)
  ggsave("01_missing_values.png", p_missing, width = 10, height = 6)
}
