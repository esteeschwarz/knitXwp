# info
just a tiny R package with one function *knit_xwp()* which converts the content of an .Rmd file
first to .md and then to .html in order to publish it to a wordpress blog.   
the function relies on the RWordpress package <https://github.com/duncantl/RWordpress> which is outdated
but still works fine with the wordpress API under (tested) wordpress 6.4.2. 

## preliminary
you have to have `RWordPress` installed. You can do this with:
```R
devtools::install_github(c("duncantl/XMLRPC", "duncantl/RWordPress"))
```
if you dont have *devtools* installed, do that first by:
```R
install.packages("devtools")
```

and then install this (the *knitXwp*-package) with the same routine as:
```R
devtools::install_github(c("esteeschwarz/knitXwp"))
```
## usage
to post an R-Markdown document, you go like this:
```R
# define username, password and blogadress:
options(WordpressLogin = c(c(username='userpassword')),
        WordpressURL = 'https://yourwordpress.blog/xmlrpc.php')

# load libraries (after you have installed)
library(knitXwp)

# define postID
pid<-2108

# define .Rmd filename. its good to have the working directory
# be be the one where this file is stored
rmd<-"wp001.Rmd"

# call the function
knit_xwp(rmd,action = "editPost",categories = c("rR","snc"),
          mt_keywords=c("snc","package"),
          publish = F,
          postid = pid)
```

## fin
have fun blogging




