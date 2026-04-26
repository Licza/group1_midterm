here::i_am("subproject_ava/code/table_one.R")

data <- readRDS(
  file = here::here("subproject_ava/output/recode.rds")
)

library(gtsummary)
library(broom)
library(broom.helpers)
library(car)
library(parameters)

binary_mod <- glm(patient_type_recode ~ num_med_conditions_cat, 
                  data = data, 
                  family = binomial)

table_one <- tbl_regression(
  binary_mod,
  exponentiate = TRUE,
  label = list(
    num_med_conditions_cat ~ "Number of Medical Conditions"
  )
) |>
  add_global_p()

saveRDS(table_one, file = here::here("subproject_ava/output/table_one.rds"))
