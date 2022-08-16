# Simple coalescent simulations
Minimalist suite of scripts to generate the simplest coalescent **toy** data.

- [`generate_data.r`](https://github.com/maxbiostat/toy_coalescent/blob/main/R/generate_data.r) generates a coalescent tree and then some alignment data down that tree;
- [`evaluate_target.r`](https://github.com/maxbiostat/toy_coalescent/blob/main/R/evaluate_target.r) computes the (log) posterior density under a constant size coalescent prior and a JC69 likelihood;
- [`check_rcoal.r`](https://github.com/maxbiostat/toy_coalescent/blob/main/R/check_rcoal.r) just checks that **ape**'s  [rcoal()](https://rdrr.io/cran/ape/man/rtree.html) does the right thing (it does!);
- [`check_calculations.r`](https://github.com/maxbiostat/toy_coalescent/blob/main/R/check_calculations.r) compares the stuff in [`evaluate_target.r`](https://github.com/maxbiostat/toy_coalescent/blob/main/R/evaluate_target.r) against [BEAST](https://beast.community/) (the XML is [here](https://github.com/maxbiostat/toy_coalescent/blob/main/simulated_data/simulated_data_n%3D5_L%3D5000_rate%3D0.2.xml)).

