# Standardize output in SMH format
cdc_nhsn_standardize <- function(raw, sel_col,
                                 pathogen = c("COVID", "Influenza", "RSV"),
                                 age_group = FALSE) {
  id_col <- c("Week.Ending.Date", "Geographic.aggregation")
  df <- dplyr::select(raw, dplyr::all_of(c(sel_col, id_col))) |>
    tidyr::pivot_longer(cols = dplyr::contains("Admissions"),
                        names_to = "disease", values_to = "observation") |>
    dplyr::mutate(pathogen = stringr::str_extract(.data[["disease"]],
                                                  paste(pathogen,
                                                        collapse = "|")))
  out_col <- c("pathogen", "observation")
  if (age_group) {
    df <- tidyr::separate(df, .data[["disease"]], into = c("disease",
                                                           "age_group"),
                          sep = "\\.\\.") |>
      dplyr::mutate(age_group = gsub("plus", "130",
                                     gsub("-$", "",
                                          gsub("\\.", "-",
                                               gsub("years|age", "",
                                                    age_group)))))
    out_col <- c(out_col, "age_group")
  }
  df <- dplyr::select(df, date = tidyr::all_of("Week.Ending.Date"),
                      state_abbr = tidyr::all_of("Geographic.aggregation"),
                      dplyr::all_of(out_col))
  return(df)
}

# Column selection
column_selection <- function(raw, pathogen = c("COVID", "Influenza", "RSV"),
                             hosp_report = TRUE, hosp_report_unit = "percent",
                             age_group = TRUE) {
  # Select Admissions data
  sel_col <- grep("\\.Admissions", colnames(raw), value = TRUE)
  sel_col <- grep("Change|100.000", sel_col, value = TRUE, invert = TRUE)
  # Select only pathogen of interest
  sel_col <- grep(paste(pathogen, collapse = "|"), sel_col, value = TRUE,
                  ignore.case = TRUE)
  # Keep or not reporting information
  sel_col_report <- NULL
  if (hosp_report) {
    sel_col_report <- grep("reporting", sel_col, value = TRUE,
                           ignore.case = TRUE)
    sel_col_report <- grep(hosp_report_unit, sel_col_report, value = TRUE,
                           ignore.case = TRUE)
    sel_col_report <- grep("pediatric|adult|(A|a)bove", sel_col_report,
                           value = TRUE, ignore.case = TRUE, invert = TRUE)
  }

  sel_col <- grep("reporting", sel_col, value = TRUE, ignore.case = TRUE,
                  invert = TRUE)
  # Keep or not demographic data
  sel_col_demo <- NULL
  if (age_group)
    sel_col_demo <- grep("year|age|75.plus", sel_col, value = TRUE,
                         ignore.case = TRUE)
  sel_col <- grep("year|age|75.plus", sel_col, value = TRUE, ignore.case = TRUE,
                  invert = TRUE)
  # Remove percent data & (adult, pediatric) data
  sel_col <- grep("percent|pediatric|adult", sel_col, value = TRUE,
                  ignore.case = TRUE, invert = TRUE)
  # Output list of selection columns
  col_list <- list(sel_col = sel_col, sel_col_demo = sel_col_demo,
                   sel_col_report = sel_col_report)
  return(col_list)
}

