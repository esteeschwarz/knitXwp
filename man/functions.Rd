\name{knit_xwp}
\alias{knit_xwp}
\alias{setblog}
\title{knit & post function}
\description{
   This is a function that allows you to post and edit content to a Wordpress blog.
   The functions to specify (adress) where to post are documented in the \code{RWordPress} package.
 }
\usage{
setblog(username,password,adress='https://example.com')

knit_xwp(input, apply.css = FALSE, keep.files = FALSE, title = "A post from R", ...,
          action = c("newPost", "editPost", "newPage"),
          postid, publish = TRUE)
}
 \arguments{
  \item{username}{username, expected character}
  \item{password}{password, expected character}
  \item{adress}{blog URL, expected character}
  \item{input}{the filename of the .Rmd or .md input file in the working directory}
  \item{apply.css}{(default=FALSE), you can specify a \code{style.css} file in the working directory containing rules to apply to the post. a \code{div} element with \code{id=postid} will be created with the according CSS rules }
  \item{keep.files}{wether to keep figures and md output, if default = FALSE, these will be stored in a temporary directory}
  \item{title}{the post title if new post}
  \item{...}{additional parameters passed to \code{xml.rpc}}
  \item{action}{the name of the operation/method. these are the names of the relevant RWordPress functions \code{\link{newPost}}, \code{\link{editPost}}, \code{\link{newPage}} which are called accordingly}
  \item{postid}{the id of the page or post of interest. if not specified and \code{action="newPost"}, a new post with new ID will be created, which you can use, when you edit the post later.}
  \item{publish}{wether to publish (default=TRUE) or not publish the post}
}
 \value{}
 \examples{}
 \keyword{IO}
 \concept{blogging}
