% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_animal_shelter_data.R
\name{clean_animal_shelter_data}
\alias{clean_animal_shelter_data}
\title{Clean Animal Shelter Data}
\arguments{
\item{df}{A data frame containing animal shelter data.}
}
\value{
A cleaned data frame with selected columns and additional variables:
\code{outcome_group} and \code{age_at_intake}.
}
\description{
Cleaning the Animal Shelter dataset by selecting the relevant columns,
recoding outcome types to only 2 options, and converting the \code{dob} column to \code{age_at_intake}.
}
\examples{
 \dontrun{
# Example of cleaning the animal shelter data
raw_data <- read_csv("animal_shelter_raw.csv")
cleaned_data <- clean_animal_shelter_data(raw_data)
}
}
