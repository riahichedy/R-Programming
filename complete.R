complete <- function(directory, id = 1:332) {
  
  n<-length(id)
  nobs=1:n
  
  for (i in 1:n){
    if(id[i]<10) {
      path<-paste("./",directory,"/00",id[i],".csv",sep="")
    }
    else if(id[i]<100){
      path<-paste("./",directory,"/0",id[i],".csv",sep="")
    }
    else {
      path<-paste("./",directory,"/",id[i],".csv",sep="")
    }
    n2<-dim(mydata)[1]
    count=0
    for(j in 1:n2){
      if(!((mydata[j,"sulfate"]=NA) || (mydata[j,"nitrate"]=NA))){
        count=count+1
      }
    }
    nobs[i]<-count 
  }
  
  result <- data.frame(id=id,nobs=nobs)
}