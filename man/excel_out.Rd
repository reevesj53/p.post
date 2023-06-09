% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/excel_out.R
\name{excel_out}
\alias{excel_out}
\title{Export to Excel}
\usage{
excel_out(post_prob, file = "post_prob.xlsx")
}
\arguments{
\item{post_prob}{Data frame calculated by \code{\link[=calc_post]{calc_post()}}.}

\item{file}{file name (defaults to "post_prob.xlsx").}
}
\value{
An excel file with the following columns
\itemize{\item \strong{n}: Number of subjects.
\item \strong{res}: Number of responders.
\item \strong{prob}: Achieved posterior probability of success.
}
}
\description{
Export the data frame computed by \code{\link[=calc_post]{calc_post()}} to an Excel file.
}
\details{
\code{\link[=excel_out]{excel_out()}} saves an excel file to the working directory.
}
\examples{
# Generate number of successes for 80 subjects.  Rate, p1, is 0.3.
# Posterior probability threshold ranges from
# 0.5 to 0.8.
p1 <- 0.3
p2 <- seq(0.5, 0.8, 0.1)
post_prob <- calc_post(80, p1, p2)
\dontrun{
excel_out(post_prob)
}
}
