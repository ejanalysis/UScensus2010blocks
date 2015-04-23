#' @title Get data.frame with data on all US Census 2010 blocks (pop, lat/lon, etc.)
#' @description Returns a large dataframe with one row per block. This helps assemble the desired fields for all 11m+ blocks, into a single data.frame.
#' @details Warning: It can take 1-2 minutes for this function to return results with default settings (i.e., unless charfips=FALSE is specified).
#'   The full blocks data.frame created by default uses approximately 1 GB of RAM.
#'   The blocks data.frame with just numeric fips and pop uses only about 133 MB and is
#' @param fields Optional vector of character elements specifying which fields to return.
#' @param charfips Optional TRUE by default, specifies if FIPS should be converted to character class with any necessary leading zeroes,
#'   which uses more RAM and takes much longer -- It can take 1-2 minutes for this function to return results unless charfips=FALSE.
#' @return Returns a (large, >11 million rows) dataframe that has specified fields
#'   or by default these 6 columns: fips, pop, lat, lon, area, urban
#' @seealso \code{\link{blocks.fips}}
#' @concept demographics
#' @examples
#' # blocks <- get.blocks()
#' # blocks <- get.blocks(c('fips','pop'))
#' @export
get.blocks <- function(fields=c('fips', 'pop', 'lat', 'lon', 'area', 'urban'), charfips=TRUE) {
  validcolnames <- c('fips', 'pop', 'lat', 'lon', 'area', 'urban')
  if (any(!(fields %in% validcolnames))) {stop( paste('invalid fields - if specified, must be vector with one or more of:', validcolnames))}
  validdatanames <- paste('blocks', validcolnames, sep='.')
  mydatanames <- paste('blocks', fields, sep='.')

#   for (this in varnames) {
#     data(this)
#   }
  extracolnames = validcolnames[!(validcolnames %in% fields)]
  extradatanames = paste('blocks', extracolnames, sep='.')
  alldatanames <- c(mydatanames, extradatanames)
  for (i in length(mydatanames)+1:length(alldatanames)) {
    assign(alldatanames[i], NA)
  }
  blocks <- data.frame(
    get(alldatanames[1]),
    get(alldatanames[2]),
    get(alldatanames[3]),
    get(alldatanames[4]),
    get(alldatanames[5]),
    get(alldatanames[6])
    )
  names(blocks) <- c(fields, extracolnames)
  blocks <- blocks[ , fields, drop=FALSE]

  if ('fips' %in% fields) {
    if (charfips) {
      cat("Converting fips to character with leading zero...")
      blocks$fips <- lead.zeroes(blocks$fips, 15)
    }
  }
  return(blocks)
  #   blocks <- data.frame(
  #     fips=lead.zeroes(blocks.fips,15),
  #     pop=blocks.pop,
  #     lat=blocks.lat,
  #     lon=blocks.lon,
  #     area=blocks.area,
  #     urban=blocks.urban
  #   )
  #rm(blocks.fips, blocks.pop, blocks.lat, blocks.lon, blocks.area, blocks.urban); gc()
}
