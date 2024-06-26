\name{knitXwp-package}
\alias{knitXwp-package}
\alias{knitXwp}
\docType{package}
\title{Knit .Rmd to Wordpress blogs}
\description{
This is a package that converts .md/.Rmd files to .html and post to Wordpress.org blogs using \pkg{RWordPress} by duncantl.
}
\details{
\tabular{ll}{
Package: \tab knitXwp\cr
Version: \tab 0.1.6a\cr
License: \tab GNU\cr
Imports: \tab XMLRPC; RWordPress; rmarkdown; markdown\cr
Built: \tab R 4.3.0; ; 2024-03-18 17:54:00 UTC+1; unix\cr
}

This is a tiny function library which solves a small rendering issue of
the knit2wp() function included in the package \pkg{knitr} by Yihui Xie
\url{https://yihui.org/knitr/}
and depends on the yet not maintained, but working functions of \pkg{RWordPress} by
Duncan T. Lang which publish the data via the wordpress rest-API of a
self-hosted wordpress blog.
\url{https://github.com/duncantl/RWordPress}

You have to have the \pkg{RWordPress} library installed, e.g. with:
\code{devtools::install_github(c("duncantl/XMLRPC", "duncantl/RWordPress"))
} to be able use the function.
}
\author{
esteeschwarz
}
\references{
Yihui Xie, Duncan T. Lang
}
\keyword{ package }
\seealso{
\code{XMLRPC, RWordPress, knitr} packages
}
\examples{

}
