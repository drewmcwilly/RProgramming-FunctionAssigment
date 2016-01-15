pollutantmean<-function(directory, pollutant, id=1:332){
  #function will read in csv and calculate mean of provided column
  
#Create empty vector to store numeric values
  vect_poll<-vector()
#startloop
  
  for(i in id){
#build monitor File name
    mon_fil=""
    d<-paste("000",i,sep="")
    mon_fil<-substr(d,nchar(d)-2,nchar(d))
    
#dframe holds the data
    
    curr_file<-paste(directory,"/",mon_fil,".csv",sep="",collapse = NULL)
    dframe<-read.csv(curr_file)
    
#build a vector of fromm each file based on the pollutant provided
    
    vect_poll<-c(vect_poll,dframe[,pollutant])
#remove NA values
    vect_poll<-vect_poll[!is.na(vect_poll)]
#END LOOP
    
  }
  mean(vect_poll)
  
  
  
}