# System & Library
library(dplyr)
library(tidyr)
library(ggplot2)
library(MMWRweek)
library(readxl)
library(jsonlite)
library(purrr)
library(rvest)
library(xml2)

# Prerequisite ------

# Advice to run the script outside of the code folder
source("./code/utils.R")

# Data -----
## NHSN data -----
### Weekly
df_nhsn <-
  read.csv("./source/US/covid_nhsn_hosp_inc.csv") |>
  dplyr::filter(age_group == "0-130") |>
  dplyr::mutate(source = "NHSN") |>
  dplyr::rename(location = geo_value_fullname, date = time_value)
### Monthly
df_nhsn_m <- dplyr::mutate(df_nhsn, year = format(as.Date(date), "%Y"),
                           month = format(as.Date(date), "%m")) |>
  dplyr::summarise(value = sum(value),
                   .by = c("location", "year", "month", "source")) |>
  dplyr::mutate(date = as.Date(paste0(year, "/", month, "/28"),
                                     "%Y/%m/%d")) |>
  dplyr::select(date, source, value, location)

## State level -----

df_st_tot <- data.frame()
df_st_tot_other <- data.frame()

### Arizona -----

df_st <- read.csv("source/Arizona/Hosps_Epi_Curve_2024-11-29_052458.csv") |>
  dplyr::mutate(year = 2024, day = 7,
                date =
                  MMWRweek2Date(year, as.numeric(Mmwrwk.Link.Hd.value), day),
                value = AGG.Suppression.Hosps.Epi.Curve..alias) |>
  dplyr::filter(value > 0) |>
  dplyr::select(date, value) |>
  rbind(read.csv("source/Arizona/Hosps_Epi_Curve_2024-01-05_052743.csv") |>
          dplyr::mutate(year = 2023, day = 7,
                        date =
                          MMWRweek2Date(year, as.numeric(MMWRWK_Hosps.value),
                                        day),
                        value = AGG.Suppression.Hosps.Epi.Curve..alias) |>
          dplyr::filter(value > 0) |>
          dplyr::select(date, value)) |>
  st_output(source_name = "AZ DHS", location_name = "Arizona")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Arizona")

### Arkansas ------

df_st <-
  read.csv(paste0("source/Arkansas/COVIDHospitalizations_",
                  "PublicationsTable_7706763203516724528.csv")) |>
  dplyr::select(-dplyr::matches("Total|Deaths|cases|OBJECT")) |>
  tidyr::pivot_longer(-Year, names_to = "month") |>
  dplyr::mutate(date = as.Date(paste0(Year, "/", month, "/28"),
                                     "%Y/%B/%d")) |>
  dplyr::filter(date <= as.Date("2025-01-02")) |>
  st_output(source_name = "AK DoH", location_name = "Arkansas")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn_m, df_st, "Arkansas")

### California -----

# Hospitalized patient with confirmed COVID-19

df_st <-
  read.csv("source/California/47af979d-8685-4981-bced-96a6b79d3ed5.csv") |>
  dplyr::summarise(value = sum(hospitalized_covid_confirmed_patients),
                   .by = todays_date) |>
  aggreg_weekly_val("todays_date", "%m/%d/%Y") |>
  st_output(source_name = "CA DoH", location_name = "California")

df_st_tot_other <- rbind(df_st_tot_other, df_st)
simple_plot(df_st, "California")

### Colorado -----

df_st <-
  read.csv("source/Colorado/CDPHE_Viral_Respiratory_Hospital_Data.csv") |>
  dplyr::filter(subsection == "Historical Trends", pathogen == "COVID-19") |>
  dplyr::mutate(value = count_, date = as.Date(date, "%m/%d/%Y")) |>
  st_output(source_name = "CDPHE", location_name = "Colorado")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Colorado")

### Delaware ------

# Average Daily COVID-19 Hospital Admissions

df_st <-
  read.csv("source/Delaware/state-covid19-hospitalizations-2025-03-26.csv") |>
  dplyr::filter(statistic == "Average Daily COVID-19 Hospital Admissions") |>
  dplyr::mutate(value = value * 7,
                date = as.Date(paste0(year, "-", month, "-", day))) |>
  st_output(source_name = "DE DHHS", location_name = "Delaware")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Delaware")

