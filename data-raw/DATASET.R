## code to prepare `DATASET` dataset goes here

library(readxl)
mysas <- read_xlsx("data-raw/test.xlsx") |> add_column(rate=0.3, prob=0.5, .before="res")
usethis::use_data(mysas, internal = TRUE, overwrite = TRUE)
