prior_dens <- function(tree, Theta = 1){
  ans <- coalescentMCMC::dcoal(bt = ape::branching.times(tree),
                               theta = Theta, log = TRUE)
  return(ans)
}
evaluate_target <- function(tree, alignment, rate = 0.2, Theta = 1){
  require(coalescentMCMC)
  require(phangorn)
  prior <- prior_dens(tree = tree, Theta = Theta)
  likelihood <- phangorn::pml(tree = tree,
                              data = alignment,
                              rate = rate)
  return(
    prior + likelihood$logLik
  )
}