# UScensus2010blocks package

## This [UScensus2010blocks package](https://ejanalysis.github.io/UScensus2010blocks/) provides data on 11 million Census blocks (the entire USA).

Each field (e.g., pop contains population counts) is stored as a vector in one RData file for the entire USA's 11 million plus blocks. These can be quickly compiled into a single data.frame that has over 11 million rows and one column per field.

The fields are FIPS code (fips), population count (pop), latitude (lat), longitude (lon), physical size (area), and urban vs rural code (urban).

## Installation

This package is not on CRAN yet, but you can install it from Github:

```r
if (!require('devtools')) install.packages('devtools')
devtools::install_github('ejanalysis/UScensus2010blocks')
```

## Documentation

In addition to documentation in the package, the help in pdf format is here:
[http://ejanalysis.github.io/UScensus2010blocks/UScensus2010blocks.pdf](http://ejanalysis.github.io/UScensus2010blocks/UScensus2010blocks.pdf)

## Related Packages

This package is one of a series of [R packages related to environmental justice (EJ) analysis](http://ejanalysis.github.io/), as part of [ejanalysis.com](http://www.ejanalysis.com).  

This and related packages, once each is made available as a public repository on GitHub, until available on cran, can be installed using the devtools package: 

```r
if (!require('devtools')) install.packages('devtools')
devtools::install_github("ejanalysis/analyze.stuff")  
devtools::install_github("ejanalysis/countyhealthrankings")  
devtools::install_github("ejanalysis/UScensus2010blocks")  
devtools::install_github("ejanalysis/ACSdownload")  
devtools::install_github(c("ejanalysis/proxistat", "ejanalysis/ejanalysis"))
devtools::install_github("ejanalysis/ejscreen")
```
