#' Query an FT Redshift cluster.
#'
#' \code{redshift_query} returns the output of a SQL query on one of the FT
#' Redshift clusters. You must be connected to the FT internal network to use
#' this function. If you are commiting code to  github, do not write your
#' redshift user name and password into the file. Instead create a .Renviron
#' file in your home directory and access the credentials via
#' \code{Sys.getEnv()} (see examples).
#'
#' @param sql_file File name (and path) of a .sql you would like to run.
#' @param cluster The name of the cluster on which the query should run. Use
#'   'int' for the INT cluster and 'analytics' for the Analytics cluster.
#' @param username Your Redshift username.
#' @param password Your Redshift passowrd.
#' @return A dataframe of the query output.
#' @examples
#' \dontrun{
#' redshift_query("my_query.sql","int",Sys.getEnv("redshift_username"),Sys.getEnv("redshift_password"))
#' }
#'
#' @export
redshift_query <- function(sql_file, cluster, username, password){
  query <- base::paste(readLines(sql_file, warn = FALSE), collapse = '\n')
  connection <- ftRtools:::redshift_connection(cluster, username, password)
  results <- RJDBC::dbGetQuery(connection, query)
  RJDBC::dbDisconnect(connection)
  results
}

#' send Statement
#'
#' Method for sending insert queries
redshift_insert <- function(statement, cluster, username, password){
  connection <- ftRtools:::redshift_connection(cluster, username, password)
  try(DBI::dbSendStatement(conn = connection,
                   statement = statement))
  RJDBC::dbDisconnect(connection)
}

