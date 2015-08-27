#' @docType package
#' @name UScensus2010blocks-package
#' @aliases UScensus2010blocks blocks
#' @title Census 2010 Data for all US Blocks (pop, area, urban, lat/lon)
#' @description
#'   The entire set of over 11 million Census blocks in the United States of America
#'   as a single data.frame, with just population count, FIPS code, latitude and longitude,
#'   area (size), and whether the block is urban.
#' @seealso \code{\link[UScensus2010]{UScensus2010}} package and related datasets, some of which are on CRAN and others only here: \url{http://lakshmi.calit2.uci.edu/census2000/}
#' @references
#' \url{http://ejanalysis.github.io} \cr
#' \url{http://www.ejanalysis.com/} \cr
#' @examples
#'  \dontrun{
#'    blocks <- get.blocks(charfips=FALSE)
#'    by(1e6 * blocks$pop / blocks$area, INDICES=blocks$urban, FUN=mean)
#'  }
NULL
