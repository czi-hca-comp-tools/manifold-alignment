# manifold-alignment
A repository for manifold applications of manifolds. 
## Metric - Manifold Alighnment.ipynb
A jupyter notebook beginning to explore metrics for evaluating how well the topology of the original datset was maintained. Two methods are tests:

1. KNN-Jaccard Similarity Metric: the k-nearest neighbors for each sample are determined amongst the pre- and post- alignment batches. The average (and standard deviation) Jaccard Similarity between a corrected and raw cell are calculated.
2. Markov Transition RMSE: The Markov transition matrix (diffusion distances normalized to one) is calculated for the pre- and post- aligned batches. The average (and standard deviation) root mean square error between pre- and post- aligned cells is returned

The following alignment methods are evaluated:
1. Cannocial Correlation Analysis (https://www.biorxiv.org/content/early/2017/07/18/164889)
2. Mutual Nearest Neighbors (coming soon)
