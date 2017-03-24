
redshift_query <- function(sql_file, cluster, username, password){
  query <- base::readLines(sql_file)
  connection <- ftRtools::redshift_connection(cluster, username, password)
  results <- RJDBC::dbGetQuery(connection, query)
  RJDBC::dbDisconnect(connection)
  results
}
