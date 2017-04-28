
context("Selecting a cluster")

test_that("select_cluster returns a string",{
  expect_equal(is.character(select_cluster()), TRUE)
  expect_equal(is.character(select_cluster("int")), TRUE)
  expect_equal(is.character(select_cluster("analytics")), TRUE)
})

test_that("select_cluster returns the correct address",{
  expect_equal(select_cluster(), "redshift-dev.dw.in.ft.com:5439/int")
  expect_equal(select_cluster("int"), "redshift-dev.dw.in.ft.com:5439/int")
  expect_equal(select_cluster("analytics"), "analytics.csttwzlr0uam.eu-west-1.redshift.amazonaws.com:5439/analytics")
})

test_that("select_cluster errors on unexpected inputs",{
  expect_error(select_cluster(1), "Cluster name not recognised")
  expect_error(select_cluster("foo"), "Cluster name not recognised")
  expect_error(select_cluster(c("foo","bar")), "Invalid input: length > 1")
  expect_error(select_cluster(NA), "Cluster name not recognised")
})

test_that("select_cluster handles capitalisation",{
  expect_equal(select_cluster("INT"), select_cluster("int"))
  expect_equal(select_cluster("Analytics"), select_cluster("analytics"))
})
