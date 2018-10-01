\name{adaptiveDFBA}

\alias{adaptiveDFBA}

\encoding{utf8}

\title{adaptive dynamic flux balance analysis} 

\description{ 
        Calculate concentrations of metabolites of exchange reactions at defined
        time points  given the initial concentrations and optional dynamically
        changing  constraints and conditions.

To accomplish this task this function calls \code{\link{optimizeProb}} function to 
        get the fluxes then updates the concentrations and the reaction
        boundaries ..etc. as in Varma et al. (1994). It also applies a number of
        corrections that increase reliability, resilience and control over the
        simulation, as well as the possiility to produce additional informative
        output.

It is used like sybilDynFBA with the possibility of adding various extra optional
        parameters: one to specify the actual biomass reaction, one to control
        reaction  limits during the simulation, one to control concentration of
        metabolites and one to control output of additional information.

This function does away with a number of significant restrictions present in the
        original implementation, the OpenCOBRA implementation in MatLab, and the
        sybilDynFBA implementation in R (which is itself a direct translation of
        the OpenCOBRA reference implementation).

The code has been rearranged to avoid duplications and simplify the algorithm. FBA
        calculation is now done using a model that has been updated at each step
        to meet optional adaptive constraints. The model is reverted back to the
        original at the end of the calculation.

You no longer need to provide substrates and initial concentrations in the same
	order as they are listed in the model.

Biomass is now computed using the Biomass reaction that you specify, not the
	objective function (as it was before). This allows you to specify an
        objective function other than growth (e.g. secretion) and still 
        calculate biomass, growth and concentrations properly.

Input concentrations that have been explicitly set to zero are now respected and
        not set to infinity, plus it is ensured that only exchange reactions are
        affected.

Uptake rate actualization at each step now ensures that invalid values are
        always avoided

You can modify any reaction limit at any time, thus making it possible to 
        steer the  simulation at your will: you may change one or both limits on
        one or more reactions. This is useful to control systems where
        constraints need to be coerced (such as introducing a lag-phase at the
        start of growth) or where multiple goals must evolve independently (e.g.
        secretion is active at specific growth phases only), or when you have
        multiple objectives but want to evolve them independently of each other
        (e.g. you want to maximize growth and secretion, but the cell does not
        secrete always at the same rate with respect to growth). 

There is provision for modifying concentrations as well by either
        supplying a table with incremental changes to be applied at each time
        step, or a function that will get the current concentrations and return
        the new ones. This is useful to model situations where some nutrients
        are added at specific times (using the table) or feed-back fed-batch
        models where a sensor detects nutrient changes to trigger a modification
        of nutrient concentrations (using the sensor-feeder function).

If no initial concentration is given for a substrate that has an open
    uptake in the model (i.e. model.lb. < 0) the concentration is assumed to be
    high enough to not be limiting. If the uptake rate for a nutrient is
    calculated to exceed the maximum uptake rate for that nutrient specified in
    the model and the max \emph{uptake} rate specified is > 0, the maximum
    uptake  rate specified in the model is used instead of the calculated uptake
    rate.

\emph{dynamicConstraints} is a table providing the values of the reaction
    rate for each dynamically adapated reaction at each of the nSteps time
    points. During the simulation, the reaction rate will be coerced at each
    time point to the value provided in this table. Thus, in order to use this
    table, one must provide a value for each time point. This will typically not
    be available for all but a few experientally measured time points, hence, 
    values at intermediate time points must be somehow interpolated prior to
    calling this function using existing \code{R} facilities. Users are advised
    to carry out experiments at key points, visualize the results, and decide on
    an interpolation method that is BIOLOGICALLY MEANINGFUL to compute the table
    values.

\emph{BE CAREFUL WITH THE MODEL YOU CHOOSE FOR GENERATING YOUR VALUES!}
    
As an example, you could interpolate intermediate growth points using
    a sigmoid, but model other reactions (such as secretion) using a method
    that makes less assumptions (such as linear interpolation) and is
    scientifically safer.

You may modify only one rate or both. The table must consist of columns
    with one cell per time point. Each column pertains to one reaction. If the
    column is named after a reaction followed by \code(.low.) or \code(.upp.)
    (e.g. "\code{Ex_gly(e)[low]}" or "\code{Ex_gly(e).upp.}") then the values in
    that column will be used to modify only the corresponding (lower or upper)
    bound of that reaction. Note that you may have both, one column ending in
    .low. and another in .upp. for the same reaction to modify both limits. As a
    short-hand (but be careful and ensure it makes sense), you can set both
    limits to the same value by using a column named after the reaction without
    extension (e.g. a column called "\code{Ex_gly(e)}" would set both bounds of
    reaction  "\code{EX_gly(e)}" to the same value as specified in that column.
    If a column or bound appears more than once, the last instance
    (right-most) will be applied last and prevail.

There is also an (as yet untested) possibility of having a finer control:
    you can provide a function instead of a table. If you do this function must
    take as arguments the current model, concentrations, fluxes and step number
    and return a new model to substitute the original one. Inside the function
    you will have all the information needed to take decisions, such as, e.g. if
    we detect that time < 10h, induce a lag phase of growth; if we detect that
    some metabolite is low, repress coupled uptake reactions or activate
    alternative uptake mechanisms... We also get the last fluxes, so that inside
    the function we may also detect (if desired) activation or repression of a
    key reaction/route and trigger the corresponding changes. This is 
    intentionally left undocumented until we have mode experience in using
    it.

\emph{mediumConcs}: We consider two possibilities for modifying concentrations
    (experimentwise): one is that you add nutrients at predefined time points,
    which is implemented as a table, and the other is that you have a sensor to
    detect when nutrients are below a given value and then add the nutrients,
    which is implemented as a function:

mediumConcs may be a table providing the delta changes in nutrient
    concentration at each time point. The changes at every time point should be
    provided sorted in time order. Only final time points may be missing, not
    intermediate time points. Deltas may positive (add nutrient), negative
    (remove nutrient) or zero (leave unchanged).

mediumConcs may be a function, designed to address the second case by
    simulating a fed-batch environent:  this function must take as only input
    argument \emph{all} the current  concentrations (i.e. the function will act
    as a "sensor" that is able to read concentrations at each time step) and
    must return \emph{all} the new concentrations (i.e. it also acts as a
    "feeder" able to modify concentrations at each time step; and note that it
    may "suck" nutrients if you want, much as you can with the table of delta
    changes at fixed times). This is not documented in detail intentionally 
    until we have more expertise using it.

}

\usage{
    adaptiveDFBA(model, substrateRxns, initConcentrations, initBiomass, timeStep, nSteps, 
	    exclUptakeRxns,
	    retOptSol = TRUE,
            fld = FALSE, verboseMode = 2, 
            verboseMode = 2,
            biomassRxn = "",
            dynamicConstraints,
            mediumConcs, ...)
}

\arguments{
  \item{model}{
      An object of class \code{\link{modelorg}} containing the
      metabolic model.
  }
  \item{substrateRxns}{
      List of exchange reaction names for substrates initially in the media 
      that may change  (e.g. not h2o or co2)
  }
  \item{initConcentrations}{
      The given start concentrations of substrates
  }
  \item{initBiomass}{
      The start value of biomass (must be nonzero)
  }
  \item{timeStep}{
      Define the time intervals to evaluate the problem at.
  }
  \item{nSteps}{
      The maximum number of steps (time intervals) to evaluate, 
      the procedure may stop before completing this number when 
      the FBA fails to find a viable solution (indicating that the
      available substrates are not enough to support a solution / viability).
  }
  \item{exclUptakeRxns}{
      List of uptake reactions whose substrate concentrations do not change 
      (Default ={'EX_co2(e)','EX_o2(e)','EX_h2o(e)','EX_h(e)'})
  }
  \item{retOptSol}{ 
      Boolean.  indicates if an object of class optsol will be returned or 
      if a simple list should be returned instad.\cr
      Default: \code{TRUE}
  }
  \item{fld}{ 
      Boolean.  Save the resulting flux distribution.\cr
      Default: \code{FALSE}
  }
  \item{verboseMode}{
      An integer value indicating the amount of output to stdout:\cr
      0: nothing\cr
      1: input and status messages, plus a progress idicator\cr
      2: like 1 plus additional information and a grahical progress indicator\cr
      3: information on the computations being made plus a
      graphical progress bar.\cr
      4: additional information on the computations being made plus a
      graphical progress bar.\cr
      Default: \code{0}.
  }
  \item{dynamicConstraints} {
      Values of dynamically changing reaction rates
    	Default: NULL)
  }
  \item{mediumConcs} {
      A facility to simulate changing concentrations of nutrients: it may be
      either a table of delta values to add (or substract) at each time point
      (zero leads to no modification), or a function that will take as input
      the current concentrations and return the new ones (the old concentrations
      will be substituted by the new ones, so ensure you return all).
  }
  \item{\dots}{ 
      Further arguments passed to \code{\linkS4class{sysBiolAlg}}.  Argument
      \code{solverParm} is a good candidate.
  }
}

