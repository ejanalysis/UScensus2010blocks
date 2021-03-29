#' @title Get data on all US Census 2010 blocks (pop, lat/lon, area, etc.)
#' @description Returns a large dataframe with one row per block. This helps assemble the desired fields for all 11m+ blocks, into a single data.frame.
#' @details The area is in units of square meters.
#'    Warning: It can take 1-2 minutes for this function to return results with default settings (i.e., unless charfips=FALSE is specified).
#'   The full blocks data.frame created by default uses approximately 1 GB of RAM.
#'   The blocks data.frame with just numeric fips and pop uses only about 133 MB and is
#' @param fields Optional vector of character elements specifying which fields to return.
#' @param charfips Optional TRUE by default, specifies if FIPS should be converted to character class with any necessary leading zeroes,
#'   which uses more RAM and takes much longer -- It can take 1-2 minutes for this function to return results unless charfips=FALSE.
#' @return Returns a (large, >11 million rows) data.frame that has specified fields
#'   or by default these 6 columns: fips, pop, lat, lon, area, urban
#' @seealso \code{\link{blocks.fips}}  and \code{\link[UScensus2010]{UScensus2010}}
#' @concept demographics
#' @examples
#' \dontrun{
#' # To assemble blocks data.frame:
#' # 1) Much faster if charfips=FALSE, but
#' #    then cannot treat fips as character with leading zeroes where needed:
#' blocks <- get.blocks( charfips=FALSE )
#' # To convert numeric to character fips later:
#' blocks$fips <- lead.zeroes(blocks$fips, 15)
#' # 2) Slower way, but can get fips as character to begin with:
#' blocks <- get.blocks()
#' # To get just certain fields:
#' blocks <- get.blocks(c('fips','pop'))
#' # This function using defaults is the equivalent of the following:
#' #   require(UScensus2010blocks)
#' #   blocks <- data.frame(
#' #     fips = analyze.stuff::lead.zeroes(blocks.fips,15),
#' #     pop=blocks.pop,
#' #     lat=blocks.lat,
#' #     lon=blocks.lon,
#' #     area=blocks.area,
#' #     urban=blocks.urban
#' #   )
#' }
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
      blocks$fips <- analyze.stuff::lead.zeroes(blocks$fips, 15)
    }
  }
  return(blocks)
}
