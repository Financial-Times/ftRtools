
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ftRtools

ftRtools is a package of internal FT Data Science tools for R.

## Installation

To use the redshift query elements of this package you need [Java SE
JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
installed. To install the package from Github use `install_github`
function from the `devtools` package.

``` r
devtools::install_github("Financial-Times/ftRtools")
```

## Credentials

To access FT Redshift you will need to use your credentials and be on
the FT network. Do not hard code you username and password into files
using these tools. Instead, use one of the available
[alternatives](https://db.rstudio.com/best-practices/managing-credentials/),
two of which are described below.

### .Renviron

One way to [save your
credentials](http://blog.revolutionanalytics.com/2015/11/how-to-store-and-use-authentication-details-with-r.html)
is in a `.Renviron` file in your home directory and to include
`.Renviron` in your `.gitignore`. These variable can be accessed using
`Sys.getEnv()` as follows:

``` r
redshift_query("my_query.sql",
               "int",
               Sys.getenv("username"),
               Sys.getenv("password"))
```

For more information on the `.Renviron` file, see
[here](https://csgillespie.github.io/efficientR/r-startup.html#renviron)

### RStudio API

If you are working in RStudio, you can use the RStudio API as follows.

``` r
redshift_query("my_query.sql",
               "int",
               rstudioapi::askForPassword("username"),
               rstudioapi::askForPassword("password"))
```

Bear in mind that if using this method, you will need to input your
credentials every time you run this code.
