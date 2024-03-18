uploadFile<-function (what, type = guessMIMEType(what), blogid = 0L, 
          login = getOption("WordpressLogin", 
          stop("need a login and password")), remoteName = what, 
          overwrite = TRUE, ..., .server = options("WordpressURL")) 
{
# #   if (inherits(what, "AsIs")) {
# #     content = what
# #   }
# #   else {
# #     if (!file.exists(what)) 
# #       stop("no such file ", what)
# #     content = readBinaryFile(what)
# #   }
#   info = list(name = remoteName, type = type, bits = content, 
#               overwrite = overwrite)
#   info = list(name = what, type = type, bits = content, 
#               overwrite = T)
  info = list(file = what,post_parent=postid)
  # xml.rpc(.server, "wp.uploadFile", as.character(blogid), names(login), 
  #         as.character(login), info, ...)
  xml.rpc(.server,"wp_insert_attachment",as.character(blogid), names(login), 
          as.character(login), file = what)
}

xml.rpc<-function (url, method, ..., .args = list(...), .opts = list(), 
                   .defaultOpts = list(httpheader = c(`Content-Type` = "text/xml"), 
                                       followlocation = TRUE, useragent = useragent), .convert = TRUE, 
                   .curl = getCurlHandle(), useragent = "R-XMLRPC") 
{
  body = createBody(method, .args)
  .defaultOpts[["postfields"]] = saveXML(body)
  if (length(.opts)) 
    .defaultOpts[names(.opts)] = .opts
  rdr = dynCurlReader(.curl, baseURL = url)
  .defaultOpts[["headerfunction"]] = rdr$update
  ans = postForm(url, .opts = .defaultOpts, style = "POST", 
                 curl = .curl)
  hdr = parseHTTPHeader(rdr$header())
  if (as.integer(hdr[["status"]])%/%100 != 2) {
    stop("Problems")
  }
  ans = rdr$value()
  if (is.logical(.convert)) {
    if (.convert) 
      convertToR(ans)
    else ans
  }
  else if (is.function(.convert)) 
    .convert(ans)
  else ans
}
#url<-options("WordpressURL")
xml.rpc<-function (url, method, ..., .args = list(...), .opts = list(), 
                   .defaultOpts = list(httpheader = c(`Content-Type` = "text/xml"), 
                                       followlocation = TRUE, useragent = useragent), .convert = TRUE, 
                   .curl = getCurlHandle(), useragent = "R-XMLRPC") 
{
  body = createBody(method, .args)
  .defaultOpts[["postfields"]] = saveXML(body)
  if (length(.opts)) 
    .defaultOpts[names(.opts)] = .opts
  rdr = dynCurlReader(.curl, baseURL = url)
  .defaultOpts[["headerfunction"]] = rdr$update
  ans = postForm(url, .opts = .defaultOpts, style = "POST", 
                 curl = .curl)
  hdr = parseHTTPHeader(rdr$header())
  if (as.integer(hdr[["status"]])%/%100 != 2) {
    stop("Problems")
  }
  ans = rdr$value()
  if (is.logical(.convert)) {
    if (.convert) 
      convertToR(ans)
    else ans
  }
  else if (is.function(.convert)) 
    .convert(ans)
  else ans
}