#' Query an FT Redshift cluster.
#'
#' \code{redshift_query} returns the output of a SQL query on one of the FT
#' Redshift clusters.
#'
#' @param sql_file File name (and path) of a .sql you would like to run.
#' @param cluster The name of the cluster on which the query should run. Use
#'   'int' for the INT cluster and 'analytics' for the Analytics cluster.
#' @param username Your Redshift username.
#' @param password Your Redshift passowrd.
#' @return A dataframe of the query output.
redshift_query <- function(sql_file, cluster, username, password){
  query <- base::paste(base::readLines(sql_file), collapse = '\n')
  connection <- ftRtools::redshift_connection(cluster, username, password)
  results <- RJDBC::dbGetQuery(connection, query)
  RJDBC::dbDisconnect(connection)
  results
}

