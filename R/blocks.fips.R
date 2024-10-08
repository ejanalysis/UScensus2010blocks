#' @name blocks.fips
#' @docType data
#' @aliases blocks fips FIPS
#' @title fips: Over 11 million Census Bureau 2010 block-level values
#' @description These data sets provide population count, size of block (area), latitude and longitude of internal point,
#'   whether the block is urban, for each US block, based on Census Bureau Census 2010 data,
#'   each of these fields as a single data file (RData), all sorted in the same order, enabling quick combination into a data.frame.
#'   All States/DC are compiled into a single data.frame.
#' @details 
#'   blocks <- get.blocks() \cr
#'   # or to load into memory just this one vector: \cr
#'   data(blocks.fips) \cr
#' @source 2010 Census from Census Bureau \url{http://www.census.gov}
#'   obtained 2014/2015 compiled from multiple Census files of State-level population, area, internal point, or urban code.
#'   Slightly modified to store FIPS as numeric field, pop as integer, and urban as logical, to save RAM.
#' @seealso See \code{\link{get.blocks}} in \pkg{UScensus2010blocks} to assemble this and other fields into a blocks data.frame.
#'   See the \code{\link[UScensus2010]{UScensus2010}} package and related datasets, some of which are on CRAN and others only here: \url{http://lakshmi.calit2.uci.edu/census2000/}
#'   but note that package provides spatial data in a single file per State,
#'   while this package provides non-spatial data (just lat/lon) that can quickly be assembled into a single large data.frame.
#' @keywords datasets
#' @format A vector with 11078297 elements (Census 2010 blocks). If all the related datasets are compiled as a blocks data.frame, they provide the following:
#' \itemize{
#'  \item   [1] "fips"  (numeric - can be converted to character with leading zeroes via lead.zeroes(blocks$fips, 15)
#'  \item   [2] "pop"  (integer) - Population count in Census 2010
#'  \item   [3] "urban" (logical)
#'  \item   [4] "lat" (numeric) - decimal degrees
#'  \item   [5] "lon" (numeric) - decimal degrees
#'  \item   [6] "area" (numeric) - units?  Need to check. ****
#' }
NULL
