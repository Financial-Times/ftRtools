
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

context("Creating the connection url")

test_that("connect_url has length 1", {
  expect_equal(length(connect_url("int","un","pw")), 1)
})

test_that("connect_url returns a string", {
  expect_equal(is.character(connect_url("analytics", "un", "pw")), TRUE)
})

test_that("connect_url errors if username or password are missing", {
  expect_error(connect_url("int"), "Redshift credentials missing")
  expect_error(connect_url("int", "un"), "Redshift credentials missing")
  expect_error(connect_url("int", password = "pw"), "Redshift credentials missing")
  expect_error(connect_url("analytics", "un", NA), "Redshift credentials missing")
  expect_error(connect_url("analytics", "un", character(0)), "Redshift credentials missing")
})

test_that("connect_url errors if username or password are the wrong length", {
  expect_error(connect_url("analytics", c("un1","un2"), "pw"), "Invalid credentials")
  expect_error(connect_url("int", "un", c("pw1","pw2")), "Invalid credentials")
})

test_that("connect_url errors if username or password are not strings", {
  expect_error(connect_url("int", 1, 2), "Invalid credentials")
  expect_error(connect_url("int", list(un = "un"), "pw"), "Invalid credentials")
})

test_that("connect_url handles string escapes", {
  expect_equal(grepl("ssl.NonValidatingFactory",connect_url("int","un",'te"st')), TRUE)
  expect_equal(grepl("ssl.NonValidatingFactory",connect_url("int","un","te'st")), TRUE)
})

context("Connecting to Redshift")

test_that("a JDBC connection object is created for int", {
  expect_is(redshift_connection("int",
                                Sys.getenv("redshift_username"),
                                Sys.getenv("redshift_password")),
            "JDBCConnection")
})

test_that("a JDBC connection object is created for analytics", {
  expect_is(redshift_connection("analytics",
                                Sys.getenv("redshift_username"),
                                Sys.getenv("redshift_password")),
            "JDBCConnection")
})

