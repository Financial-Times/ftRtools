

context("Running queries")

test_that("select queries run on int", {
  query_result <- redshift_query("simple_query.sql",
                                 "int",
                                 Sys.getenv("redshift_username"),
                                 Sys.getenv("redshift_password"))
  expect_equal(is.data.frame(query_result), TRUE)
  expect_gt(nrow(query_result), 0)
})

test_that("select queries run on analytics", {
  query_result <- redshift_query("simple_query.sql",
                                 "analytics",
                                 Sys.getenv("redshift_username"),
                                 Sys.getenv("redshift_password"))
  expect_equal(is.data.frame(query_result), TRUE)
  expect_gt(nrow(query_result), 0)
})

test_that("column names are preserved", {
  query_result <- redshift_query("simple_query.sql",
                                 "analytics",
                                 Sys.getenv("redshift_username"),
                                 Sys.getenv("redshift_password"))
  expect_equal(names(query_result), c("tables"))
})