#' Extract data from Weekly Hospital Respiratory Data (HRD) Metrics by
#' Jurisdiction, National Healthcare Safety Network (NHSN)
#'
#' Extract data from NHSN and standardized in SMH format.
#'
#' @param cdc_data_ref CDC reference of the data, by default "ua7e-t2fy"
#' @param pathogen Pathogen to extract, by default all pathogen selected:
#'   "COVID" (for COVID-19 data), "Influenza" and "RSV"
#' @param hosp_report Boolean, if TRUE returns percent/number of hospitals
#'   reporting new admissions of patients of the reporting week
#' @param hosp_report_unit Character string, unit of hospitals reporting:
#'   "percent" (default) or "number"
#' @param age_group Boolean, if TRUE (default) include age group information
#' @param calc_miss Boolean, if TRUE interpolate missing data, by default
#'   `FALSE`
#'
#' @details
#' ## Source:
#' Weekly Hospital Respiratory Data (HRD) Metrics by
#' Jurisdiction, National Healthcare Safety Network (NHSN):
#' [data.cdc.gov](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Hospital-Respiratory-Data-HRD-Metrics-by-Ju/ua7e-t2fy/)
#'
#' ## Column Selection
#'
#' - Observation extracted from: `"Total [PATHOGEN] Admissions"`
#' - Age group information from:
#'   `"Number of Adult [PATHOGEN] Admissions, [AGE GROUP] years"`
#' - Hospital reporting from:
#'   `"[Number|Percent] Hospitals Reporting RSV Admissions"`
#'
#' @export
extract_nhsn <- function(cdc_data_ref = "ua7e-t2fy",
                         pathogen = c("COVID", "Influenza", "RSV"),
                         hosp_report = TRUE, hosp_report_unit = "percent",
                         age_group = TRUE) {
  # Load data
  down_link <- paste0("https://data.cdc.gov/api/views/", cdc_data_ref,
                      "/rows.csv?&accessType=DOWNLOAD")
  raw <- read.csv(down_link)

  # Column selection
  list_col <- column_selection(raw, pathogen = pathogen, age_group = age_group,
                               hosp_report = hosp_report)

  # Filter and standardize data
  df <- cdc_nhsn_standardize(raw, list_col$sel_col)
  if (!is.null(list_col$sel_col_demo)) {
    df_demo <- cdc_nhsn_standardize(raw, list_col$sel_col_demo,
                                    pathogen = pathogen, age_group = TRUE)
    df$age_group <- "0-130"
    df <- rbind(df, df_demo)
  }
  if (!is.null(list_col$sel_col_report)) {
    df_report <- cdc_nhsn_standardize(raw, list_col$sel_col_report,
                                      pathogen = pathogen) |>
      dplyr::rename(report = tidyr::all_of("observation"))
    if (!is.null(list_col$sel_col_demo))
      df_report$age_group <- "0-130"
    df <- dplyr::left_join(df, df_report)
  }
  # Output
  return(df)
}

#' Standardize data output from NHSN into US SMH/hubverse format
#'
#' @param df_us data frame containing NHSN data (for one specific pathogen)
#' @param location2number named character vectors used as an hash table to
#'  translate location name to location FIPS
#' @param abbr2location named character vectors used as an hash table to
#'  translate location abbreviation 2 character code to location name
#' @param report_limit double, remove data point with an associated
#'  hospital report percent under the `report_limit` value for all associated
#'  location
standard_nhsn <- function(df, location2number, abbr2location,
                          report_limit = 0.75) {
  df <- dplyr::mutate(df,
                      report = ifelse(is.na(.data[["report"]]),
                                      unique(na.omit(.data[["report"]])),
                                      .data[["report"]]),
                      .by = c("date", "state_abbr", "pathogen"))
  if (!is.null(report_limit)) {
    df <-
      dplyr::mutate(df, observation = ifelse(.data[["report"]] < report_limit &
                                               !is.na(.data[["report"]]),
                                             NA, .data[["observation"]]))
  }
  df <-
    dplyr::filter(df, !grepl("Region \\d+", .data[["state_abbr"]])) |>
    dplyr::mutate(date = as.Date(date),
                  location = location2number[abbr2location[.data[["state_abbr"]]]],
                  age_cat = dplyr::case_when(.data[["age_group"]] %in%
                                               c("0-4", "5-17", "18-49",
                                                 "50-64") ~ "0-64",
                                             .data[["age_group"]] %in%
                                               c("65-74", "75-130") ~ "65-130",
                                             .data[["age_group"]] %in%
                                               "0-130" ~ "0-130",
                                             .data[["age_group"]] ==
                                               "unknown" ~ NA)) |>
    dplyr::summarise(observation = sum(.data[["observation"]]),
                     .by = c("date", "location", "age_cat")) |>
    dplyr::filter(!is.na(.data[["age_cat"]]), !is.na(.data[["observation"]])) |>
    dplyr::select(tidyr::all_of(c("date", "location", "observation")),
                  age_group = tidyr::all_of("age_cat"))
}

