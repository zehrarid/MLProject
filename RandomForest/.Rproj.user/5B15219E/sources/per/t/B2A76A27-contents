library(h2o)
h2o.init()

dframe1 <- MSstatsQC::S9Site54

dframe0 <- filter(dframe1,Precursor=="VLVLDTDYK")
dframe0$Added_Column <- "PASS"
colnames(dframe0)[9]<- "Result"

dframe2 <- filter(dframe1,Precursor=="VLVLDTDYK")
dframe2$Added_Column <- "NO PASS"
colnames(dframe2)[9]<- "Result"


for (i in 1:nrow(dframe0))
{
  for (j in 4:8)
  {
    a = runif(1,1,10)
    if (a>3)
    {
      dframe2[i,j]<-dframe0[i,j]+mean(dframe0[,j])+sd(dframe0[,j])*runif(1,0,1)
    }
    else
    {
      if(dframe0[i,j]-(mean(dframe0[,j])+sd(dframe0[,j])*runif(1,0,1))<0)
      {
        ;
      }
      else 
      {
        dframe2[i,j]<- dframe0[i,j]-mean(dframe0[,j])+sd(dframe0[,j])*runif(1,0,1)
      }
        
    }
  }
}

guideset <- rbind(dframe0,dframe2)
guideset$Result = as.factor(guideset$Result)

