context("basic functionality")
test_that("core operations for various input types are successful", {

  expect_that(geolocate(c(NA, "10.0.1.1", "", "72.33.67.89", "dds.ec", " ", "search.twitter.com"),
                        .progress=FALSE), is_a("data.frame"))

})
