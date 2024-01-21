input<-"wp001.Rmd"
input<-rmd
input<-"wp002.md"
apply.css<-T
postid<-2095
title<-"testrwp"
style<-"<style>pre{width: 300px;overflow: scroll;}</style>"

tempmd<-tempdir("mddir")
pid<-get.pid()
ifelse(exists("postid"),pid<-postid,
       ns.rnd<-c(sample(letters,26),sample(0:9,9)),
       pid<-paste0(sample(ns.rnd,6),collapse = ""))

get.css<-function(postid,template,p.html){
css<-paste0(readLines("style.css"),collapse ="")
css<-paste0("#knitxwp-",postid," ",css,collapse = "")
css<-paste0("<style>",css,"</style>",collapse = "")
css
h.content<-paste0(css,'<div id="knitxwp-',postid,'">',p.html,'</div>',collapse = "")
#writeLines(h.content,"output.html")
}
content<-get.css(2095,"style.css",p.html)
rem.toc.obs<-function(p.content){
  content.cl<-gsub("(\\{#toc-(.+?)\\})","",p.content)
}
content.cl
rm(get.css)
rm(rem.toc.obs)

### unique id for toc entries necessary, else a click might jump to a similar entry on another post
p.md
postid<-0
p.content
pid<-get.pid(0)
get.toc.unique<-function(pid,p.content){
  m<-grep("\\{#",p.content)
  p.content[m]
  if(sum(m)>0)
    toc.cl<-gsub("\\(#","(#_pid_-",p.content[m])
    toc.cl<-gsub("\\{#","{#_pid_-",toc.cl)
  toc.cl<-gsub("_pid_",pid,toc.cl)
  toc.cl<-gsub("_pid_",pid,toc.cl)
  m<-grep("\\{#.+?-toc-",toc.cl)
  if(sum(m)>0)
    toc.cl[m]<-gsub("\\{#.+}","",toc.cl[m])
  #toc.id
  toc.cl<-gsub("_pid_",pid,toc.cl)
  toc.cl
  [m]<-toc.id
  }
p.un<-get.toc.unique(0,p.content)
p.un
library(markdown)
mark("README.md",yaml_front_matter("readme.yml"))
mdo<-yaml_front_matter("readme.yml")
mark("README.md",options = mdo)