#' Extract data from FLuview
#'
#' Extract data from Fluview Interactive, [Pneumonia and Influenza Mortality
#' Surveillance from the National Center for Health Statistics Mortality
#' Surveillance System](https://gis.cdc.gov/grasp/fluview/mortality.html)
#'
#' @param headers character vectors containing the headers information
#' @param body character string containing the body information
#' @param level character string indicating the geographic level of the data,
#'  either "US" or "state" level
#' @param number2location named character vectors used as an hash table to
#'  translate location fips to location full name
#' @param url character string, url to access data.
#'
#'
fluview_data <- function(headers, body, level, number2location, url) {

  res <- httr::POST(url = url, httr::add_headers(.headers = headers),
                    body = body)

  content <- httr::content(res)

  df <- data.frame(
    "season" =  unlist(purrr::map(content$seasons, "seasonid")),
    "week" =  unlist(purrr::map(content$seasons, "weeknumber")),
    "mmwr" = unlist(purrr::map(content$seasons, "mmwrid")),
    "state" =  unlist(purrr::map(content$seasons, "subgeoid")),
    "value" = unlist(purrr::map(content$seasons, "number_covid19"))
  )

  if (level == "state") {
    df <- dplyr::mutate(df,
                        fips = ifelse(nchar(.data[["state"]]) == 1,
                                      paste0("0", .data[["state"]]),
                                      .data[["state"]]),
                        location_name = number2location[.data[["fips"]]],
                        value =  gsub(",", "", .data[["value"]]) |>
                          as.numeric() |>
                          suppressWarnings())
  } else {
    df <-
      dplyr::mutate(df,
                    value = gsub(",", "", .data[["value"]]) |>
                      as.numeric() |>
                      suppressWarnings(),
                    fips = level,
                    location_name = level)
  }

  if (any(grepl("New York", df$location_name))) {
    df_ny <- dplyr::filter(df, grepl("New York", .data[["location_name"]])) |>
      dplyr::summarise(value = sum(.data[["value"]], na.rm = TRUE),
                       .by = c("season", "week", "mmwr")) |>
      dplyr::mutate(fips = "36", state = "36", location_name = "New York")
    df <- dplyr::bind_rows(dplyr::filter(df, !grepl("New York",
                                                    .data[["location_name"]])),
                           df_ny)
  }
  df
}

#' Standardize data output from Fluview into US SMH/hubverseformat
#'
#' @param df_us data frame containing data at country level
#' @param df_state data frame containing data at state level
#' @param number2location named character vectors used as an hash table to
#'  translate season number to season in "YYYY-YYYY" format
#' @param end_date date, limit date of the output data
#' @param filename character, if provided will write the output in a CSV format
#' at the working directory
standard_fluview <- function(df_us, df_state, number2season, end_date = NULL,
                             filename = NULL) {

  # All location
  df_all <- dplyr::bind_rows(dplyr::filter(df_state,
                                           !is.na(.data[["location_name"]])),
                             df_us)  |>
    dplyr::mutate(season_year = number2season[.data[["season"]]],
                  week = as.numeric(.data[["week"]])) |>
    tidyr::separate(.data[["season_year"]], c("year1", "year2"), sep = "-") |>
    dplyr::mutate(date1 = MMWRweek::MMWRweek2Date(as.numeric(.data[["year1"]]),
                                                  .data[["week"]], 7),
                  date2 = MMWRweek::MMWRweek2Date(as.numeric(.data[["year2"]]),
                                                  .data[["week"]], 7)) |>
    dplyr::arrange(.data[["mmwr"]]) |>
    dplyr::mutate(sel_date = ifelse(.data[["date1"]] >=
                                      dplyr::first(.data[["date1"]]),
                                    as.character(.data[["date1"]]),
                                    as.character(.data[["date2"]])),
                  .by = c("season", "location_name")) |>
    dplyr::mutate(date = as.Date(.data[["sel_date"]]),
                  location = .data[["fips"]], observation = .data[["value"]]) |>
    dplyr::select(tidyr::all_of(c("location", "date", "observation")))
  # Cut the output if necessary
  df_all <- dplyr::filter(df_all, .data[["date"]] <= end_date)
  # write output
  if (!is.null(filename)) {
    write.csv(df_all, filename, row.names = FALSE)
  }
  return(df_all)
}
