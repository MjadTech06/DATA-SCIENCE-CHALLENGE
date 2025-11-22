# ==============================================================================
# CODE BLOCK D
# ==============================================================================
# What does this code do? Give it a name: _______________

library(tidyverse)

cat("\n")
cat(paste(rep("=", 70), collapse=""), "\n")
cat("ACTIVITY 6: CREATE PRESENTATION\n")
cat(paste(rep("=", 70), collapse=""), "\n\n")

# Load info
dataset_info <- readRDS("dataset_info.rds")

cat("Generating presentation for:", dataset_info$label, "\n\n")
