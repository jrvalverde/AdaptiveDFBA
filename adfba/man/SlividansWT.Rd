% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{SlividansWT}
\alias{SlividansWT}
\title{Dynamic Modelling of wild type Streptomyces lividans TK21, TK24 and 66 (1326)}
\format{An object of class \code{modelorg}}
\source{
<manuscript submitted for publication>
}
\usage{
{
    data(SlividansWT)
    ls()
    verbose <- 2
    af_sol <- adaptiveDFBA(model, substrateRxns=substrateRxns, 
                        initConcentrations=initConcentrations,
                        initBiomass = initBiomass,
                        timeStep = timeStep,
                        nSteps = nSteps,
                        exclUptakeRxns=exclUptakeRxns,
                        retOptSol=TRUE,
                        fld=TRUE,
                        biomassRxn=biomassRxn,
                        dynamicConstraints=dynamicConstraints,
                        verboseMode=verbose);
    plot(af_sol, plotRxns=plotRxns);
 }
}
\description{
The dataset is a network representation of the \emph{S. lividans} 
 metabolism as defined in the published metabolic model iJV1220.
 as published in
 
 Valverde, J. R., Gullón, S., & Mellado, R. P. (2018). Modelling the 
 metabolism of protein secretion through the Tat route in Streptomyces 
 lividans. BMC microbiology, 18(1), 59.
 
 It consists of over 1800 internal reactions, over 1200
 metabolites and the biomass objective function is called Biomass_SLI.
 
 The metabolic network has been configured to model a wild-type strain
 and complemented with the equired data to run an Adaptive DFBA simulation:
 
 model		The preconfigured model
 initConcentrations	The initial concentrations of substrates,
 			corresponding to NMMP with casamino acids and 5g/l
 			of glucose.
 initBiomass		The inoculum used (0.1)
 timeStep		1h
 nSteps		60
 exclUptakeRxns	Uptake reactions whose metabolite is assumed
 			to be in excess in the medium
 biomassRxn		'Biomass_SLI'
 dynamicConstraints	A data frame with a list of constraints to be
 			applied at each step: it contains reaction 
 			limits for Biomass and L-alanine use.
}
\references{
Valverde, José R., Gullón, S., García-Herrero, C.A.,
	Campoy, I, & Mellado, R.P. (2018) Dynamic modelling of 
	overproduced secretory proteins in Streptomyces lividans 
	using Adaptive DFBA. Submitted for publication.
 
	D'Huys, P. J., Lule, I., Van Hove, S., Vercammen, D., 
	Wouters, C., Bernaerts, K., Anné, J.& Van Impe, J. F. M. 
	(2011). Amino acid uptake profiling of wild type and 
	recombinant Streptomyces lividans TK24 batch fermentations. 
	Journal of biotechnology, 152(4), 132-143.
}
\keyword{datasets}
