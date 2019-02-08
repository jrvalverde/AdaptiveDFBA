# AdaptiveDFBA



[![DOI](https://zenodo.org/badge/151059786.svg)](https://zenodo.org/badge/latestdoi/151059786)


An implementation of the AdaptiveDFBA algorithm using R and the sybil package

A more complete description will be added after the paper has been published.

For now, suffice it to say that, here, you will find an expanded DFBA method,
that allows for greater versatility in controlling/steering dynamic FBA 
metabolic simulations.

You will also find here the banneR package (to print UNIX(TM)-like banners in
R scripts, example data and an example driver script that can be used as
a command line program to simplify adpative dynamic FBA calculations in most
cases.

Please, read the Supplementary Materials to the paper to learn more about 
installing this software.

Basically: you need to install R, sybil, sybilDynFBA, one ODE solver (to
choose from GLPK, CPLEX, CLP or LP-SOLVE) and its R binding (the corresponding
glpkAPI, cplexAPI, clpAPI or lpSolveAPI).

Then, download ADFBA, unzip it, and install it using R 'devtools' package
(which you will need to install it until we publish it and get it on CRAN).

A sample session might be (assuming that you have R installed and an ODE 
solver installed (which should be trivial on Linux using a package manager)

In Ubuntu, for instance, you could install the ODE solvers with

>
> sudo apt install lp-solve liblpsolve-dev coinor-clp coinor-libclp-dev glpk-utils libglpk-dev 
>


$ wget https://github.com/jrvalverde/AdaptiveDFBA/archive/master.zip

$ unzip master

$ cd AdaptiveDFBA-master

$ R

> install.packages(c('devtools', 'sybil', 'sybilDynFBA', ‘glpkAPI’, ‘clpAPI’, ‘lpSolveAPI’), dep=T)
>
> library(devtools)
>
> install('adfba', dep=T)
> 
> library(adfba)
>
> help(adaptiveDFBA)
>

More detailed information will be provided after the paper is published.

