pollutantmean <- function(directory, pollutant, id=1:332) 
{
  # for loop schrijven: 
  #   haal read.csv met de naam id.csv
  #   zet de waarde van de pollutant in die file bij in een vector (c(a,b)?)
  #   bereken dan de mean van de ganse vector met !is.na
  setwd('C:/Users/ntpuser3/datascience/R programming/assignment1')
  for (monitor in 1:length(id)) 
  {
    if (id[monitor] < 10)
    {
      bestand_base <- paste("00",id[monitor],".csv",sep="")
    }
    else if (id[monitor] < 100) 
    {
      bestand_base <- paste("0",id[monitor],".csv",sep="")
    }
    else 
    { 
      bestand_base <- paste(id[monitor],".csv",sep="")
      bestand_base <- paste(id[monitor],".csv",sep="")
    
    }
    bestand <- paste(directory,"/",bestand_base,sep="")
    if (!exists("input")) 
    {
      input <- read.csv(bestand)
    }
    else {
      input <- rbind(input,read.csv(bestand))
    }
  }
   print(mean(input[!is.na(input[[pollutant]]),pollutant])) 
}

#Alternatief voor if monitor==1: 
#for (file in file_list){
#   
#   # if the merged dataset doesn't exist, create it
#   if (!exists("dataset")){
#     dataset <- read.table(file, header=TRUE, sep="\t")
#   }
#   
#   # if the merged dataset does exist, append to it
#   if (exists("dataset")){
#     temp_dataset <-read.table(file, header=TRUE, sep="\t")
#     dataset<-rbind(dataset, temp_dataset)
#     rm(temp_dataset)
#   }
#   
# }
  