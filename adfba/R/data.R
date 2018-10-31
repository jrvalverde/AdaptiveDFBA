

#' Escherichia coli Core Energy Metabolism Network
#'
#'   The dataset is a network representation of the \emph{E. coli} core
#'  metabolism. It consists of 62 internal reactions, 14 exchange
#'  reactions and a biomass objective function.
#'
#' @format	An object of class \code{modelorg}
#'
#' @source	<http://gcrg.ucsd.edu/Downloads/EcoliCore>
#'
#' @usage	{
#'     data(Ec_core)
#'     lowbnd(Ec_core)[react_id(Ec_core)=='EX_glc(e)']=-10;
#'     lowbnd(Ec_core)[react_id(Ec_core)=='EX_o2(e)']=-18;
#'     ## run adaptiveDFBA(), Ec_df will be an object of class optsol_dynamicFBA
#'     Ec_df <- adaptiveDFBA(Ec_core,
#'                           substrateRxns={'EX_glc(e)'},
#'                           initConcentrations=10,
#'                           initBiomass=.035,
#'                           timeStep=.25,
#'                           nSteps=17,
#'                           verboseMode=3)
#'     
#'     ## plot biomass and reactions
#'     plot(Ec_df,plotRxns=c('EX_glc(e)','EX_ac(e)'));
#' }
#'
"Ec_core"
#> [1] "EC_core"


#' Escherichia coli Metabolic Network
#'
#'   The dataset is a network representation of the \emph{E. coli} 
#'  metabolism as defined in the published metabolic model iJO1366.
#'  as published in
#'  
#'  Orth, J. D., Conrad, T. M., Na, J., Lerman, J. A., Nam, H., 
#'  Feist, A. M., & Palsson, B. O. (2011). A comprehensive 
#'  genome-scale reconstruction of Escherichia coli metabolism-2011. 
#'  Molecular systems biology, 7(1), 535.
#'  
#'  This model contains 1805 mtabolites, 2583 reactions and 1367 genes
#'
#'
#' @format	An object of class \code{modelorg}
#'
#' @source	<http://bigg.ucsd.edu/models/iJO1366>
#'
#' @usage	{
#'     data(Ecoli)
#'     lowbnd(Ecoli[react_id(Ec_core)=='EX_glc(e)']=-10;
#'     lowbnd(Ecoli)[react_id(Ec_core)=='EX_o2(e)']=-18;
#'     ## run adaptiveDFBA(), Ec_df will be an object of class optsol_dynamicFBA
#'     Ec_df <- adaptiveDFBA(Ecoli,
#'                           substrateRxns={'EX_glc(e)'},
#'                           initConcentrations=10,
#'                           initBiomass=.035,
#'                           timeStep=.25,
#'                           nSteps=17,
#'                           verboseMode=3)
#'     
#'     ## plot biomass and reactions
#'     plot(Ec_df,plotRxns=c('EX_glc(e)','EX_ac(e)'));
#' }
#'
#' @references	Orth, J. D., Conrad, T. M., Na, J., Lerman, J. A., Nam, H., 
#'	Feist, A. M., & Palsson, B. O. (2011). \emph{A comprehensive 
#'	genome-scale reconstruction of Escherichia coli metabolism-2011}. 
#'	Molecular systems biology, 7(1), 535.
#'
#'
"Ecoli"
#> [1] "Ecoli"


