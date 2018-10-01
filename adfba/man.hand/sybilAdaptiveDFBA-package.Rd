\name{sybilAdaptiveDFBA-package}
\alias{sybilAdaptiveDFBA-package}
\alias{sybilAdaptiveDFBA}
\docType{package}
\title{
    Adaptive Dynamic Flux Balance Analysis
}
\description{
The package \code{sybilAdaptiveDFBA} implements dynamic flux balance analysis as proposed by Valverde et al (2018). 

This package provides an extended DFBA method: as such it can be used to compute the standard DFBA as proposed by Varma el al. (1994), but in addition it permits fine control of the simulation parameters on the fly.

It uses functions from package \code{sybil} to find the standard FBA solution. The solution can also be plotted.
}
\details{
\tabular{ll}{
Package: \tab sybilAdaptiveDFBA\cr
Type: \tab Package\cr
Version: \tab 1.0.0\cr
Date: \tab 2018-08-31\cr
License: \tab GPL Version 3\cr
LazyLoad: \tab yes\cr
Depends: \tab \code{\link{sybil}}\cr
}
}
\author{
Jose R. Valverde

Maintainer: Jose R. Valverde <jrvalverde@cnb.csic.es>
}
\references{
	Valverde, J. R. et al. 2018. Pending publication

	Varma, A. and Palsson, B.O. 1994. Stoichiometric flux balance models quantitatively predict
	growth and metabolic by-product secretion in wild-type Escherichia coli W3110. Appl
	Environ Microbiol 60: 3724-3731.
}
\keyword{ package }
\seealso{
 \code{\link{sybil}} 
}
\examples{
\dontrun{
	## The examples here require the package glpkAPI to be
	## installed. If that package is not available, you have to set
	## the argument 'solver' (the default is: solver = "glpk") to the
        ## solver that you have installed on your system (you should have
        ## one).

	## load the example data set
	data(Ec_core)
        lowbnd(Ec_core)[react_id(Ec_core)=='EX_glc(e)']=-0.9;
        lowbnd(Ec_core)[react_id(Ec_core)=='EX_o2(e)']=-18;

	## run adaptiveDFBA() in dynamicFBA compatible mode
        ## Ec_df will be an object of class \code{\link{optsol_dynamicFBA}}
	## which is the same class as \code{\link{optsol_dynamicFBA}} in
        ## syilDynFBA.
	Ec_df <- adaptiveDFBA(Ec_core,substrateRxns={'EX_glc(e)'},initConcentrations=40,
	initBiomass=.035,timeStep=.25,nSteps=20,verbose=3)

	## plot biomass and reactions
	plot(Ec_df,plotRxns=c('EX_glc(e)','EX_ac(e)'));
        
}
}
