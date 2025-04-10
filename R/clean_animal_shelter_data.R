#' @name clean_animal_shelter_data
#' @title Clean Animal Shelter Data
#' @description Cleaning the Animal Shelter dataset by selecting the relevant columns,
#'   recoding outcome types to only 2 options, and converting the `dob` column to `age_at_intake`.
#'
#' @param df A data frame containing animal shelter data.
#'
#' @return A cleaned data frame with selected columns and additional variables:
#'   `outcome_group` and `age_at_intake`.
#'
#' @export
#'
#' @examples
#' # Example of cleaning the animal shelter data
#' raw_data <- read_csv("animal_shelter_raw.csv")
#' cleaned_data <- clean_animal_shelter_data(raw_data)

library(tidyverse)
library(readr)
library(dplyr)

clean_animal_shelter_data <- function(df) {
  df <- df %>%
    select(animal_type, primary_color, sex, dob, intake_condition, intake_type, intake_date, outcome_date, outcome_type) %>%
    na.omit()

  df$outcome_group <- recode(df$outcome_type,
                             "adoption" = "Adopted",
                             "foster" = "Adopted",
                             "foster to adopt" = "Adopted",
                             "homefirst" = "Adopted",
                             "rescue" = "Adopted",
                             "euthanasia" = "Not Adopted",
                             .default = "Not Adopted")

  df$age_at_intake <- as.numeric(difftime(Sys.Date(), df$dob, units = "days")) / 365

  return(df)
}

main <- function(input_file_path, output_file_path) {
  animals <- read_csv(input_file_path)
  cleaned_animals <- clean_animals_data(animals)
  write_csv(cleaned_animals, output_file_path)
}
