library(dplyr)

here::i_am("subproject_sophia/code/clean_data.R")

data <- read.csv(
  file = here::here("data/covid_sub.csv")
)

cargs <- commandArgs(TRUE)

sex <- ifelse(
  cargs[1] == "all", 
  list(unique(data$SEX)),
  cargs[1]
)[[1]]

medical_unit <- ifelse(
  cargs[2] == "all",
  list(unique(data$MEDICAL_UNIT)),
  cargs[2]
)[[1]]


data <- data |>
  filter(
    SEX %in% sex,
    MEDICAL_UNIT %in% medical_unit
  ) |>
  mutate(
    PATIENT_TYPE = factor(PATIENT_TYPE,
                          levels = c("returned home", "hospitalization")),
    CARDIOVASCULAR = factor(CARDIOVASCULAR,
                            levels = c("No","Yes")),
    OBESITY = factor(OBESITY,
                     levels = c("No", "Yes"))
  )


saveRDS(data, 
        file= here::here("subproject_sophia/output/clean_data.rds"))