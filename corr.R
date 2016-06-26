corr <- function(directory,treshold=0) {
  # create loop:
  #   read all files in the directory en concatenate them
  #   check whether for an individual monitor your complete cases exceeds the treshold
  #   indien ja, bereken correlatie tussen sulfate en nitrate voor die monitor
  setwd('C:/Users/ntpuser3/datascience/R programming/assignment1')
  numfiles <- length(list.files(directory))
  for (i in 1:numfiles)  {
    num_complete <- complete(directory,i)
    if (num_complete[2] > treshold) {
      if (i < 10)
      {
        bestand_base <- paste("00",i,".csv",sep="")
      }
      else if (i < 100) 
      {
        bestand_base <- paste("0",i,".csv",sep="")
      }
      else 
      { 
        bestand_base <- paste(i,".csv",sep="")
      }
      bestand <- paste(directory,"/",bestand_base,sep="")
      input <- read.csv(bestand)
      if (!exists("cor_result")) {
        cor_result <- cor(input$sulfate,input$nitrate, use="pairwise.complete.obs")
      }
      else {
        cor_result <- c(cor_result,cor(input$sulfate,input$nitrate,use="pairwise.complete.obs"))
      }
    }
  }
  if (exists("cor_result")) {return(cor_result)}
}