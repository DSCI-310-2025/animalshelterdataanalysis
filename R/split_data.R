#' @name split_data
#' @title Split a Data Frame into Training and Testing Sets
#' @description
#' Split a Data Frame into Training and Testing Sets
#'
#' Uses the `initial_split()` function from the `rsample` package (via `tidymodels`) to split a data frame into training and testing sets.
#'
#' @param df A data frame to be split.
#' @param prop A numeric value between 0 and 1 specifying the proportion of the data to be used for training (e.g., `0.75` for 75% training data).
#' @param strata A string specifying the column name for stratified sampling (must be a column in `df`).
#' @param seed An integer for reproducibility of the random split.
#'
#' @return A list containing two elements:
#' \describe{
#'   \item{train}{The training subset of the data.}
#'   \item{test}{The testing subset of the data.}
#' }
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(tidymodels)
#' df <- data.frame(
#'   age = c(2, 3, 4, 5, 6, 7, 8, 9),
#'   outcome_group = rep(c("Adopted", "Not Adopted"), 4)
#' )
#'
#' split <- split_data(df, prop = 0.75, strata = "outcome_group", seed = 123)
#' train_data <- split[[1]]
#' test_data <- split[[2]]
#' }


library(tidymodels)

split_data <- function(df, prop, strata, seed) {
  set.seed(seed)
  data_split <- rsample::initial_split(df, prop = prop, strata = !!rlang::sym(strata))
  train <- rsample::training(data_split)
  test <- rsample::testing(data_split)
  return(list(train = train, test = test))
}
