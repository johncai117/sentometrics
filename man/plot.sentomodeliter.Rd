% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sentomodel.R
\name{plot.sentomodeliter}
\alias{plot.sentomodeliter}
\title{Plot iterative predictions versus realized values}
\usage{
\method{plot}{sentomodeliter}(x, ...)
}
\arguments{
\item{x}{a \code{sentomodeliter} object created using \code{\link{sento_model}}.}

\item{...}{not used.}
}
\value{
Returns a simple \code{\link{ggplot}} object, which can be added onto (or to alter its default elements) by using
the \code{+} operator.
}
\description{
Displays a plot of all predictions made through the iterative model computation as incorporated in the
input \code{sentomodeliter} object, as well as the corresponding true values.
}
\details{
See \code{\link{sento_model}} for an elaborate modelling example including the plotting of out-of-sample
performance.
}
\author{
Samuel Borms
}
