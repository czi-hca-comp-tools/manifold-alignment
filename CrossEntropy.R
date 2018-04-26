#load results from Seraut
load("immune.combined.Rdata")
load("ctrl.Rdata")
load("stim.Rdata")
cell=immune.combined@cell.names
cluster=immune.combined@ident
ctrcell=ctrl@cell.names
casecell=stim@cell.names
cellcluster=data.frame(cell=cell,cluster=cluster,type=NA)
index=match(ctrcell,cellcluster$cell)
cellcluster$type[index]="ctrl"
index=match(casecell,cellcluster$cell)
cellcluster$type[index]="stim"
Hindex<-function(clusterindex,cellcluster){
  subdata=cellcluster[cellcluster$cluster==clusterindex,]
  p=dim(subdata[subdata$type=="ctrl",])[1]/dim(subdata)[1]
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
times=1000000
randomH=sapply(1:times,Hdistribution,l=11)
H=sum(sapply(levels(factor(cellcluster$cluster)),Hindex,cellcluster=cellcluster))
pp=sum(randomH>=H)/length(randomH)
plot(density(randomH),xlim=c(0,max(H,randomH)),main=paste("p value = ",pp,sep=""),xlab="H")
arrows(H,0.2,H,0)
