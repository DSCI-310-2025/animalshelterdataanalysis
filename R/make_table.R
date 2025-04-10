#' Create a table using the given data columns
#'
#' @param data_cols A dataframe or individual column(s) of a dataframe
#' @param folder The folder and path to write the file to
#' @param name The name of the file to be written
#'
#' @return Writes a new CSV file
#'
#' @export
#'
#' @examples
#' \dontrun{
#' make_table(mtcars$mpg, "output", "mpg_table.csv")
#' }
make_table <- function(data_cols, folder, name) {
  table <- table(data_cols)
  write_csv(as.data.frame(table), file = paste(folder, "/", name, sep = ""))
}
