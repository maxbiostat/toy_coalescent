library(ape)
library(phyclust)
source("evaluate_target.r")
####
# Read in alignment matrix
fasta.name <- "../simulated_data/posterior/simulated_data_n=5_L=5000_rate=0.2.fasta"
aln.data <- ape::read.FASTA(fasta.name)
# Convert to phangorn's format
aln <- phangorn::as.phyDat(aln.data)
# Read in the tree used to generate the data, for reference
true.tree <- ape::read.nexus("../simulated_data/posterior/generating_tree_n=5.tree")

# Read in 10,000 trees sampled by BEAST
BEAST.trees <- read.nexus("../simulated_data/posterior/seed1simulated_data_n=5_L=5000_rate=0.2.trees")

priors <- unlist(
  parallel::mclapply(
    BEAST.trees,
    prior_dens,
    mc.cores = 6
  )
)
posteriors <- unlist(
  parallel::mclapply(
    BEAST.trees,
    function(t) evaluate_target(tree = t, alignment = aln),
    mc.cores = 6
  )
)

the.log <- read.table("../simulated_data/posterior/seed1simulated_data_n=5_L=5000_rate=0.2.log",
                      header = TRUE)

result <- tibble::tibble(
  BEAST_prior = the.log$coalescent,
  R_prior = priors,
  BEAST_posterior = the.log$joint,
  R_posterior = posteriors
)
result

plot(R_prior~BEAST_prior, result)
plot(R_posterior~BEAST_posterior, result)

lm(R_prior~BEAST_prior, result)
lm(R_posterior~BEAST_posterior, result)