#' Streptomyces lividans TK21, TK24 and 66 (1326) Metabolic Network
#'
#'   The dataset is a network representation of the \emph{S. lividans} 
#'  metabolism as defined in the published metabolic model iJV1220.
#'  as published in
#'  
#'  Valverde, J. R., Gullón, S., & Mellado, R. P. (2018). Modelling the 
#'  metabolism of protein secretion through the Tat route in Streptomyces 
#'  lividans. BMC microbiology, 18(1), 59.
#'  
#'  It consists of over 1800 internal reactions, over 1200
#'  metabolites and the biomass objective function is called Biomass_SLI.
#'  You will need to customize it to your needs enabling/disabling the
#'  functions needed for the strain you want to model (compare with
#'  SlividansWT, Slividans_pIJ486, SlividansDAG, SlividansAML or SlividansTNF
#'  to see several examples).
#'
#'
#' @format	An object of class {modelorg}
#'
#' @source	<https://bmcmicrobiol.biomedcentral.com/articles/10.1186/s12866-018-1199-3>
#'
#' @usage	{
#'     data(Slividans)
#'     ls()
#'     verbose <- 2
#'     af_sol <- adaptiveDFBA(model, substrateRxns=substrateRxns, 
#'                         initConcentrations=initConcentrations,
#'                         initBiomass = initBiomass,
#'                         timeStep = timeStep,
#'                         nSteps = nSteps,
#'                         exclUptakeRxns=exclUptakeRxns,
#'                         retOptSol=TRUE,
#'                         fld=TRUE,
#'                         biomassRxn=biomassRxn,
#'                         dynamicConstraints=dynamicConstraints,
#'                         verboseMode=verbose);
#'     plot(af_sol, plotRxns=plotRxns);
#' }
#'
#' @references	 Valverde, José R., Sonia Gullón, and Rafael P. Mellado. (2018)
#'  \emph{Modelling the metabolism of protein secretion through the Tat route 
#'  in Streptomyces lividans}. BMC microbiology 18.1: 59
#'
#'
"Slividans"
#> [1] "Slividans"

#' Dynamic Modelling of wild type Streptomyces lividans TK21, TK24 and 66 (1326)
#'
#'   The dataset is a network representation of the \emph{S. lividans} 
#'  metabolism as defined in the published metabolic model iJV1220.
#'  as published in
#'  
#'  Valverde, J. R., Gullón, S., & Mellado, R. P. (2018). Modelling the 
#'  metabolism of protein secretion through the Tat route in Streptomyces 
#'  lividans. BMC microbiology, 18(1), 59.
#'  
#'  It consists of over 1800 internal reactions, over 1200
#'  metabolites and the biomass objective function is called Biomass_SLI.
#'  
#'  The metabolic network has been configured to model a wild-type strain
#'  and complemented with the equired data to run an Adaptive DFBA simulation:
#'  
#'  model		The preconfigured model
#'  initConcentrations	The initial concentrations of substrates,
#'  			corresponding to NMMP with casamino acids and 5g/l
#'  			of glucose.
#'  initBiomass		The inoculum used (0.1)
#'  timeStep		1h
#'  nSteps		60
#'  exclUptakeRxns	Uptake reactions whose metabolite is assumed
#'  			to be in excess in the medium
#'  biomassRxn		'Biomass_SLI'
#'  dynamicConstraints	A data frame with a list of constraints to be
#'  			applied at each step: it contains reaction 
#'  			limits for Biomass and L-alanine use.
#'  
#'
#' @format	An object of class \code{modelorg}
#'
#' @source	<manuscript submitted for publication>
#'
#' @usage	{
#'     data(SlividansWT)
#'     ls()
#'     verbose <- 2
#'     af_sol <- adaptiveDFBA(model, substrateRxns=substrateRxns, 
#'                         initConcentrations=initConcentrations,
#'                         initBiomass = initBiomass,
#'                         timeStep = timeStep,
#'                         nSteps = nSteps,
#'                         exclUptakeRxns=exclUptakeRxns,
#'                         retOptSol=TRUE,
#'                         fld=TRUE,
#'                         biomassRxn=biomassRxn,
#'                         dynamicConstraints=dynamicConstraints,
#'                         verboseMode=verbose);
#'     plot(af_sol, plotRxns=plotRxns);
#'  }
#'
#' @references	 Valverde, José R., Gullón, S., García-Herrero, C.A.,
#'		Campoy, I, & Mellado, R.P. (2018) Adaptive DFBA: versatile 
#'		modelling of complex dynamic metabolic processes. Submitted
#'		for publication.
#'  
#'		D'Huys, P. J., Lule, I., Van Hove, S., Vercammen, D., 
#'		Wouters, C., Bernaerts, K., Anné, J.& Van Impe, J. F. M. 
#'		(2011). Amino acid uptake profiling of wild type and 
#'		recombinant Streptomyces lividans TK24 batch fermentations. 
#'		Journal of biotechnology, 152(4), 132-143.
#'
#'
"SlividansWT"
#> [1] "SlividansWT"


