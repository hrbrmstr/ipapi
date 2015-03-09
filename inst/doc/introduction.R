## ----setup, echo = FALSE, message = FALSE--------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
options(dplyr.print_min = 4L, dplyr.print_max = 4L)
library(ipapi)

## ----geo1, message=FALSE-------------------------------------------------
geolocate(c(NA, "10.0.1.1", "", "72.33.67.89", "dds.ec", " ", "search.twitter.com"), 
          .progress=FALSE)

