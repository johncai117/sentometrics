% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sentomeasures_main.R
\name{aggregate.sentiment}
\alias{aggregate.sentiment}
\title{Aggregate textual sentiment across documents and time}
\usage{
\method{aggregate}{sentiment}(x, ctr, ...)
}
\arguments{
\item{x}{a \code{sentiment} object created using \code{\link{compute_sentiment}} (from a
\code{sentocorpus} object), or an output from \code{\link{to_sentiment}}.}

\item{ctr}{output from a \code{\link{ctr_agg}} call. The \code{howWithin} and \code{nCore} elements are ignored.}

\item{...}{not used.}
}
\value{
A \code{sentomeasures} object.
}
\description{
Condenses document-level textual sentiment scores into a panel of textual sentiment
measures by aggregating across documents and time. This function is called within \code{\link{sento_measures}},
applied on the output of \code{\link{compute_sentiment}}.
}
\examples{
data("usnews", package = "sentometrics")
data("list_lexicons", package = "sentometrics")
data("list_valence_shifters", package = "sentometrics")

# computation of sentiment and aggregation into sentiment measures
corpus <- sento_corpus(corpusdf = usnews)
corpusSample <- quanteda::corpus_sample(corpus, size = 500)
l <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")], list_valence_shifters[["en"]])
sent <- compute_sentiment(corpusSample, l, how = "counts")
ctr <- ctr_agg(howTime = c("linear"), by = "year", lag = 3)
sentomeasures <- aggregate(sent, ctr)

}
\seealso{
\code{\link{compute_sentiment}}, \code{\link{ctr_agg}}, \code{\link{sento_measures}}
}
\author{
Samuel Borms, Keven Bluteau
}
