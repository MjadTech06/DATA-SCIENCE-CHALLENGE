# ==============================================================================
# CODE BLOCK C
# ==============================================================================
# What does this code do? Give it a name: _______________

BASE_URL <- "https://emathrixacademy.github.io/mindanao_education_data/"

categories <- c("enrollment", "graduates", "osy", "poverty", 
                "infrastructure", "incidents", "performance")

for (cat in categories) {
  cat(sprintf("📊 Scraping %s...", toupper(cat)))
  
  tryCatch({
    page <- read_html(paste0(BASE_URL, cat, ".html"))
    data <- page %>% 
      html_element(paste0("#", cat, "_data_table")) %>% 
      html_table()
    
    write_csv(data, paste0(cat, "_data.csv"))
    cat(sprintf(" ✓ %d rows\n", nrow(data)))
    
  }, error = function(e) {
    cat(sprintf(" ✗ ERROR: %s\n", e$message))
  })
}

cat("\n✅ DONE!\n\n")
