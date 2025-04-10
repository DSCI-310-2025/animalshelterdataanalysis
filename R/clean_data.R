#' Cleaning the Animal Shelter Dataset
#'
#' This function selects relevant columns, recodes outcome types, and creates an age variable
#'
#' @param df A data frame containing animal shelter data
#'
#' @return A cleaned data frame with selected columns and additional variables:
#' `outcome_group` and `age_at_intake`.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' raw_data <- read_csv("animal_shelter_raw.csv")
#' cleaned_data <- clean_animal_shelter_data(raw_data)
#' }
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

#' Run the data cleaning pipeline from command line
#'
#' @param input_file_path Path to input CSV file
#' @param output_file_path Path to save output CSV file
#'
#' @return Writes a cleaned CSV file to disk
#'
#' @examples
#' \dontrun{
#' main("raw_data.csv", "cleaned_data.csv")
#' }
main <- function(input_file_path, output_file_path) {
  animals <- read_csv(input_file_path)
  # Fix the function name here - it was inconsistent with the definition
  cleaned_animals <- clean_animal_shelter_data(animals)
  write_csv(cleaned_animals, output_file_path)
}
