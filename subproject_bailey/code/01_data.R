here::i_am("subproject_bailey/code/01_data.R")

data <- read.csv(
  file = here::here("data/covid_sub.csv")
)

#Remove missing
data <- data[!is.na(data$AGE) | !is.na(data$PATIENT_TYPE) | !is.na(data$PNEUMONIA) | !is.na(data$INTUBED) | !is.na(data$CARDIOVASCULAR) | !is.na(data$OBESITY), ]

#Label PATIENT_TYPE 
data$PATIENT_TYPE <- ifelse(data$PATIENT_TYPE == 'hospitalization', "Hospitalization",
                            ifelse(data$PATIENT_TYPE == 'returned home', 'Returned Home', data$PATIENT_TYPE))

#Save data as RDS
saveRDS(
  data,
  file = here::here("subproject_bailey/output/data.rds")
)