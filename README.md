[![Build Status](https://travis-ci.org/hrbrmstr/ipapi.png)](https://travis-ci.org/hrbrmstr/ipapi)

ipapi is a package to geolocate IPv4/6 addresses and/or domain names using ip-api.com's API

The following functions are implemented:

-   `geolocate` - lookup a vector of IPv4/6 addresses and/or domain names and return a `data.table` of results

### News

-   Version `0.1` released

### Installation

``` r
devtools::install_github("hrbrmstr/ipapi")
```

### Usage

``` r
library(ipapi)
```

    ## Loading required package: data.table

``` r
# current verison
packageVersion("ipapi")
```

    ## [1] '0.1'

``` r
geolocate(c(NA, "10.0.1.1", "", "72.33.67.89", "dds.ec", " ", "search.twitter.com"),
                        .progress=FALSE)
```

    ##                                           as          city       country countryCode                             isp
    ## 1: AS7922 Comcast Cable Communications, Inc.       Eastham United States          US                   Comcast Cable
    ## 2:                                        NA            NA            NA          NA                              NA
    ## 3: AS7922 Comcast Cable Communications, Inc.       Eastham United States          US                   Comcast Cable
    ## 4:      AS59 University of Wisconsin Madison       Madison United States          US University of Wisconsin Madison
    ## 5:               AS62567 Digital Ocean, Inc.      New York United States          US                   Digital Ocean
    ## 6: AS7922 Comcast Cable Communications, Inc.       Eastham United States          US                   Comcast Cable
    ## 7:                      AS13414 Twitter Inc. San Francisco United States          US                         Twitter
    ##        lat       lon                             org         query region    regionName  status            timezone
    ## 1: 41.8301  -69.9739                   Comcast Cable 50.252.233.22     MA Massachusetts success    America/New_York
    ## 2:      NA        NA                              NA      10.0.1.1     NA            NA    fail                  NA
    ## 3: 41.8301  -69.9739                   Comcast Cable 50.252.233.22     MA Massachusetts success    America/New_York
    ## 4: 43.0731  -89.4012 University of Wisconsin Madison   72.33.67.89     WI     Wisconsin success     America/Chicago
    ## 5: 40.7490  -73.9865                   Digital Ocean 162.243.111.4     NY      New York success    America/New_York
    ## 6: 41.8301  -69.9739                   Comcast Cable 50.252.233.22     MA Massachusetts success    America/New_York
    ## 7: 37.7697 -122.3933                         Twitter 199.59.148.84     CA    California success America/Los_Angeles
    ##      zip
    ## 1: 02642
    ## 2:    NA
    ## 3: 02642
    ## 4: 53706
    ## 5: 10118
    ## 6: 02642
    ## 7: 94107

### Test Results

``` r
library(ipapi)
library(testthat)

Sys.Date()
```

    ## [1] "2015-03-09"

``` r
test_dir("tests/")
```

    ## basic functionality : .

[![ropensci\_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
