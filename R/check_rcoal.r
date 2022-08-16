M <- 5000
ntx <- 5
trees <- vector(M, mode = "list")
for(i in 1:M){
  trees[[i]] <- rcoal(n = ntx)
}

get_height <- function(tree){
  ape::node.depth.edgelength(tree)[1]
}

hs <- unlist(
  lapply(trees, get_height)
)
## sum 1/choose(k, 2), k=2 to n
mean(hs)
2-2/ntx
var(hs)
## sum 1/choose(k, 2)^2, k=2 to n
4/3 * ( 3/ ntx^2 + 6/ntx - 6*trigamma(ntx)  + pi^2 - 9)