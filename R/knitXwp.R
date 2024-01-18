library("rmarkdown")
library("RWordPress")
library("markdown")

knit_xwp<-function (input, title = "A post from R", ...,
          action = c("newPost", "editPost", "newPage"),
          postid, publish = TRUE)
{
  rmd<-input
  render(rmd)
  md.ns<-gsub("\\.Rmd",".md",rmd)
  p.content<-readLines(md.ns)
  p.content
  p.html<-mark(p.content)
  content<-p.html

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
                               ...), appID = appID, publish = publish)
  if (action == "editPost")
    WPargs = c(postid = postid, WPargs)
  do.call(action, args = WPargs)
}
