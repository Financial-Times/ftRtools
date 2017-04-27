
<!-- README.md is generated from README.Rmd. Please edit that file -->
ftRtools
========

ftRtools is a package of internal FT Data Science tools for R.

Installation
------------

To use the redshift query elements of this package you need [Java SE JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) installed. To install the package from github use `install_github` function from the `devtools` package.

``` r
devtools::install_github("ftRtools")
```

Examples
--------

To access FT Redshift you will need to use your credentials and be on the FT network. Do not hard code you user name and password into files using these tools. Instead [save your credentials](http://blog.revolutionanalytics.com/2015/11/how-to-store-and-use-authentication-details-with-r.html) in a `.Renviron` file in your home directory and include `.Renviron` in your `.gitignore`. These variable can be accessed using `Sys.getEnv()` as follows:

``` r
redshift_query("my_query.sql",
               "int",
               Sys.getenv("username"),
               Sys.getenv("password"))
```
