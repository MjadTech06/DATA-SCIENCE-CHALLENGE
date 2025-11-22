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


# ==============================================================================
# CREATE R MARKDOWN PRESENTATION
# ==============================================================================

rmd_content <- paste0('---
title: "', dataset_info$label, ' Data Analysis"
author: "Your Name Here"
date: "', Sys.Date(), '"
output: 
  ioslides_presentation:
    widescreen: true
    smaller: false
---
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE)
library(tidyverse)
library(scales)
library(knitr)

data <- readRDS("current_dataset_CLEANED.rds")
```

## Introduction

**Dataset:** ', dataset_info$label, '

**Key Information:**

- Total Records: `r nrow(data)`
- Total Variables: `r ncol(data)`
- Analysis Date: `r Sys.Date()`

---

## Data Overview
```{r}
glimpse(data)
```

---

## Missing Values Analysis
```{r out.width="80%", fig.align="center"}
knitr::include_graphics("01_missing_values.png")
```

---

## Distribution Analysis
```{r out.width="80%", fig.align="center"}
knitr::include_graphics("02_distribution.png")
```

---

## Comparison Analysis
```{r out.width="80%", fig.align="center"}
knitr::include_graphics("03_comparison.png")
```

---

## Relationship Analysis
```{r out.width="80%", fig.align="center"}
knitr::include_graphics("04_relationship.png")
```

---

## Key Findings

', 
                      if(file.exists("current_dataset_CLEANED.rds")) {
                        data_temp <- readRDS("current_dataset_CLEANED.rds")
                        numeric_cols <- names(data_temp)[sapply(data_temp, is.numeric)]
                        if(length(numeric_cols) > 0) {
                          paste0('
**Summary Statistics:**
```{r}
data %>% 
  select(where(is.numeric)) %>%
  summary() %>%
  kable()
```
')
                        } else ""
                      } else "",
                      '

---

## Conclusions

**Main Insights:**

1. Data quality assessment completed
2. Patterns and trends identified
3. Statistical relationships analyzed

**Recommendations:**

- Further investigation needed
- Additional data collection suggested
- Follow-up analysis required

---

## Thank You!

**Questions?**

Contact: your.email@example.com
')

# Write the R Markdown file
writeLines(rmd_content, "presentation.Rmd")

cat("✓ Created: presentation.Rmd\n\n")

