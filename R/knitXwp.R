library("rmarkdown")
library("RWordPress")
library("markdown")

options(WordpressLogin = c(c(username='password')),
        WordpressURL = 'https://example.com/xmlrpc.php')


knit_xwp<-function (input, apply.css=F, title = "A post from R", ...,
          action = c("newPost", "editPost", "newPage"),
          postid = 0, publish = TRUE)
{

  get.pid<-function(postid){
    ns.rnd<-c(sample(letters,26),sample(0:9,9))
    ifelse(postid>0,pid<-postid,
           pid<-paste0(sample(ns.rnd,6),collapse = ""))

  }

  get.css<-function(pid,template,p.html){
    css<-paste0(readLines("style.css"),collapse ="")
    css<-paste0("#knitxwp-",pid," ",css,collapse = "")
    css<-paste0("<style>",css,"</style>",collapse = "")
    h.content<-paste0(css,'<div id="knitxwp-',pid,'">',p.html,'</div>',collapse = "")
  }
  get.toc.unique<-function(pid,p.content){
    m1<-grep("\\{#",p.content)
    if(sum(m1)>0)
      toc.cl<-gsub("\\(#","(#_pid_-",p.content[m1])
    toc.cl<-gsub("\\{#","{#_pid_-",toc.cl)
    toc.cl<-gsub("_pid_",pid,toc.cl)
    toc.cl<-gsub("_pid_",pid,toc.cl)
    m2<-grep("\\{#.+?-toc-",toc.cl)
    if(sum(m2)>0)
      toc.cl[m2]<-gsub("\\{#.+}","",toc.cl[m2])
    toc.cl<-gsub("_pid_",pid,toc.cl)
    p.content[m1]<-toc.cl
    return(p.content)
  }

  rmd<-input
  ext<-gsub(".*((\\.)(.*))","\\3",rmd)
  f.ns<-gsub("(.*)((\\.)(.*))","\\1",rmd)
  if(ext=="Rmd"){
    render(rmd,output_dir = tempdir())
  #md.ns<-gsub("\\.Rmd",".md",rmd)
  md.ns<-paste0(tempdir(),"/",f.ns,".md")
  p.content<-readLines(md.ns)
  }
  if(ext=="md")
    p.md<-readLines(rmd)
  pid<-get.pid(postid)
  p.md<-get.toc.unique(pid,p.content)
  p.html<-mark(p.md)
  content<-p.html
  if(apply.css==T)
     content<-get.css(pid,"style.css",p.html)
  writeLines(content,"output.html")
  #on.exit(unlink(out))
#  content = file_string(out)
  #content = mark(text = out)
  # shortcode = rep(shortcode, length.out = 2L)
  # if (shortcode[1])
  #   content = gsub("<pre><code class=\"([[:alpha:]]+)\">(.+?)</code></pre>",
  #                  "[sourcecode language=\"\\1\"]\\2[/sourcecode]",
  #                  content)
  # content = gsub("<pre><code( class=\"no-highlight\"|)>(.+?)</code></pre>",
  #                if (shortcode[2])
  #                  "[sourcecode]\\2[/sourcecode]"
  #                else "<pre>\\2</pre>", content)
  content = enc2utf8(content)
  title = enc2utf8(title)
  action = match.arg(action)
  WPargs = list(content = list(description = content, title = title,
                               ...), publish = publish)
  if (action == "editPost")
    WPargs = c(postid = postid, WPargs)
  do.call(action, args = WPargs)
}