\value{
    returns \code{\link{optsol_dynamicFBA}} if retOptSol was set to \code{TRUE}
    or a list with the results containing
    
    nprob = the number of steps actually computed
    
    ncols = the number of columns (reactions) in the problem solved
    
    nrows = the number of rows (metabolites) in the problem solved
    
    all_fluxes = all the fluxes computed at each step
    
    concentrationMatrix = the concentrations computed at each step
    
    excRxnNames = the names of excluded reactions
    
    timeVec = a vector with the times at which the problem was evaluated
    
    biomassVec = a vector with the biomass computed at each time
}
\references{
    Valverde, J. R. et al. (2018) Manuscript in preparation.

    Varma, A. and Palsson, B.O. 1994. Stoichiometric flux balance models
    quantitatively predict growth and metabolic by-product secretion in wild-type
    Escherichia coli W3110.  \emph{Appl Environ Microbiol} 60: 3724-3731.

    Valverde, José R., Sonia Gullón, and Rafael P. Mellado.  (2018) Modelling the
    metabolism of protein secretion through the Tat route in Streptomyces lividans.
    \emph{BMC microbiology} 18.1: 59.

    Quantitative prediction of cellular metabolism with constraint-based models: the
    COBRA Toolbox. \emph{Nat Protoc} \bold{2}, 727--738. 

} 

