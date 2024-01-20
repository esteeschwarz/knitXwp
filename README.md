# info
just a tiny R package with one function *knit_xwp()* which converts the content of an .md/.Rmd file
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
# load libraries (after you have installed)
library(knitXwp)

# define username, password and blogadress:
setblog(username,password,adress='https://example.com')


# define postID
postid<-0 # you have to set the id unless you want to create a new post

# define .Rmd filename. its good to have the working directory
# be be the one where this file is stored
file<-"yourfile.Rmd"

# call the function
# if you want to create a new post, leave postid out
# adapt categories and keywords
knit_xwp(file,action = "editPost",categories = c("cat1","cat2"),
          mt_keywords=c("tag1","tag2"),
          publish = T,
          postid = postid)
```

## fin
have fun blogging




