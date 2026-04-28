## Stage 1 ###

FROM rocker/tidyverse:4.5.1 as base

RUN mkdir /home/rstudio/group1_midterm
WORKDIR /home/rstudio/group1_midterm

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN Rscript -e "renv::restore(prompt = FALSE)"

### Stage 2 ###

FROM rocker/tidyverse:4.5.1

RUN mkdir /home/rstudio/group1_midterm

WORKDIR /home/rstudio/group1_midterm
COPY --from=base /home/rstudio/group1_midterm .

COPY combined_report.Rmd .
COPY render_combined_report.R .
COPY Makefile . 
RUN mkdir data
RUN mkdir subproject_ava
RUN mkdir subproject_bailey
RUN mkdir subproject_emma
RUN mkdir subproject_licza
RUN mkdir subproject_sophia
COPY subproject_ava/ subproject_ava/
COPY subproject_bailey/ subproject_bailey/ 
COPY subproject_emma/ subproject_emma/ 
COPY subproject_licza/ subproject_licza/ 
COPY subproject_sophia/ subproject_sophia/
RUN mkdir final_report

CMD make report && mv combined_report.html final_report/combined_report.html