\name{knitXwp-package}
\alias{knitXwp-package}
\alias{knitXwp}
\docType{package}
\title{Knit .Rmd to Wordpress blogs}
\description{
This is a package that converts .Rmd files to .html and post to Wordpress.org blogs using the package RWordpress by duncantl.
}
\details{
\tabular{ll}{
Package: \tab knitXwp\cr
Version: \tab 0.1-0\cr
License: \tab BSD\cr
Imports: \tab RWordpress; rmarkdown; markdown\cr
Built: \tab R 4.2.0; ; 2024-01-17 13:29:36 UTC; unix\cr
}

This is a small function library which solves a small rendering problem of
the knit2wp() function included in the package knitr by Yihui Xie
\url{https://yihui.org/knitr/}
and depends on the yet heavily outdated, but working package RWordPress by
Duncan T. Lang which publishs the data via the wordpress rest-API of a
self-hosted wordpress blog.
\url{https://github.com/duncantl/RWordPress}
TODO: ref rm. All the functions require a login and password. This is specified
as a named character vector with one element. The value is the password
and the name is the login. So we specify this as
\code{c(duncan = "mypassword")}.
Rather than specifying this in each call, we can set the value of the R option
\code{WordpressLogin} to this vector. By defalt, the functions look
there for the login and password.

For the functions that require a blog identifier, we can usually give
the value 0 to indicate the default blog.  Alternatively, you can get
the blog identifier by calling \code{getUsersBlogs}. The identifier is
in the element \code{blogid}.

The following are a list of the R functions, the corresponding
XMLRPC method and a link to the API reference to that function
(where the documentation exists).
You should consult that documentation for the number and types of
the parameters expected and the return type.

}
\author{
esteeschwarz
}
\references{
Yihui Xie, Duncan T. Lang
}
\keyword{ package }
\seealso{
\code{XMLRPC;RWordPress;knitr} package
}
\examples{

}
