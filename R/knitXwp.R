library("rmarkdown")
library("RWordPress")
library("markdown")

# options(WordpressLogin = c(c(username='password')),
#         WordpressURL = 'https://example.com/xmlrpc.php')

#backtop.css(2085)
knit_xwp<-function (file, apply.yaml = FALSE, apply.css = FALSE, update.img = FALSE, keep.files=FALSE, git.out = FALSE, title = "A post from R", ...,
          action = c("newPost", "editPost", "newPage"),
          postid = 0, publish = TRUE, test = FALSE)
{
### style of the back-to-top button of the section headers
backtop.css<-function(pid){
sprintf('<div id="%s-top-1"><style>.backtop a{font-size:24px;text-decoration:none;}</style></div>', pid )
}

get.yaml<-function(file){
  yaml.post<-yaml_front_matter(file)
  postid<-yaml.post$post$postid
  action<-yaml.post$post$action
  publish<-yaml.post$post$publish
  e1<-expression(mt_keywords<-c(yaml.post$post$tag))
  e2<-expression(categories<-c(yaml.post$post$categories))
  e1
  e2
}
### get unique id for section entries
  get.pid<-function(postid){
    ns.rnd<-c(sample(letters,26),sample(0:9,9))
    ifelse(postid>0,pid<-postid,
           pid<-paste0(sample(ns.rnd,6),collapse = ""))

  }

### apply css to div of post
  get.css<-function(pid,template,p.html){
    css<-paste0(readLines("style.css"),collapse ="")
    css<-paste0("#knitxwp-",pid," ",css,collapse = "")
    css<-paste0("<style>",css,"</style>",collapse = "")
    h.content<-paste0(css,'<div id="knitxwp-',pid,'">',p.html,'</div>',collapse = "")
  }

### apply ids and backtotop button to section entries and toc
  get.toc.unique<-function(pid,p.content){
    m1<-grep("\\{#",p.content)
    if(sum(m1)>0)
      toc.cl<-gsub("\\(#(.+?\\))","(#_pid_-\\1",p.content[m1])
    toc.cl<-gsub("\\{#(.+?)[ \\}].*",'{id="_pid_-\\1"}',toc.cl,)
    toc.cl<-gsub("_pid_",pid,toc.cl)
    m2<-grep("\\{id=.+?-toc-",toc.cl)
    if(sum(m2)>0)
      toc.cl[m2]<-gsub("\\{id=.+?\\}","",toc.cl[m2])
    top.div<-sprintf('#%s-top-1',pid)
    top.ref<-sprintf('<a class="backtop" href="%s">&#8682;</a>',top.div)
    top.repl<-sprintf('%s \\1',top.ref)
    m4<-grep("(\\{id)",toc.cl)
    toc.cl[m4][2:length(m4)]<-gsub("(\\{id.+?\\})",top.repl,toc.cl[m4][2:length(m4)])
    p.content[m1]<-toc.cl
    p.content<-c(backtop.css(pid),"\n",p.content)
    return(p.content)
  }
  get.git.md<-function(p.content){
    m3<-grep("\\{#",p.content)
    if(sum(m3)>0)
      p.content[m3]<-gsub("\\{#.+?}","",p.content[m3])
    return(p.content)
  }
  test.upload<-function(file){
    ada.uploads<-uploadFile(file)
    ada.uploads$attachment_id
    return(ada.uploads)
  }
 # f<-1
  #png.array<-c(1,2)
  get.png.src<-function(md,png.array=update.img){
  pngfolder<-"_files/figure-markdown_phpextra/"
  #mdsrc<-"README_files/figure-markdown_phpextra/"
  #png.array<-c(1,2,3,4)
      mdsrc<-paste0(f.ns,pngfolder)
      pngs<-list.files(mdsrc)
      png.label.cpt<-paste0(mdsrc,pngs[png.array])
      png.label.cpt
      # png.size.cpt<-file.size(png.label.cpt)
      # png.size.int<-sum(png.size.cpt)

  if (length(pngs)>0&sum(png.array!=F)>1){
      for (f in 1:length(pngs[png.array])) {
        png.label<-pngs[png.array[f]]
        png.link<-paste0(mdsrc,png.label)
        png.link
        png.size<-file.size(png.link)
        png.src.up<-test.upload(png.link)
        png.src<-png.src.up$url
        png.id<-png.src.up$attachment_id
        regx<-png.link
        regx
        m<-grep(regx,md)
        repl<-png.src
          md[m]<-gsub(regx,repl,md[m])
          cat('updated "',png.label,'@',png.src,'with ID:',png.id,'"\n')
      }
  }
    return(md)
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
  if(ext=="md")
    p.md<-readLines(rmd)
  pid<-get.pid(postid)
  p.md<-get.toc.unique(pid,p.content)
  p.content<-p.md
  if(git.out==T)
    writeLines(get.git.md(p.content),md.ren)
  ##########################################
  pngfolder<-"_files/figure-markdown_phpextra/"
  #mdsrc<-"README_files/figure-markdown_phpextra/"
  #png.array<-c(1,2,3,4)
  mdsrc<-paste0(f.ns,pngfolder)
  pngs<-list.files(mdsrc)
  png.array.x<-1:length(pngs)
  png.label.cpt<-paste0(mdsrc,pngs[png.array.x])
  png.label.cpt
  png.size.cpt<-file.size(png.label.cpt)
  png.size.int<-sum(png.size.cpt)
  if (png.array.x[2]==0)
    png.size.int<-0
  md.png<-p.content
  if(png.size.int>100000|sum(length(pngs)>0&png.array!=F)==length(png.array))
    md.png<-get.png.src(p.content)
  p.content<-md.png
  writeLines(p.content,"xwp-output.md")
  ifelse(apply.yaml!=F,{
    mdo<-yaml_front_matter(apply.yaml)
    if(png.size.int<100000)
      mdo$output$`markdown::html_format`$options$embed_resources<-TRUE
     p.html<-mark(p.content,options = mdo)
     },p.html<-mark(p.content))
  # ifelse(apply.yaml!=F,
  #        {mdo<-yaml_front_matter(apply.yaml)
  #        p.html<-mark(p.content,options = mdo)},
  #        p.html<-mark(p.content))
  content<-p.html
  if(apply.css!=F)
     content<-get.css(pid,apply.css,p.html)
  writeLines(content,"xwp-output.html")
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
