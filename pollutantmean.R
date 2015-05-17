pollutantmean <- function(directory, pollutant, id = 1:332) {

  n<-length(id)
  meanspollutant=1:n
  
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
    mydata = read.csv(path)
    bad<-is.na(mydata[pollutant])
    meanspollutant[i]<-mean(mydata[pollutant][!bad])
  }
  
  mean(meanspollutant)
}