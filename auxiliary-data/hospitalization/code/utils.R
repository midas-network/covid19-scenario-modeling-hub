# Plot function ---------------
comp_plot <- function(df_nhsn, df_state, state_name, facet_loc = FALSE,
                      year_limit = NULL, font_size = 16, font_face = "plain") {
  if (!facet_loc) {
    df_nhsn <- dplyr::filter(df_nhsn,
                             .data[["location"]] == state_name)
  } else {
    df_nhsn_m <- dplyr::filter(df_nhsn,
                               .data[["location"]] == "Arkansas") |>
      dplyr::mutate(year = format(as.Date(.data[["date"]]), "%Y"),
                    month = format(as.Date(.data[["date"]]), "%m")) |>
      dplyr::summarise(value = sum(.data[["value"]], na.rm = TRUE),
                       .by = c("location", "year", "month"))  |>
      dplyr::mutate(date = as.Date(paste0(.data[["year"]], "/",
                                                .data[["month"]], "/28"),
                                         "%Y/%m/%d")) |>
      dplyr::select(tidyr::all_of(c("date", "value",
                                    "location")))
    df_nhsn <- dplyr::filter(df_nhsn,
                             .data[["location"]] != "Arkansas") |>
      dplyr::select(tidyr::all_of(c("date", "value",
                                    "location"))) |>
      dplyr::mutate(date = as.Date(.data[["date"]])) |>
      rbind(df_nhsn_m) |>
      dplyr::filter(.data[["location"]] %in%
                      df_state$location)
    df_state <- dplyr::mutate(df_state, source = "State Gov.")
  }

  st_nhsn <- dplyr::select(df_nhsn, tidyr::all_of(c("date", "value",
                                                    "location"))) |>
    dplyr::mutate(source = "NHSN")
  df_plot <- rbind(df_state, st_nhsn)

  if (!is.null(year_limit)) {
    df_plot <-
      dplyr::filter(df_plot,
                    .data[["date"]] >= as.Date(paste0(year_limit,
                                                            "-01-01")))
  }

  plot <- ggplot(df_plot, aes(x = .data[["date"]], y = .data[["value"]],
                              color = .data[["source"]],
                              group = .data[["source"]])) +
    geom_line() +
    theme(text = element_text(size = font_size),
          axis.text.y = element_text(size = font_size - 2),
          plot.tag.position = "topright",
          plot.tag.location = "plot",
          plot.tag = element_text(size = font_size),
          legend.text = element_text(size = font_size),
          axis.text.x = element_text(size = font_size - 2),
          axis.title = element_text(size = font_size, face = font_face),
          strip.text = element_text(size = font_size),
          plot.caption = element_text(size = font_size, vjust = 0))

  if (facet_loc) {
    plot <- plot + facet_wrap(~ .data[["location"]], scales = "free",
                              ncol = 4)
    ggsave(paste0("./viz/", state_name, ".png"), width = 26, height = 18)
  } else {
    plot <- plot + ggtitle(state_name)
    ggsave(paste0("./viz/", state_name, ".png"))
  }
  return(plot)
}

simple_plot <- function(df_st, state_name) {
  ggplot(df_st, aes(x = .data[["date"]], y = .data[["value"]],
                    color = .data[["source"]], group = .data[["source"]])) +
    geom_line()
  ggsave(paste0("./viz/", state_name, ".png"))
}

# Aggregate daily to weekly value:
aggreg_weekly_val <- function(df, date_col, date_format, value_col = "value",
                              by_col = NULL) {
  dplyr::mutate(df, epiweek =
                  paste0(MMWRweek::MMWRweek(as.Date(.data[[date_col]],
                                                    date_format))$MMWRyear, "-",
                         MMWRweek::MMWRweek(as.Date(.data[[date_col]],
                                                    date_format))$MMWRweek)) |>
    dplyr::summarise(value = sum(.data[[value_col]]),
                     .by = dplyr::all_of(c("epiweek", by_col))) |>
    tidyr::separate(dplyr::matches("epiweek"),
                    into = c("year", "week"), sep = "-") |>
    dplyr::mutate(date =
                    MMWRweek::MMWRweek2Date(as.numeric(.data[["year"]]),
                                            as.numeric(.data[["week"]]), 7))
}

# Standardized output
st_output <- function(df, source_name, location_name) {
  df |>
    dplyr::mutate(source = source_name, location = location_name) |>
    dplyr::select(tidyr::all_of(c("date", "value", "location",
                                  "source")))
}

# Extract JSON data
extract_data <- function(file) {
  # read the file
  json <- jsonlite::read_json(file)
  json <- json$results[[1]]$result$data$dsr
  # extract pathogen information
  pathogen <- json$DS[[1]]$SH[[1]]$DM1
  pathogen <- purrr:::map_chr(pathogen, "G1")
  pathogen <- trimws(pathogen)
  # extract part with data
  data <- json$DS[[1]]$PH[[1]]$DM0
  # extract values
  purrr::map(seq(2, length(data) - 1), function(x) {
    val <- data[[x]]
    date <- as.POSIXct(as.numeric(val$G0) / 1000, origin = "1970-01-01") |>
      as.Date()
    val <- unlist(val$X)
    if (any(names(val) == "I")) val[grep("I", names(val))] <- 0
    if (any(names(val) == "R")) {
      for (i in grep("R", names(val))) {
        if (i == 1) {
          val[[1]] <- tail(unlist(data[[x - 1]]$X), 1)
        } else {
          val[[i]] <- val[[i - 1]]
        }
      }
    }
    value <- sum(as.numeric(val))
    data.frame(date = date, value = value)
  }) |>
    dplyr::bind_rows()
}
