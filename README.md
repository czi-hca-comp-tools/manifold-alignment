# manifold-alignment
A repository for manifold applications of manifolds. 
## Metric - Manifold Alighnment.ipynb
A jupyter notebook beginning to explore metrics for evaluating how well the topology of the original datset was maintained. Two methods are used:

1. KNN-Jaccard Similarity Metric: the k-nearest neighbors for each sample are determined amongst the pre- and post- alignment batches. The average (and standard deviation) Jaccard Similarity between a corrected and raw cell are calculated.
2. Markov Transition RMSE: The Markov transition matrix (diffusion distances normalized to one) is calculated for the pre- and post- aligned batches. The average (and standard deviation) root mean square error between pre- and post- aligned cells is returned

The following alignment methods are evaluated:
1. Canonical Correlation Analysis (https://www.biorxiv.org/content/early/2017/07/18/164889)
2. Mutual Nearest Neighbors (coming soon)

## Edge case generator
We created a simple R function to facilitate the creation of "real simulated datasets" that push the limits of alignment approaches.
Four examples of difficult "edge cases" that can be created by in silico manipulation are:
1. Rare dataset-specific cell type
2. Shared but highly imbalanced cell types
3. Very different dataset sizes
4. Highly distinct datasets sharing only a small subset of cells

## CrossEntropy
This is a R function that measures how well the cells from different datasets are mixed together after performing a manifold alignment.
A P value is generated that characterizes the extent of mixing, compared against a random background.
Input is a data matrix (data.frame) consisting of alignment results returned by programs such as Seurat MultiCCA: row=cells, cols=(cell id, cluster_id_after_alignment, dataset_id) 

