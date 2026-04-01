here::i_am("subproject_bailey/code/02_table_one.R")

library(gtsummary)
library(dplyr)
table1 <- data %>%
  tbl_summary(
    include = c(PNEUMONIA, INTUBED, CARDIOVASCULAR, OBESITY, PATIENT_TYPE, AGE),
    missing = "no",
    label = list(
      AGE ~ "Age",
      PATIENT_TYPE ~ "Type of Care",
      PNEUMONIA ~ "Pneumonia",
      INTUBED ~ "Ventilator", 
      CARDIOVASCULAR ~ "Cardiovascular Disease", 
      OBESITY ~ "Obesity"
    ))
table1

saveRDS(
  table1,
  file = here::here("subproject_bailey/output/table1.rds")
)