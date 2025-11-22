# ==============================================================================
# CODE BLOCK A
# ==============================================================================
# What does this code do? Give it a name: _______________

if(length(numeric_cols) >= 2) {
  cat(paste(rep("=", 70), collapse=""), "\n")
  cat("TEST 1: T-TEST\n")
  cat(paste(rep("=", 70), collapse=""), "\n\n")
  
  col1 <- numeric_cols[1]
  col2 <- numeric_cols[2]
  
  cat("Comparing:", col1, "vs", col2, "\n\n")
  
  t_result <- t.test(data[[col1]], data[[col2]], na.rm = TRUE)
  print(t_result)
  cat("\n")
  
  if (t_result$p.value < 0.05) {
    cat("✓ Significant difference found (p < 0.05)\n\n")
  } else {
    cat("✓ No significant difference (p >= 0.05)\n\n")
  }
}
