#' Convert between distances
#'
#' Performs the conversion based on specified `unit_from` and `unit_to` values.
#'
#' @param dist_value A numerical distance value to be converted.
#' @param unit_from A character string of the distance unit to convert from
#' @param unit_to A character string of the distance unit to convert to
# Add returning value description and tag
#' @return A numeric distance value in the unit specified as `unit_to`.
# Export this function
#' @export

dist_converter <-
function(dist_value,
                           unit_from,
                           unit_to) {
  # Fill in the missing parts of the if-else if-else flow
  if (unit_from == "feet" && unit_to == "meters") {
    return(dist_value * 0.3048)
  } else if (unit_from == "meters" && unit_to == "feet") {
    return(dist_value * 3.2808)
  } else if (unit_from == unit_to) {
    warning("unit_from and unit_to are the same, returning dist_value")
    return(dist_value)
  } else {
    warning("This function only supports conversions between feet and meters.")
  }
}


#' Coefficients for the estimation of child mortality multipliers
#'
#' This is a dataset of coefficients used to estimate multipliers `k(i)` in the TRUSSELL version of
#' the BRASS method, using Coale-Demeny mortality models.
#'
#' @details
#' The basic estimation equation for the Trussell method (equation 4.3) is
#'
#' \deqn{k(i) = a(i) + b(i) P(1)/P(2) + c(i) P(2)/P(3)}
#'
#' - extracted from page 26, Table 4.
#'
#' @docType data
#'
#' @usage data(mlt)
#'
#' @format A data frame
#'
#' @keywords datasets
#'
#' @references United Nations Population Studies (1990) Step-by-Step Guide
#' to the Estimation of Child Mortality No.107:1-83
#' (\href{https://www.un.org/en/development/desa/population/publications/pdf/mortality/stepguide_childmort.pdf}{United Nations})
#'
"mlt"
