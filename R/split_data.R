#' Split a Data Frame into Training and Testing Sets
#'
#' @param df A data frame to be split.
#' @param prop A number between 0 and 1 specifying the proportion of the data to be used for training.
#' @param strata A string specifying the column name for stratified sampling (must be a column in `df`).
#' @param seed An integer for reproducibility of the random split.
#'
#' @return A list containing two elements: train (training data) and test (testing data).
#'
#' @export
#'
#' @examples
#' library(tidymodels)
#' df <- data.frame(
#'   age = c(2, 3, 4, 5, 6, 7, 8, 9),
#'   outcome_group = rep(c("Adopted", "Not Adopted"), 4)
#' )
#' split <- split_data(df, prop = 0.75, strata = "outcome_group", seed = 123)
#' train_data <- split$train
#' test_data <- split$test
split_data <- function(df, prop, strata, seed) {
  set.seed(seed)
  data_split <- initial_split(df, prop = prop, strata = !!rlang::sym(strata))
  train <- training(data_split)
  test <- testing(data_split)
  return(list(train = train, test = test))
}
