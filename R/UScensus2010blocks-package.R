#' @docType package
#' @name UScensus2010blocks-package
#' @aliases UScensus2010blocks blocks
#' @title Census Bureau 2010 block-level data (pop, area, urban, lat/lon) easily compiled into a single data.frame
#' @description
#'   These datasets provide population count, size of block (area), latitude and longitude of internal point,
#'   whether the block is urban, for each US block, based on Census Bureau Census 2010 data.
#'   All States/DC are compiled into a single vector for each field (e.g. pop).
#' @references
#' \code{\link{http://ejanalysis.github.io}} \cr
#' \code{\link{http://www.ejanalysis.com/}} \cr
#' @examples
#'  \dontrun{
#'    blocks <- get.blocks(charfips=FALSE)
#'    by(1e6 * blocks$pop / blocks$area, INDICES=blocks$urban, FUN=mean)
#'  }
NULL
