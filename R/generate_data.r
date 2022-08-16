library(ape)
library(phyclust)
set.seed(666)
ntaxa  <- 5
seq.len <- 5000
mu <- 0.2
opts <- paste0("-mHKY -l", seq.len, " -s", mu)
the.tree <- ape::rcoal(n = ntaxa)
ape::write.nexus(
    the.tree,
    file = paste0("generating_tree_n=", ntaxa, ".tree")
)
aln <- phyclust::seqgen(opts =  opts,
              rooted.tree = the.tree)
the.aln <- phyclust::read.seqgen(aln)
phyclust::write.fasta(seqdata = the.aln$org,
                      lower.case = FALSE,
                      code.type = the.aln$code.type,
            filename = paste0("simulated_data/simulated_data_n=", ntaxa,
                              "_L=", seq.len,
                              "_rate=", mu,
                              ".fasta"),
            seqname = the.aln$seqname)