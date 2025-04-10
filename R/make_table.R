#' @name make_table
#' @title Creates a Table and Writes It to a CSV File
#' @description Creates a table using the given data columns and writes it to the specified folder as a CSV file.
#'
#' @param data_cols A dataframe or individual column(s) from a dataframe to create the table.
#' @param folder The folder and path where the CSV file will be saved.
#' @param name The name of the CSV file to be written.
#'
#' @return Writes a new CSV file to the specified folder.
#' @export
#'
#' @examples
#' \dontrun{
#' make_table(data_cols, folder = "path/to/folder", name = "output.csv")
#' }


library(readr)

make_table <- function(data_cols, folder, name) {
  table <- table(data_cols)
  readr::write_csv(as.data.frame(table), file = paste(folder, "/", name, sep = ""))
}
