getMedia <- function (num = 100, blogid = 0L, login = getOption("WordpressLogin", stop("need a login and password")), ...,
                                        .server = getServerURL())
{
  ans = xml.rpc(.server, "wp.getMediaLibrary", as.integer(blogid),
                names(login), as.character(login), as.integer(num), ...)
  m2<-lapply(ans,rbind)
  m3<-do.call("rbind",lapply(m2, as.data.frame))
}

deleteMedia<-function (num=0, blogid = 0L, login = getOption("WordpressLogin", stop("need a login and password")), ...,
                                            .server = getServerURL())
{
  ans = xml.rpc(.server, "wp_delete_post", as.integer(blogid),
                names(login), as.character(login), as.integer(num), ...)
  # m2<-lapply(ans,rbind)
  # m3<-do.call("rbind",lapply(m2, as.data.frame))
}
postid<-2203
### this the available method for post/media deleting, doesnt work with duncantl xml.rpc
deleteMedia <- function(postid, login = getOption("WordpressLogin", stop("need a login and password")),
                        appId = "RWordPress", ..., .server = getServerURL())
  {
    xml.rpc(.server, "wp.deletePost", 
            names(login), as.character(login),  as.character(postid))
  }
