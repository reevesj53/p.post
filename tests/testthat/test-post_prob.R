test_that("p.post matches SAS output", {
  p1 <- 0.3
  p2 <- 0.5
  myr <- calc_post(80, p1, p2)
  expect_equal(mysas, myr)
})
