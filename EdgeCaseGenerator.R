# Edge cases:
# 1. Rare dataset-specific cell type
# 2. Shared but highly imbalanced cell types
# 3. Very different dataset sizes
# 4. Datasets sharing only a small subset of cells

# dge is a gene expression matrix (genes x cells)
# num_per_cluster is a vector of how many cells to sample from each cluster. -1 means all cells.
# use_these_clusters specifies the clusters from which to sample cells. There should be one num_per_cluster element for each element of use_these_clusters.
# Returns a subset of the dge matrix that meets the specified constraints
stratified_sample = function(dge,clusters,num_per_cluster=NULL,use_these_clusters=levels(clusters))
{
  if(is.null(num_per_cluster))
  {
    num_per_cluster = rep(-1,length(levels(clusters)))    
  }
  
  subset = c()
  for (i in use_these_clusters)
  {
    if (num_per_cluster[i]==-1)
    {
      num_to_sample = sum(clusters==i)
    }
    else
    {
      num_to_sample = min(sum(clusters==i),num_per_cluster[i])  
    }
    
    if (num_to_sample == 0){next}
    subset = c(subset,sample(names(clusters)[clusters==i],num_to_sample))
  }
  return(dge[,subset])
}
