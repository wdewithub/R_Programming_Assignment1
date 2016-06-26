complete <- function(directory, id=1:332) 
{
  # create a loop:
  #   haal file op
  #   bereken complete cases
  #   voeg toe aan dataframe
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
    }
    bestand <- paste(directory,"/",bestand_base,sep="")
    input <- read.csv(bestand)
    if (monitor==1) {
      resultaat <- c(id[monitor],sum(complete.cases(input)))
    }
    else {
      resultaat <- rbind(resultaat,c(id[monitor],sum(complete.cases(input))))
    }
  }
  return(resultaat)
}