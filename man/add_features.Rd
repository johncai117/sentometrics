% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sentocorpus.R
\name{add_features}
\alias{add_features}
\title{Add feature columns to a (sento)corpus object}
\usage{
add_features(corpus, featuresdf = NULL, keywords = NULL,
  do.binary = TRUE, do.regex = FALSE)
}
\arguments{
\item{corpus}{a \code{sentocorpus} object created with \code{\link{sento_corpus}}, or a \pkg{quanteda}
\code{\link[quanteda]{corpus}} object.}

\item{featuresdf}{a named \code{data.frame} of type \code{numeric} where each columns is a new feature to be added to the
inputted \code{corpus} object. If the number of rows in \code{featuresdf} is not equal to the number of documents
in \code{corpus}, recycling will occur. The numeric values should be between 0 and 1 (included).}

\item{keywords}{a named \code{list}. For every element, a new feature column is added with a value of 1 for the texts
in which (at least one of) the keyword(s) appear(s), and 0 if not (for \code{do.binary = TRUE}), or with as value the
normalized number of times the keyword(s) occur(s) in the text (for \code{do.binary = FALSE}). If no texts match a
keyword, no column is added. The \code{list} names are used as the names of the new features. For more complex searching,
instead of just keywords, one can also directly use a single regex expression to define a new feature (see the details section).}

\item{do.binary}{a \code{logical}, if \code{do.binary = FALSE}, the number of occurrences are normalized
between 0 and 1 (see argument \code{keywords}).}

\item{do.regex}{a \code{logical} vector equal in length to the number of elements in the \code{keywords} argument
\code{list}, or a single value if it applies to all. It should be set to \code{TRUE} at those positions where a single
regex expression is used to identify the particular feature.}
}
\value{
An updated \code{corpus} object.
}
\description{
Adds new feature columns, either user-supplied or based on keyword(s)/regex pattern search, to
a provided \code{sentocorpus} or a \pkg{quanteda} \code{\link[quanteda]{corpus}} object.
}
\details{
If a provided feature name is already part of the corpus, it will be replaced. The \code{featuresdf} and
\code{keywords} arguments can be provided at the same time, or only one of them, leaving the other at \code{NULL}. We use
the \pkg{stringi} package for searching the keywords. The \code{do.regex} argument points to the corresponding elements
in \code{keywords}. For \code{FALSE}, we transform the keywords into a simple regex expression, involving \code{"\\b"} for
exact word boundary matching and (if multiple keywords) \code{|} as OR operator. The elements associated to \code{TRUE} do
not undergo this transformation, and are evaluated as given, if the corresponding keywords vector consists of only one
expression. For a large corpus and/or complex regex patterns, this function may require some patience. Scaling between 0
and 1 is performed via min-max normalization, per column.
}
\examples{
data("usnews", package = "sentometrics")

set.seed(505)

# construct a corpus and add (a) feature(s) to it
corpus <- quanteda::corpus_sample(sento_corpus(corpusdf = usnews), 500)
corpus1 <- add_features(corpus,
                        featuresdf = data.frame(random = runif(quanteda::ndoc(corpus))))
corpus2 <- add_features(corpus,
                        keywords = list(pres = "president", war = "war"),
                        do.binary = FALSE)
corpus3 <- add_features(corpus,
                        keywords = list(pres = c("Obama", "US president")))
corpus4 <- add_features(corpus,
                        featuresdf = data.frame(all = 1),
                        keywords = list(pres1 = "Obama|US [p|P]resident",
                                        pres2 = "\\\\bObama\\\\b|\\\\bUS president\\\\b",
                                        war = "war"),
                        do.regex = c(TRUE, TRUE, FALSE))

sum(quanteda::docvars(corpus3, "pres")) ==
  sum(quanteda::docvars(corpus4, "pres2")) # TRUE

# adding a complementary feature
nonpres <- data.frame(nonpres = as.numeric(!quanteda::docvars(corpus3, "pres")))
corpus3 <- add_features(corpus3, featuresdf = nonpres)

}
\author{
Samuel Borms
}
