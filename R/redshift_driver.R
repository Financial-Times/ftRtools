# Redshift Driver

redshift_driver <- function(){
  RJDBC::JDBC(driverClass = "com.amazon.redshift.jdbc42.Driver",
              classPath = base::system.file("drivers", "RedshiftJDBC42-1.2.1.1001.jar", package = "ftRtools"),
              identifier.quote = "`")
}
