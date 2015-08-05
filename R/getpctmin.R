# to get calculated variable like pctmin from delaware.blk10, or other data 
# from package called UScensus2010blk
# rather than from UScensus2010blocks package

getpctmin <- function(x) {with(x@data, ifelse(P0010001>0, 1 - (P0050003 / P0010001), 0 ) ) }

# e.g., 
if (1==0) {
  require(UScensus2010)
  install.blk("osx")
  data("delaware.blk10")
  pctmin <- getpctmin(delaware.blk10)
  hist(pctmin, 100)
  
}
