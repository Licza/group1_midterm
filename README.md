This is the project repository for Group 1's midterm project for DATA 550 Spring 2026 analyzing the COVID dataset

### Instructions
To render the entire report,  clone the repository in your desired directory and enter "make report_from_image" into the terminal. 

The "data" directory in the project repository will be mounted to the docker directory which includes
the covid_sub.csv file by default. To create the report with a different data set, replace this data set
with the desired one provided it is of the same format.

If you want to subset the data by sex or by medical unit type, provide the command "make SEX=<"male" "female" or "all"> and/or MEDICAL_UNIT=<integer 1-12>. NOTE: Some values of medical unit may result
in high multicollinearity in some of the regression models in which case the report will fail to render. If this happens, try another combination (medical unit 12 should work) or leave the arguments blank. See "make_report_script.sh" for format.

### Authors
Sophia Choudhri, Ava Crawford, Emma Dunne, Liam Hanson, Bailey Hebermehl, Licza Lobo

## Contents
Data: Contains raw csv file of COVID-19 data.  

Config.yaml: Contains parameter settings for rendering the final report.  

Makefile: Makefile for creating final report and all subproject dependencies.  

Subproject_< name >: Contains respective code, output, and sub-report for each coder's contribution.  

Combined_report.Rmd: RMarkdown for combining all subreports and rendering the final report.  

Render_combined_report.R: Renders combined report.  

Combined_report.html: Final rendered report