### Illinois -----

# Percentages of Hospital Admissions

df_st <-
  read.csv("source/Illinois/Admitted_2025-04-02_052505.csv") |>
  dplyr::filter(Syndromic.Surveillance.Respiratory.Category == "COVID-19") |>
  dplyr::mutate(date = as.Date(Week.Ending, "%m/%d/%Y"),
                value = as.numeric(gsub("%", "", Total.Average)) / 100) |>
  st_output(source_name = "IL HSS", location_name = "Illinois")

simple_plot(df_st, "Illinois")
df_st_tot_other <- rbind(df_st_tot_other, df_st)

### Kentucky ----
df_st <-
  read.csv(paste0("source/Kentucky/Respiratory_Disease-associated_Hospital_",
                  "Admissions_by_Week_2024-08-30_052823.csv")) |>
  dplyr::filter(`Measure.Names.alias` == "COVID-19") |>
  dplyr::mutate(value = `Measure.Values.value`,
                date = as.Date(`Date.value`)) |>
  dplyr::select(date, value) |>
  rbind(read.csv(paste0("source/Kentucky/Respiratory_Disease-",
                        "associated_Hospital_Admissions_by_Week_2025-03-24_",
                        "053038.csv")) |>
          dplyr::filter(`Condition.alias` == "COVID-19") |>
          dplyr::mutate(value = `SUM.Count..alias`,
                        date = as.Date(`Week_Ending.value`)) |>
          dplyr::select(date, value)) |>
  st_output(source_name = "KY PH", location_name = "Kentucky")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Kentucky")

### Maine ------

df_st <-  read.csv("source/Maine/All_historical_2025-03-27_110900.csv") |>
  dplyr::filter(X == "Hospitalized COVID-19 Patients") |>
  tidyr::pivot_longer(-1, names_to = "date", values_to = "value") |>
  dplyr::mutate(date = as.Date(gsub("X", "", date), "%m.%d.%Y")) |>
  st_output(source_name = "ME CDC", location_name = "Maine")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Maine")

### Maryland -----

df_st <-
  read.csv("source/Maryland/MD_COVID-19_-_MASTER_Case_Tracker_20250325.csv") |>
  aggreg_weekly_val("ReportDate", "%m/%d/%Y", "bedsTotal") |>
  st_output(source_name = "MDH PHPA", location_name = "Maryland")

df_st_tot_other <- rbind(df_st_tot_other, df_st)
simple_plot(df_st, "Maryland")

### Massachusetts ------

df_st <-
  readxl::read_excel(paste0("source/Massachusetts/respiratory",
                            "-disease-reporting-2024-2025-03-20-25.xlsx"),
                     sheet = "Visits by week") |>
  dplyr::filter(Subgroup == "Statewide", `Visit type` == "Admissions") |>
  dplyr::mutate(value = `Number of COVID-19 visits`,
                date = as.Date(`Week End Date`)) |>
  st_output(source_name = "MA DPH", location_name = "Massachusetts")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Massachusetts")


### Minnesota ------

df_st <- read.csv("source/Minnesota/h7day.csv") |>
  aggreg_weekly_val("date", "%m/%d/%Y", value_col = "case_count") |>
  st_output(source_name = "MN DoH", location_name = "Minnesota")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Minnesota")

### Montana ------

df_st <-
  read.csv("source/Montana/COVID_Hsps_Historical_2025-04-03_132317.csv") |>
  dplyr::mutate(value = SUM.Hospitalizations..value,
                date = as.Date(ATTR.Week.Ending..COVID.Historical...alias,
                                     "%m/%d/%Y")) |>
  dplyr::filter(!is.na(date)) |>
  st_output(source_name = "MT DPHHS", location_name = "Montana")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Montana")

### Nebraska -----

df_st <-
  read.csv("source/Nebraska/CV_Season_Totals_HS_2025-03-24_054007.csv") |>
  tidyr::pivot_longer(-tidyr::all_of(c("WEEK_END..Custom.SQL.Query.",
                                       "RESPIRATORY_SEASON..Custom.SQL.Query.")),
                      names_to = "epiweek") |>
  dplyr::filter(!is.na(value)) |>
  dplyr::mutate(date = as.Date(`WEEK_END..Custom.SQL.Query.`,
                                     "%m/%d/%Y")) |>
  st_output(source_name = "NE DHHS", location_name = "Nebraska")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Nebraska")

