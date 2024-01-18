setblog<-function(username,password,adress='https://example.com'){
  cred.array<-password
  if(length(username)==0)
     username<-"username"
  names(cred.array)<-username
  options(WordpressLogin = cred.array,
          WordpressURL = paste0(adress,"/xmlrpc.php"))
}