#' Dynamic Modelling of Streptomyces lividans harbouring the multi-copy plasmid pIJ486
#'
#'   The dataset is a network representation of the \emph{S. lividans} 
#'  metabolism as defined in the published metabolic model iJV1220.
#'  as published in
#'  
#'   Valverde, J. R., Gullón, S., & Mellado, R. P. (2018). Modelling the 
#'  metabolism of protein secretion through the Tat route in Streptomyces 
#'  lividans. BMC microbiology, 18(1), 59.
#'  
#'   It consists of over 1800 internal reactions, over 1200
#'  metabolites and the biomass objective function is called Biomass_SLI.
#'  
#'   The metabolic network has been configured to model S. lividans harbouring
#'  the multi-copy plasmid pIJ486, and complemented with the required data to 
#'  run an Adaptive DFBA simulation:
#'  
#'  	model			The preconfigured model
#'  	initConcentrations	The initial concentrations of substrates,
#'  			corresponding to NMMP with casamino acids and 5g/l
#'  			of glucose.
#'  	initBiomass		The inoculum used (0.1)
#'  	timeStep		1h
#'  	nSteps			60
#'  	exclUptakeRxns		Uptake reactions whose metabolite is assumed
#'  				to be in excess in the medium
#'  	biomassRxn		'Biomass_SLI'
#'  	dynamicConstraints	A data frame with a list of constraints to be
#'  				applied at each step: it contains reaction 
#'  				limits for Biomass and L-alanine use.
#'  
#'
#'
#' @format	An object of class \code{modelorg}
#'
#' @source	<manuscript submitted for publication>
#'
#' @usage {
#'     data(Slividans_pIJ486)
#'     ls()
#'     verbose <- 2
#'     af_sol <- adaptiveDFBA(model, substrateRxns=substrateRxns, 
#'                         initConcentrations=initConcentrations,
#'                         initBiomass = initBiomass,
#'                         timeStep = timeStep,
#'                         nSteps = nSteps,
#'                         exclUptakeRxns=exclUptakeRxns,
#'                         retOptSol=TRUE,
#'                         fld=TRUE,
#'                         biomassRxn=biomassRxn,
#'                         dynamicConstraints=dynamicConstraints,
#'                         verboseMode=verbose);
#'     plot(af_sol, plotRxns=plotRxns);
#'  }
#'
#' @references	 Valverde, José R., Gullón, S., García-Herrero, C.A.,
#'		Campoy, I, & Mellado, R.P. (2018) Adaptive DFBA: versatile 
#'		modelling of complex dynamic metabolic processes. Submitted
#'		for publication.
#'  
#'		D'Huys, P. J., Lule, I., Van Hove, S., Vercammen, D., 
#'		Wouters, C., Bernaerts, K., Anné, J.& Van Impe, J. F. M. 
#'		(2011). Amino acid uptake profiling of wild type and 
#'		recombinant Streptomyces lividans TK24 batch fermentations. 
#'		Journal of biotechnology, 152(4), 132-143.
#'
#'
"Slividans_pIJ486"
#> [1] "Slividans_pIJ486"