### New Jersey ------

df_st <- read.csv(paste0("source/New Jersey/Cases_by_Onset_",
                         "(2)_1_1_2020_2025-03-25_052308.csv")) |>
  dplyr::mutate(date = Week.Ending.Date.value,
                value = SUM.count..4...value) |>
  st_output(source_name = "NJ DoH", location_name = "New Jersey")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "New Jersey")

### New York ------

df_st <- read.csv(paste0("source/New York/New_York_State_",
                         "Statewide_COVID-19_Hospitalizations_and_Beds_",
                         "20250325.csv")) |>
  dplyr::summarise(value = sum(Patients.Newly.Admitted +
                                 Patients.Positive.After.Admission),
                   .by = As.of.Date) |>
  aggreg_weekly_val("As.of.Date", "%m/%d/%Y") |>
  st_output(source_name = "NY DoH", location_name = "New York")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "New York")

### North Carolina --------

df_st <-
  purrr::map(dir("source/North Carolina/", full.names = TRUE),
             ~ read.csv(.x) |>
               cbind(as_of = basename(.x)) |>
               dplyr::select(date = Week.Ending.Date, as_of,
                             value = COVID.like.Illness) |>
               dplyr::mutate(value = as.numeric(gsub(",", "", value)),
                             date = as.Date(date, "%m/%d/%Y"))) |>
  dplyr::bind_rows() |>
  dplyr::mutate(as_of = gsub("_\\d{6}.csv|.*(?=202)", "", as_of,
                             perl = TRUE)) |>
  dplyr::mutate(sel = ifelse(as_of == max(as_of), 1, 0), .by = date) |>
  dplyr::filter(sel == 1) |>
  dplyr::select(-sel) |>
  st_output(source_name = "NC DHHS", location_name = "North Carolina")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "North Carolina")


### Ohio ----------

df_st <- read.csv(paste0("source/Ohio/COVIDDeathData_CountyOfResidence_",
                         "2025-04-02_042302.csv")) |>
  dplyr::summarise(value = sum(Hospitalized.Count), .by = Week.End) |>
  dplyr::mutate(date = as.Date(Week.End)) |>
  st_output(source_name = "Ohio DoH", location_name = "Ohio") |>
  dplyr::filter(!is.na(date))

comp_plot(df_nhsn, df_st, "Ohio")
df_st_tot <- rbind(df_st_tot, df_st)


### Oklahoma ----------

df_st <-
  extract_data("source/Oklahoma/hosp_by_hhs_region_2025-04-07_074503.json") |>
  st_output(source_name = "OK DoH", location_name = "Oklahoma")

comp_plot(df_nhsn, df_st, "Oklahoma")
df_st_tot <- rbind(df_st_tot, df_st)

### Oregon -----

df_st <-
  read.csv(paste0("source/Oregon/Hospitalization_by_Region_COVID-19_positive_",
                  "patients_2025-04-07_055656.csv")) |>
  tidyr::pivot_longer(-Day.of.Date, names_to = "region") |>
  dplyr::mutate(date = as.Date(Day.of.Date, "%B %d, %Y")) |>
  dplyr::summarise(value = sum(value), .by = date) |>
  aggreg_weekly_val("date", "%Y-%m-%d") |>
  st_output(source_name = "OR Health Authority", location_name = "Oregon")

df_st_tot_other <- rbind(df_st_tot_other, df_st)
simple_plot(df_st, "Oregon")

### Rhode Island -----

df_st <-
  read.csv("source/Rhode Island/Rhode Island COVID-19 Data - Weekly Trends.csv",
           skip = 2) |>
  dplyr::mutate(date = as.Date(gsub("../../.. - ", "", Week), "%m/%d/%y"),
                value = `Number.of.hospital.admissions`) |>
  st_output(source_name = "RI DoH", location_name = "Rhode Island")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Rhode Island")

### Tennessee ----------

