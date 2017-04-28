
context("Check JDBC Driver")

test_that("a JDBC driver is available", {
  expect_is(redshift_driver(), "JDBCDriver")
})
