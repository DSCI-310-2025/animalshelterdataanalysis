#' Generate a Proportional Stacked Bar Plot showing the proportion of a categorical variable (`x`)
#' grouped by another categorical variable (`class`). The plot uses relative
#' proportions (i.e., stacked bars summing to 100%) and includes axis labels.
#'
#' @param dataset A data frame containing the data to be plotted.
#' @param x A string specifying the name of the categorical variable to be plotted on the x-axis.
#' @param x_name A string used as the label for the x-axis.
#' @param class A string specifying the name of the grouping variable to fill the bars.
#' @param class_name A string used as the label for the y-axis (often something like "Proportion" or the name of the group variable).
#'
#' @return A ggplot object showing the proportional stacked bar chart.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' data <- data.frame(
#'   animal_type = c("Dog", "Dog", "Cat", "Cat", "Dog"),
#'   outcome_group = c("Adopted", "Not Adopted", "Adopted", "Not Adopted", "Adopted")
#' )
#'
#' make_barplot(data, x = "animal_type", x_name = "Animal Type",
#'              class = "outcome_group", class_name = "Outcome Group")
#' }

library(ggplot2)
library(rlang)

make_barplot <- function(dataset, x, x_name, class, class_name){
  # Check if dataset is a data frame
  if (is.null(dataset) || !is.data.frame(dataset)) {
    stop("Error: The dataset must be a data frame.")
  }

  # Check if x and class columns exist in the dataset
  if (!(x %in% names(dataset))) {
    stop(paste("Error: The column", x, "does not exist in the dataset."))
  }

  if (!(class %in% names(dataset))) {
    stop(paste("Error: The column", class, "does not exist in the dataset."))
  }

  # Check if x and class are categorical (either character or factor)
  if (!is.character(dataset[[x]]) && !is.factor(dataset[[x]])) {
    stop(paste("Error: The column", x, "must be a character or factor column (categorical variable)."))
  }

  if (!is.character(dataset[[class]]) && !is.factor(dataset[[class]])) {
    stop(paste("Error: The column", class, "must be a character or factor column (categorical variable)."))
  }

  figure <- ggplot(dataset, aes(x = !!sym(x), fill = !!sym(class))) +
    geom_bar(position = "fill") +
    labs(x = x_name,
         y = class_name) +
    theme_minimal() +
    scale_y_continuous(labels = scales::percent) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

  return(figure)
}