df_st <- readxl::read_excel("source/Tennessee/daily_2025-01-17_042302.xlsx") |>
  dplyr::rename(date = DATE, value = NEW_HOSP) |>
  dplyr::mutate(date = as.character(date)) |>
  aggreg_weekly_val("date", "%Y-%m-%d") |>
  st_output(source_name = "TN DoH", location_name = "Tennessee")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Tennessee")

### Utah ------------------

df_st <- xml2::read_html("source/Utah/covid_pandash_2025-03-26_042302.html") |>
  rvest::html_nodes("script")
df_st <- df_st[grep("22aa5ce", df_st)]
df_st <- rvest::html_text(df_st[[1]])
df_st <- strsplit(df_st, "\"text\":")[[1]][3]
df_st <- strsplit(df_st, "],\"type\"")[[1]][1]
df_st <- strsplit(df_st, "<br>")[[1]]

df_st <- data.frame(date = grep("Date", df_st, value = TRUE),
                    value = grep("Count", df_st, value = TRUE)) |>
  dplyr::mutate(date = as.Date(gsub("Date: ", "", date)),
                value = as.numeric(stringr::str_extract(value, "\\d+"))) |>
  aggreg_weekly_val("date", "%Y-%m-%d") |>
  st_output(source_name = "UT DoH", location_name = "Utah")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Utah")

### Virginia -----------

df_st <- read.csv(paste0("source/Virginia/vdh-covid-19-publicusedataset-",
                         "cases_by-confirmation.csv")) |>
  dplyr::arrange(Report.Date) |>
  dplyr::mutate(date = as.Date(Report.Date)) |>
  dplyr::mutate(hosp = Number.of.Hospitalizations -
                  lag(Number.of.Hospitalizations), .by = Case.Status) |>
  dplyr::filter(!is.na(hosp), hosp > 0) |>
  dplyr::summarise(value = sum(hosp), .by = date) |>
  aggreg_weekly_val("date", "%Y-%m-%d") |>
  st_output(source_name = "VI DoH", location_name = "Virginia")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Virginia")

### Washington -----

df_st <- read.csv(paste0("source/Washington/wahealth_hospitaluse_",
                         "download.csv")) |>
  dplyr::select(value = COVID19.7.day.Avg.Hospitalized,
                date = Date.Range.End) |>
  dplyr::mutate(date = as.Date(date)) |>
  st_output(source_name = "WA DoH", location_name = "Washington")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Washington")

### West Virginia ------

df_st <-
  read.csv("source/West Virginia/Severity Indicator COVID Hospitalization.csv",
           sep = "\t") |>
  dplyr::mutate(date = as.Date(Day.of.End.of.Week.Date, "%m/%d/%Y"),
                value = (X / 100000) * 5910955) |>
  st_output(source_name = "WV DoH", location_name = "West Virginia")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "West Virginia")

### Wisconsin --------

df_st <-
  read.csv(paste0("source/Wisconsin/Covid HX Patients (TOT)",
                  "_data.csv"), sep = "\t")  |>
  dplyr::mutate(value = as.numeric(`Inp.Cov.Con.Avg`) / 7) |>
  aggreg_weekly_val("Report.Date", "%m/%d/%Y") |>
  st_output(source_name = "WI DoH", location_name = "Wisconsin")

df_st_tot <- rbind(df_st_tot, df_st)
comp_plot(df_nhsn, df_st, "Wisconsin")

### Puerto Rico -------

df_st <-
  read.csv("source/Puerto Rico/covid19_hospitalizations_grouped_by_date.csv") |>
  dplyr::rename(value = TotalHospitalizations) |>
  aggreg_weekly_val("HospitalizationDate", "%m/%d/%Y") |>
  st_output(source_name = "PR DoH", location_name = "Puerto Rico")

df_st_tot_other <- rbind(df_st_tot_other, df_st)
simple_plot(df_st, "Puerto Rico")


### All
write.csv(df_st_tot, "output/hospitalization_states.csv", row.names = FALSE)
comp_plot(df_nhsn, df_st_tot, "All Location", TRUE, font_size = 20)
comp_plot(df_nhsn, df_st_tot, "All Location 2023", TRUE, year_limit = 2023,
          font_size = 20)

#### Other
write.csv(df_st_tot_other, "output/other_hospitalization_states.csv",
          row.names = FALSE)
