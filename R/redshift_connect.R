
select_cluster <- function(cluster_name = "int"){
  cluster_name <- tolower(cluster_name)
  if(length(cluster_name) != 1) stop("Invalid input: length > 1")
  if(!cluster_name %in% c("int","analytics")) stop("Cluster name not recognised")
  base::switch(cluster_name,
         int = "redshift-dev.dw.in.ft.com:5439/int",
         analytics = "analytics.csttwzlr0uam.eu-west-1.redshift.amazonaws.com:5439/analytics")
}


connect_url <- function(cluster_name, username, password){
  host <- ftRtools:::select_cluster(cluster_name)
  base::paste0("jdbc:redshift://",
         host,
         "?user=",
         username,
         "&password=",
         password,
         "&ssl=true&sslfactory=com.amazon.redshift.ssl.NonValidatingFactory")
}

redshift_connection <- function(cluster_name, username, password){
  driver <- ftRtools:::redshift_driver()
  url <- ftRtools:::connect_url(cluster_name, username, password)
  RJDBC::dbConnect(driver, url)
}
