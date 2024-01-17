\name{knit.xwp}
\alias{knit.xwp}

\title{knit & post function}
\description{
   This is a function that allows us to post and edit content to a
   Wordpress blog.
   The functions to specify (adress) where to post are documented in the \code{RWordPress} package.
 }
 \usage{
knit.xwp(input, title = "A post from knitr", ..., envir = parent.frame(),
          shortcode = FALSE, action = c("newPost", "editPost", "newPage"),
          postid, publish = TRUE)

}
 \arguments{
 \item{input}{the filename of the .Rmd input file}
 \item{...}{additional parameters passed to \code{xml.rpc}}
 \item{postid}{the id of the page or post of interest}
 \item{action}{the name of the operation/method}
 \item{publish}{wether to publish(default=TRUE) or not publish the post}

 }
 \value{}
 \examples{}
 \keyword{IO}
 \concept{blogging}