#' Dynamic Modelling of Streptomyces lividans TK21 secreting agarase (DagA)
#'
#'   The dataset is a network representation of the \emph{S. lividans} 
#'  metabolism as defined in the published metabolic model iJV1220.
#'  as published in
#'  
#'   Valverde, J. R., Gullón, S., & Mellado, R. P. (2018). Modelling the 
#'  metabolism of protein secretion through the Tat route in Streptomyces 
#'  lividans. BMC microbiology, 18(1), 59.
#'  
#'   It consists of over 1800 internal reactions, over 1200
#'  metabolites and the biomass objective function is called Biomass_SLI.
#'  
#'   The metabolic network has been configured to model S. lividans TK21 secreting agarase
#'  cloned under the multi-copy plasmid pIJ486, and complemented with the 
#'  required data to run an Adaptive DFBA simulation:
#'  
#'  	model			The preconfigured model
#'  	initConcentrations	The initial concentrations of substrates,
#'  			corresponding to NMMP with casamino acids and 5g/l
#'  			of glucose.
#'  	initBiomass		The inoculum used (0.1)
#'  	timeStep		1h
#'  	nSteps			60
#'  	exclUptakeRxns		Uptake reactions whose metabolite is assumed
#'  				to be in excess in the medium
#'  	biomassRxn		'Biomass_SLI'
#'  	dynamicConstraints	A data frame with a list of constraints to be
#'  				applied at each step: it contains reaction 
#'  				limits for Biomass and L-alanine use.
#'  
#'
#'
#' @format	An object of class \code{modelorg}
#'
#' @source	<manuscript submitted for publication>
#'
#' @usage	{
#'     data(SlividansDAG)
#'     ls()
#'     verbose <- 2
#'     af_sol <- adaptiveDFBA(model, substrateRxns=substrateRxns, 
#'                         initConcentrations=initConcentrations,
#'                         initBiomass = initBiomass,
#'                         timeStep = timeStep,
#'                         nSteps = nSteps,
#'                         exclUptakeRxns=exclUptakeRxns,
#'                         retOptSol=TRUE,
#'                         fld=TRUE,
#'                         biomassRxn=biomassRxn,
#'                         dynamicConstraints=dynamicConstraints,
#'                         verboseMode=verbose);
#'     plot(af_sol, plotRxns=plotRxns);
#'  }
#'
#' @references	 Valverde, José R., Gullón, S., García-Herrero, C.A.,
#'		Campoy, I, & Mellado, R.P. (2018) Adaptive DFBA: versatile 
#'		modelling of complex dynamic metabolic processes. Submitted
#'		for publication.
#'  
#'		Gabarró, M. V., Gullón, S., Vicente, R. L., Caminal, G., 
#'		Mellado, R. P., & López-Santín, J. (2017). A Streptomyces 
#'		lividans SipY defficient strain as a host for protein 
#'		production: standardization of operational alternatives 
#'		for model proteins. Journal of chemical technology and 
#'		biotechnology.
#'  
#'		Gullón, S., Marín, S., & Mellado, R. P. (2015). 
#'		Overproduction of a model sec- and tat-dependent secretory 
#'		protein elicits different cellular responses in Streptomyces 
#'		lividans. PLOSone, 10 (7), e0133645.
#'
#'
"SlividansDAG"
#> [1] "SlividansDAG"


#' Dynamic Modelling of Streptomyces lividans TK21 secreting α-amylase (Aml)
#'
#'   The dataset is a network representation of the \emph{S. lividans} 
#'  metabolism as defined in the published metabolic model iJV1220.
#'  as published in
#'  
#'   Valverde, J. R., Gullón, S., & Mellado, R. P. (2018). Modelling the 
#'  metabolism of protein secretion through the Tat route in Streptomyces 
#'  lividans. BMC microbiology, 18(1), 59.
#'  
#'   It consists of over 1800 internal reactions, over 1200
#'  metabolites and the biomass objective function is called Biomass_SLI.
#'  
#'   The metabolic network has been configured to model S. lividans TK21 secreting α-amylase
#'  cloned under the multi-copy plasmid pIJ486, and complemented with the 
#'  required data to run an Adaptive DFBA simulation:
#'  
#'  	model			The preconfigured model
#'  	initConcentrations	The initial concentrations of substrates,
#'  			corresponding to NMMP with casamino acids and 5g/l
#'  			of glucose.
#'  	initBiomass		The inoculum used (0.1)
#'  	timeStep		1h
#'  	nSteps			60
#'  	exclUptakeRxns		Uptake reactions whose metabolite is assumed
#'  				to be in excess in the medium
#'  	biomassRxn		'Biomass_SLI'
#'  	dynamicConstraints	A data frame with a list of constraints to be
#'  				applied at each step: it contains reaction 
#'  				limits for Biomass and L-alanine use.
#'  
#'
#'
#' @format	An object of class \code{modelorg}
#'
#' @source	<manuscript submitted for publication>
#'
#' @usage	{
#'     data(SlividansAML)
#'     ls()
#'     verbose <- 2
#'     af_sol <- adaptiveDFBA(model, substrateRxns=substrateRxns, 
#'                         initConcentrations=initConcentrations,
#'                         initBiomass = initBiomass,
#'                         timeStep = timeStep,
#'                         nSteps = nSteps,
#'                         exclUptakeRxns=exclUptakeRxns,
#'                         retOptSol=TRUE,
#'                         fld=TRUE,
#'                         biomassRxn=biomassRxn,
#'                         dynamicConstraints=dynamicConstraints,
#'                         verboseMode=verbose);
#'     plot(af_sol, plotRxns=plotRxns);
#'  }
#'
#' @references	 Valverde, José R., Gullón, S., García-Herrero, C.A.,
#'		Campoy, I, & Mellado, R.P. (2018) Adaptive DFBA: versatile 
#'		modelling of complex dynamic metabolic processes. Submitted
#'		for publication.
#'  
#'		Gabarró, M. V., Gullón, S., Vicente, R. L., Caminal, G., 
#'		Mellado, R. P., & López-Santín, J. (2017). A Streptomyces 
#'		lividans SipY defficient strain as a host for protein 
#'		production: standardization of operational alternatives 
#'		for model proteins. Journal of chemical technology and 
#'		biotechnology.
#'  
#'		Gullón, S., Marín, S., & Mellado, R. P. (2015). 
#'		Overproduction of a model sec- and tat-dependent secretory 
#'		protein elicits different cellular responses in Streptomyces 
#'		lividans. PLOSone, 10 (7), e0133645.
#'
#'
"SlividansAML"
#> [1] "SlividansAML"

