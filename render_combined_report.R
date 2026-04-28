library(rmarkdown)

here::i_am(
  "render_combined_report.R"
)

cargs <- commandArgs(TRUE)
sex <- cargs[1]
medical_unit <- cargs[2]

render(
  "combined_report.Rmd",
  knit_root_dir = here::here(),
  params = list(
    sex = sex,
    medical_unit = medical_unit
  ),
  output_file = paste0(
    "combined_report",
    ".html"
  )
)
