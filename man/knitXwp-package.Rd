\name{knitXwp-package}
\alias{knitXwp-package}
\alias{knitXwp}
\docType{package}
\title{Knit .Rmd to Wordpress blogs}
\description{
This is a package that converts .Rmd files to .html and post to Wordpress.org blogs using \pkg{RWordPress} by duncantl.
}
\details{
\tabular{ll}{
Package: \tab knitXwp\cr
Version: \tab 0.1.5\cr
License: \tab BSD\cr
Imports: \tab RWordPress,XMLRPC,rmarkdown,markdown\cr
Remotes: \tab duncantl/RWordPress,duncantl/XMLRPC\cr
Built: \tab R 4.2.0;2024-01-17 13:29:36 UTC;unix\cr
}

This is a tiny function library which solves a small rendering issue of
the \link{knit2wp} function included in the package \pkg{knitr} by Yihui Xie
\url{https://yihui.org/knitr/}
and depends on the (not maintained anymore), but working functions of \pkg{RWordPress} by
Duncan T. Lang which publish the data via the wordpress rest-API of a self-hosted wordpress blog.
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
