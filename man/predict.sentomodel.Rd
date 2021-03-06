% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sentomodel.R
\name{predict.sentomodel}
\alias{predict.sentomodel}
\title{Make predictions from a sentomodel object}
\usage{
\method{predict}{sentomodel}(object, newx, type = "response",
  offset = NULL, ...)
}
\arguments{
\item{object}{a \code{sentomodel} object created with \code{\link{sento_model}}.}

\item{newx}{a data \code{matrix} used for the prediction(s), row-by-row; see
\code{\link{predict.glmnet}}. The number of columns should be equal to \code{sum(sentomodel$nVar)}, being the
number of original sentiment measures and other variables. The variables discarded in the regression process are
dealt with within this function, based on \code{sentomodel$discarded}.}

\item{type}{type of prediction required, a value from \code{c("link", "response", "class")}, see documentation for
\code{\link{predict.glmnet}}.}

\item{offset}{not used.}

\item{...}{not used.}
}
\value{
A prediction output depending on the \code{type} argument.
}
\description{
Prediction method for \code{sentomodel} class, with usage along the lines of
\code{predict.glmnet}, but simplified in terms of parameters.
}
\seealso{
\code{\link{predict.glmnet}}, \code{\link{sento_model}}
}
\author{
Samuel Borms
}
