% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sentomeasures_methods.R
\name{get_measures}
\alias{get_measures}
\title{Get the sentiment measures}
\usage{
get_measures(sentomeasures, format = "wide")
}
\arguments{
\item{sentomeasures}{a \code{sentomeasures} object created using \code{\link{sento_measures}}.}

\item{format}{a single \code{character} vector, one of \code{c("wide", "long")}.}
}
\value{
The panel of sentiment measures under \code{sentomeasures[["measures"]]}, in wide or long format.
}
\description{
Returns the sentiment measures in either wide (by default) or long format.
}
\author{
Samuel Borms
}
