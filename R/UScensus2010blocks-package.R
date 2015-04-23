#' @docType package
#' @name UScensus2010blocks-package
#' @aliases UScensus2010blocks blocks
#' @title Census Bureau 2010 block-level data (pop, area, urban, lat/lon) easily compiled into a single data.frame
#' @description
#'   These datasets provide population count, size of block (area), latitude and longitude of internal point,
#'   whether the block is urban, for each US block, based on Census Bureau Census 2010 data.
#'   All States/DC are compiled into a single vector for each field (e.g. pop).
#'   @examples
#'    #data(blocks.fips); data('blocks.pop'); blocks=data.frame(fips=blocks.fips, pop=blocks.pop)
#'    # For all the fields:
#'    #data(blocks.fips); data('blocks.pop'); data('blocks.lat'); data(blocks.lon); data(blocks.area); data(blocks.urban)
#'    #  blocks=data.frame(fips=blocks.fips, pop=blocks.pop, lat=blocks.lat, lon=blocks.lon, area=blocks.area, urban=blocks.urban)
#'    #  rm(blocks.fips, blocks.pop, blocks.lat, blocks.lon, blocks.area, blocks.urban); gc()
#'    #  by(1e6 * blocks$pop / blocks$area, INDICES=blocks$urban, FUN=mean)
NULL
