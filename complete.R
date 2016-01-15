complete<-function(directory, id=1:332){
#create vectors to hold data frame columns
      vector_id<-vector()
      vector_nrow<-vector()
#startloop
    for(i in id){
#build monitor File name string
        mon_fil=""
        d<-paste("000",i,sep="")
        mon_fil<-substr(d,nchar(d)-2,nchar(d))
        curr_file<-paste(directory,"/",mon_fil,".csv",sep="",collapse = NULL)
#Read data into dframe
    
        dframe<-read.csv(curr_file)
        com_rows<-nrow(dframe[complete.cases(dframe),])
#Evaluate if there are any complete rows        
        if(com_rows!=0){
          vector_id<-c(vector_id,i)
          vector_nrow<-c(vector_nrow,com_rows)
        }
    
#End loop        
  }
#Build data Frame and return
  CompleteFrame<-data.frame(id=vector_id,nobs=vector_nrow)
  CompleteFrame
  
}