\author{Jose R. Valverde}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{modelorg}}, \code{\link{optsol_dynamicFBA}}, 
\code{\link{optimizeProb}},  \code{\link{sysBiolAlg}}, 
\code{\link{SYBIL_SETTINGS}} 
}
\examples{
\dontrun{
	## The examples here require the package glpkAPI to be
	## installed. If that package is not available, you have to set
	## the argument 'solver' (the default is: solver = "glpk") to the
        ## linear programming solver you have installed (e.g. "clpAPI",
        ## "lpSolveAPI", "cplexAPI").

	## load the example data set
	data(Ec_core)
        lowbnd(Ec_core)[react_id(Ec_core)=='EX_glc(e)']=-10;
        lowbnd(Ec_core)[react_id(Ec_core)=='EX_o2(e)']=-18;
	## run adaptiveDFBA(), Ec_df will be an object of class \code{\link{optsol_dynamicFBA}}
	Ec_df <- adaptiveDFBA(Ec_core,substrateRxns={'EX_glc(e)'},initConcentrations=10,
		initBiomass=.035,timeStep=.25,nSteps=20,verboseMode=3)

	## plot biomass and reactions
	plot(Ec_df,plotRxns=c('EX_glc(e)','EX_ac(e)'));

	## open an SBML model
	library(sybilSBML)
	model <- readSBMLmod('Slividans.xml');
	
        ## load a tab-separated file with a list of dynamic constraints
        ## e.g. given 'exp.tab'
        ## Time	Biomass_SLI	SEC_AML
        ## 0	0.01	0
        ## 10	0.011	0
        ## 16	0.14	1.63e-6
        ## 24	0.135	1.63e-5
        ## 48   0.001	2.23e-7
        dat <- read.table('exp.tab', sep='\t', header=TRUE)
        reactions <- names(dat)
        reactions <- reactions[ -which(reactions %in% 'Time') ]
        
        ## create dynamicConstraints data frame with target times
        dc = data.frame( Time = seq(1, nSteps * tStep, by=tStep))
        ## 'Time' will be ignored, but helps readability and checking

        x <- dat['Time'][,1]	## Prepare a vector with time values
        for (r in reactions) {
            y <- dat[r][,1]		## Prepare a vector with reaction values
            ## make a sigmoid interpolation for biomass
            if (r == biomass) {
	        ## do sigmoid interpolation followed by conversion to rate
	        model <- nls(y ~ a + ((b - a) / (1 + exp(-c * (x - d)))), 
	            start=list(a = min(y), b=max(y), c= 1, d=median(x)), 
	            trace=FALSE, algorithm="port")
	            p <- coef(model)
	            obsdata <- data.frame(
		            x = seq(1, nSteps * tStep, by=tStep),
		            y = sigm(p, seq(1, nSteps * tStep, by=tStep))
	            )
	            interdata <- obs2rates(obsdata['x'][,1], obsdata['y'][,1], 1)
            }
            else {
	        # For non-biomass, we cannot assume a sigmoid distribution
	        # use either linear or spline interpolation
	        # In principle, linear is recommended as it makes no assumptions
	        # these give pairs x,y (time, r)
	        if (interp == 'linear') {
	            interdata <- data.frame(
		        approx(x, y, xout=seq(1, nSteps * tStep, by=tStep))
	            )
	        } else if (interp == 'spline') {
	            interdata <- data.frame(
		        spline(x, y, xout=seq(1, nSteps * tStep, by=tStep))
	            )
	        }
            }
            # add the corresponding column to the output data frame
            dc[r] <- interdata['y']
        }
        
        ## Perform the simulation
        adfba <- adativeDFBA(model, 
        	substrateRxns={'EX_mnl(e)'},
                initConcentrations=54,
		initBiomass=.01,
                timeStep=.25,nSteps=20,
                verboseMode=5,
                biomassRxn="BiomassSLI",
                dynamicConstraints=dc,
                retOptSol=FALSE, fld=TRUE)

	x11()
	plot(adfba)

}% end dontrun
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ optimize }
