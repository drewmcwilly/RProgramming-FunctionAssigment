corr<-function(directory, threshold=0){
#create vectors to hold data fram columns
  
      corr_vect<-vector()
#startloop
    ccase_files<-complete(directory)
    id<- ccase_files[ccase_files["nobs"]>threshold,]
    id<-id[,"id"]
    for(i in id){
#build monitor File name
    
        d<-paste("000",i,sep="")
        mon_fil<-substr(d,nchar(d)-2,nchar(d))
        curr_file<-paste(directory,"/",mon_fil,".csv",sep="",collapse = NULL)
#Read csv into dfrave
#hold only complete cases in cframe
    
      dframe<-read.csv(curr_file)
      cframe<-dframe[complete.cases(dframe),]
#derive correlation on two vectors  
    corr_vect<-c(corr_vect, cor(cframe[,"sulfate"],cframe[,"nitrate"]))  
    
  }
  
  
#return vector
    corr_vect
  
}