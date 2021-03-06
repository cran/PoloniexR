% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PoloniexTrading.R
\docType{methods}
\name{GetPoloniexTradingURL,PoloniexTradingAPI-method}
\alias{GetPoloniexTradingURL,PoloniexTradingAPI-method}
\title{Returns REST service URL for the Poloniex Trading API}
\usage{
\S4method{GetPoloniexTradingURL}{PoloniexTradingAPI}(theObject)
}
\arguments{
\item{theObject}{The object on which the function should be called}
}
\value{
trading.base.url - a length-one character vector.
 Represents the Poloniex Trading API service base url.
}
\description{
Returns REST service URL for the Poloniex Trading API
}
\examples{
\dontrun{
poloniex.trading <- PoloniexTradingAPI(your.key, your.secret)
GetPoloniexTradingURL(poloniex.trading)
}
}