#' Dynamic Modelling of Streptomyces lividans secreting mTNF-α
#'
#'   The dataset is a network representation of the \emph{S. lividans} 
#'  metabolism as defined in the published metabolic model iJV1220.
#'  as published in
#'  
#'   Valverde, J. R., Gullón, S., & Mellado, R. P. (2018). Modelling the 
#'  metabolism of protein secretion through the Tat route in Streptomyces 
#'  lividans. BMC microbiology, 18(1), 59.
#'  
#'   It consists of over 1800 internal reactions, over 1200
#'  metabolites and the biomass objective function is called Biomass_SLI.
#'  
#'   The metabolic network has been configured to model S. lividans secreting mTNF-α
#'  cloned under the multi-copy plasmid pIJ486, and complemented with the 
#'  required data to run an Adaptive DFBA simulation:
#'  
#'  	model			The preconfigured model
#'  	initConcentrations	The initial concentrations of substrates,
#'  			corresponding to NMMP with casamino acids and 5g/l
#'  			of glucose.
#'  	initBiomass		The inoculum used (0.1)
#'  	timeStep		1h
#'  	nSteps			60
#'  	exclUptakeRxns		Uptake reactions whose metabolite is assumed
#'  				to be in excess in the medium
#'  	biomassRxn		'Biomass_SLI'
#'  	dynamicConstraints	A data frame with a list of constraints to be
#'  				applied at each step: it contains reaction 
#'  				limits for Biomass and L-alanine use.
#'  
#'
#'
#' @format	An object of class \code{modelorg}
#'
#' @source	<manuscript submitted for publication>
#'
#' @usage	{
#'     data(SlividansTNF)
#'     ls()
#'     verbose <- 2
#'     af_sol <- adaptiveDFBA(model, substrateRxns=substrateRxns, 
#'                         initConcentrations=initConcentrations,
#'                         initBiomass = initBiomass,
#'                         timeStep = timeStep,
#'                         nSteps = nSteps,
#'                         exclUptakeRxns=exclUptakeRxns,
#'                         retOptSol=TRUE,
#'                         fld=TRUE,
#'                         biomassRxn=biomassRxn,
#'                         dynamicConstraints=dynamicConstraints,
#'                         verboseMode=verbose);
#'     plot(af_sol, plotRxns=plotRxns);
#'  }
#'
#' @references	 Valverde, José R., Gullón, S., García-Herrero, C.A.,
#'		Campoy, I, & Mellado, R.P. (2018) Adaptive DFBA: versatile 
#'		modelling of complex dynamic metabolic processes. Submitted
#'		for publication.
#'
#'		D'Huys, P. J., Lule, I., Van Hove, S., Vercammen, D., 
#'		Wouters, C., Bernaerts, K., Anné, J.& Van Impe, J. F. M. 
#'		(2011). Amino acid uptake profiling of wild type and 
#'		recombinant Streptomyces lividans TK24 batch fermentations. 
#'		Journal of biotechnology, 152(4), 132-143.
#'
#'
"SlividansTNF"
#> [1] "SlividansTNF"

