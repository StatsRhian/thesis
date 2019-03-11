#### Spectral Clustering Function
# @params:
# X = (numeric matrix) Data Matrix (no.data x no.dimensions)
# k = (integer) number of clusters to extract
# Laplacian = (character string) type of Laplacian. One of 'standard', 'sym' and 'rw'
# graphtype = (character string) type of similarity to be used. One of 'kernel', 'NN' and 'mutualNN'
# params = (list) if graphtype=='kernel'    params = list(sigma = ...)
#                 if graphtype=='NN'        params = list(k = ...)
#                 if graphtype=='mutualNN'  params = list(k = ...)

SpecClust <- function(X, k, Laplacian = 'sym', graphtype = 'NN', params = list(k=10)){
  n <- nrow(X)
  dists <- as.matrix(dist(X))
  if(graphtype=='kernel'){
    A <- exp(-dists^2/2/params$sigma^2)
  }
  else{
    A <- matrix(0, n, n)
    for(i in 1:n) A[i,order(dists[i,])[1:params$k]] <- 1
    if(graphtype=='NN'){
      A <- A+t(A)
      A[which(A>1)] = 1
    }
    else if(graphtype=='mutualNN') A <- A*t(A)
    else stop('graphtype must be one of "kernel", "NN" and "mutualNN".')
  }
  degs <- rowSums(A)
  if(Laplacian=='standard'){
    L <- diag(degs) - A
    E <- try(eigs_sym(L, k, sigma = 1e-10))
    if(inherits(E, 'try-error')){
      E <- eigen(L, symmetric = TRUE)
      E$vectors = E$vectors[,(n-k+1):n]
      E$values = E$values[(n-k+1):n]
    }
    cluster = kmeans(E$vectors, k, nstart = 10)$cluster
  }
  else if(Laplacian=='sym'){
    L <- diag(n) - (1/sqrt(degs))%*%t(1/sqrt(degs))*A
    E <- try(eigs_sym(L, k, sigma = 1e-10))
    if(inherits(E, 'try-error')){
      E <- eigen(L, symmetric = TRUE)
      E$vectors = E$vectors[,(n-k+1):n]
      E$values = E$values[(n-k+1):n]
    }
    for(i in 1:n) E$vectors[i,] = E$vectors[i,]/sqrt(E$vectors[i,]%*%E$vectors[i,])
    cluster = kmeans(E$vectors, k, nstart = 10)$cluster
  }
  else if(Laplacian=='rw'){
    L <- diag(n) - (1/degs)*A
    E <- try(eigs(L, k, sigma = 1e-10))
    if(inherits(E, 'try-error')){
      E <- eigen(L, symmetric = TRUE)
      E$vectors = E$vectors[,(n-k+1):n]
      E$values = E$values[(n-k+1):n]
    }
    cluster = kmeans(E$vectors, k, nstart = 10)$cluster
  }
  else stop('Laplacian must be one of "standard", "sym" and "rw".')
  o = order(cluster)
  A = A[o,o]
  list(affinity = A, vectors = Re(E$vectors), values = Re(E$values), degrees = degs, cluster = cluster)
}