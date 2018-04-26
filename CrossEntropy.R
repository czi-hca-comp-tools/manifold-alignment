#input data framne include cellID, clusterID after alignment and datasetID
#load("PBMC.cellcluster.Rdata")
#cellcluster
Hindex<-function(clusterindex,cellcluster){
  ctr=levels(factor(cellcluster$type))[1]
  subdata=cellcluster[cellcluster$cluster==clusterindex,]
  p=dim(subdata[subdata$type==ctr,])[1]/dim(subdata)[1]
  if (p==0){
    return(0)
  }else{
    return(-p*log(p,base=2))
  }
}
Hdistribution<-function(x,l){
  pexp=runif(l,0,1)
  Hexp=-pexp*log(pexp,base=2)
  Hexp[pexp==0]=0
  return(sum(Hexp))
}
emPvalue<-function(times,cellcluster){
  randomH=sapply(1:times,Hdistribution,l=length(levels(factor(cellcluster$cluster))))
  H=sum(sapply(levels(factor(cellcluster$cluster)),Hindex,cellcluster=cellcluster))
  pp=sum(randomH>=H)/length(randomH)
  Hres=list(randomH=randomH,pvalue=pp,H=H)
  return(Hres)

}
Hres=emPvalue(times=1000000,cellcluster=cellcluster)
randomH=Hres$randomH
H=Hres$H
pp=Hres$pvalue
plot(density(randomH),xlim=c(0,max(H,randomH)),main=paste("p value = ",pp,sep=""),xlab="H")
arrows(H,0.2,H,0)
