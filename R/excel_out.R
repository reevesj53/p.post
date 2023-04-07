#' Export to Excel
#'
#' Export the data frame computed by [calc_post()] to an Excel file
#'
#' @export
#' @param post_prob Data frame calculated by [calc_post()]
#' @param file file name (defaults to "post_prob.xlsx")
#' @return An excel file with the following columns
#'   \itemize{\item \strong{n}: Number of subjects
#'            \item \strong{res}: Number of responders
#'            \item \strong{prob}: Achieved posterior probability of success
#'            }
#'
#' @details
#' [excel_out()] returns an excel file
#'
#' @examples
#' # Generate number of successes for 80 subjects.  Rate, p1, is 0.3.
#' # Posterior probability threshold ranges from
#' # 0.5 to 0.8.
#' p1 <- 0.3
#' p2 <- seq(0.5, 0.8, 0.1)
#' post_prob <- calc_post(80, p1, p2)
#' \dontrun{
#' excel_out(post_prob)
#' }
excel_out <- function(post_prob, file="post_prob.xlsx") {

  openxlsx::openxlsx_setOp("numFmt","0.000")
  rename.vec <- c(N="n", "No. of Responders"="res", "Posterior Probability of Success"="post_prob")
  my_style1 <- openxlsx::createStyle(wrapText = TRUE)
  my_style2 <- openxlsx::createStyle(wrapText = TRUE, textDecoration = "Bold")

  sheet_out <- function(prob1) {
    post_prob <- post_prob |> dplyr::filter(prob==prob1) |> dplyr::select(!prob) |>
      dplyr::rename(tidyselect::all_of(rename.vec))
    sheet_name <- paste("P = ", prob1, sep="")
    openxlsx::addWorksheet(wb, sheetName = sheet_name)
    openxlsx::freezePane(wb, sheet = sheet_name, firstRow = TRUE)
    openxlsx::writeDataTable(wb, sheet_name, x = post_prob, colNames = TRUE, tableStyle = "TableStyleLight9")
    openxlsx::addStyle(wb, sheet_name, my_style1, rows=1, cols = 1:6, gridExpand = TRUE)
    openxlsx::addStyle(wb, sheet_name, my_style2, rows=1, cols = 6)
    openxlsx::setColWidths(wb, sheet_name, cols = 1:6,  widths = c(15,15,15,25,30,40))
    mytext1 <- paste("Number of Responders such that: \n",
                     "Assumes a non-informative Beta(1,1) prior for success.",sep="")
    mytext2 <- paste("Prob (Posterior Probability > ", rate,") >= ", prob1, "\n\n")
    openxlsx::writeData(wb, sheet_name, mytext1, startCol = 5, startRow = 1)
    openxlsx::writeData(wb, sheet_name, mytext2, startCol = 6, startRow = 1)
  }

  wb <- openxlsx::createWorkbook()
  prob <- post_prob |> dplyr::distinct(prob) |> dplyr::pull()
  rate <- post_prob |> dplyr::distinct(rate) |> dplyr::pull()
  purrr::walk(prob,\(x) sheet_out(x))

  openxlsx::saveWorkbook(wb, file, overwrite = TRUE)
}
