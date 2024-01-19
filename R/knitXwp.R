library("rmarkdown")
library("RWordPress")
library("markdown")

options(WordpressLogin = c(c(username='password')),
        WordpressURL = 'https://example.com/xmlrpc.php')

backtop.css<-"
<div>
<style>
.backtop {font-size:0.6em;}
</style>
</div>
"

knit_xwp<-function (file, apply.css=FALSE, keep.files=FALSE, git.out = FALSE, title = "A post from R", ...,
          action = c("newPost", "editPost", "newPage"),
          postid = 0, publish = TRUE, test = FALSE)
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
      toc.cl
    #toc.cl[1]<-paste0(toc.cl[])
    toc.cl<-gsub("\\{#","{#_pid_-",toc.cl)
    toc.cl<-gsub("_pid_",pid,toc.cl)
    toc.cl<-gsub("_pid_",pid,toc.cl)
    m2<-grep("\\{#.+?-toc-",toc.cl)
    if(sum(m2)>0)
      toc.cl[m2]<-gsub("\\{#.+}","",toc.cl[m2])
      toc.cl[m2[1]]<-paste0(toc.cl[m2[1]],"{#toc-1}",collapse = "")
    #toc.cl<-gsub("_pid_",pid,toc.cl)
    toc.cl
    m4<-grep("(\\{#)",toc.cl)
    toc.cl[m4][2:length(m4)]<-gsub("(\\{#)",'[top](#toc-1){class="backtop"}\\1',toc.cl[m4][2:length(m4)])
    toc.cl
    p.content[m1]<-toc.cl
    p.content<-c(backtop.css,p.content)
    return(p.content)
  }
  get.git.md<-function(p.content){
    m3<-grep("\\{#",p.content)
    if(sum(m3)>0)
      p.content[m3]<-gsub("\\{#.+?}","",p.content[m3])
    return(p.content)
  }
  rmd<-file
  ext<-gsub(".*((\\.)(.*))","\\3",rmd)
  f.ns<-gsub("(.*)((\\.)(.*))","\\1",rmd)
  md.ren<-paste0(f.ns,".md")

  if(ext=="Rmd"){
    ifelse(keep.files==F,
           render(rmd,output_dir = tempdir()),
           render(rmd))
    ifelse(keep.files==F,md.ns<-paste0(tempdir(),"/",f.ns,".md"),
           md.ns<-md.ren)
  p.content<-readLines(md.ns)
  }
  #p.content
  if(ext=="md")
    p.md<-readLines(rmd)
  pid<-get.pid(postid)
  p.md<-get.toc.unique(pid,p.content)
  #p.md
  writeLines(p.md,"xwp-output.md")
  if(git.out==T)
    writeLines(get.git.md(p.content),md.ren)

  p.html<-mark(p.md)
  content<-p.html
  if(apply.css==T)
     content<-get.css(pid,"style.css",p.html)
  writeLines(content,"xwp-output.html")
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
  if(test==F)
    do.call(action, args = WPargs)
}
