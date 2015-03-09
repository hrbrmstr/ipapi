base_url <- "http://ip-api.com/json"

trim <- function(x) { gsub("(^\ +|\ +$)", "", x) }

#' Geolocate an IP address (v4 o4 v6) or domain name via \url{ip-api.com} API
#'
#' Given a character vector of IP addresses (v4 or v6) and/or domain names,
#' this function will return a \code{data.table} of geolocated values with
#' the columns mapped to the \code{ip-api.com}'s successful response fields
#' (see: \url{http://ip-api.com/docs/api:returned_values} for more info).
#'
#' A small delay is introducted to each geolocation call to help avoid having
#' your IP address being banned by the \code{ip-api.com} servers.
#'
#' If there is an error in the \code{http} transaction, a warning will be
#' generated and the lookup response will be populated with \code{NA}s.
#' Similarly, if there is a geocoding failure, the response for that query will
#' also be populated with \code{NA}s
#'
#' @param entites character vector of items to geolocate
#' @param .progress show a progress bar? (useful if geolocating many entities)
#' @return \code{data.table} of responses
#' @export
#' @examples \dontrun{
#' resp <- geolocate(c(NA, "10.0.1.1", "", "72.33.67.89", "dds.ec", " ",
#'                         "search.twitter.com"))
#' resp[,c(9,4,7,8),with=F]
#'            query countryCode       lon                             org
#' ## 1: 50.252.233.22          US  -69.9739                   Comcast Cable
#' ## 2:      10.0.1.1          NA        NA                              NA
#' ## 3: 50.252.233.22          US  -69.9739                   Comcast Cable
#' ## 4:   72.33.67.89          US  -89.4012 University of Wisconsin Madison
#' ## 5: 162.243.111.4          US  -73.9865                   Digital Ocean
#' ## 6: 50.252.233.22          US  -69.9739                   Comcast Cable
#' ## 7: 199.59.148.11          US -122.3933                         Twitter
#' }
geolocate <- function(entities, .progress = TRUE) {

  pboptions(type = ifelse(.progress, "txt", "none"))

  rbindlist(pblapply(entities, get_loc), fill = TRUE)

}

get_loc <- function(entity=NA) {

  Sys.sleep(0.15) # help prevent banning

  url <- ifelse(is.na(entity), base_url, paste0(base_url, "/", trim(entity)))

  res <- GET(url)
  success <- warn_for_status(res)

  if (success) {
    res_p <- content(res, as = "parsed")
    if (res_p$status != "fail") {
      dat <- data.frame(res_p)
    } else {
      dat <- data.table(query = entity, status="fail")
    }
  } else {
    dat <- data.table(query = entity)
  }

  return(dat)

}
