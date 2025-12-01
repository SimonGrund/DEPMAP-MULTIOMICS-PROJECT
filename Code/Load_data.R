#!/usr/bin/env Rscript
library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(janitor) #- run install.packages("janitor") if missing

# Paths
predictors_path <- file.path("Data", "depmap_export_2025-12-01 13_24_31.776975_subsetted.csv")
outcome_path    <- file.path("Data", "RNAi_(Achilles+DRIVE+Marcotte,_DEMETER2)_subsetted-4.csv")

# Load
message("Loading predictors: ", predictors_path)
pred <- suppressMessages(readr::read_csv(predictors_path, show_col_types = FALSE))
message("Rows x Cols (predictors): ", paste0(nrow(pred), " x ", ncol(pred)))

message("Loading outcome: ", outcome_path)
outc <- suppressMessages(readr::read_csv(outcome_path, show_col_types = FALSE))
message("Rows x Cols (outcome): ", paste0(nrow(outc), " x ", ncol(outc)))

# Clean column names for consistency
pred <- janitor::clean_names(pred)
outc <- janitor::clean_names(outc)

# Peek at columns
message("\nPredictor columns (first 20):")
print(head(colnames(pred), 20))
message("\nOutcome columns (first 20):")
print(head(colnames(outc), 20))

