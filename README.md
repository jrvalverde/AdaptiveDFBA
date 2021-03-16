# AdaptiveDFBA



[![DOI](https://zenodo.org/badge/151059786.svg)](https://zenodo.org/badge/latestdoi/151059786)


## An implementation of the AdaptiveDFBA algorithm using R and the sybil package

This method has been published in BMC Microbiology, "Dynamic metabolic modelling of 
overproduced protein secretion in Streptomyces lividans using adaptive DFBA" 
08-Feb-2019 DOI:https://doi.org/10.5281/zenodo.2560170

The paper gives an introductory view of the method, with examples of how to use it.
We have been working on an R program to make using this method (as well as all other 
traditional analyses, like FBA, MTF, FVA, DFBA, etc...) trivial and will be publishing
it as soon as possible. Sadly, the CoV crisis caught us with a long experience in CoV
research and our interest had to shift to that line of work. If you are interested in
using our automated program, please contact <jrvalverde@cnb.csic.es>.

ADFBA is a DFBA extension that allows you to control and steer a metabolic simulation
with total freedom. In a traditional DFBA simulation you define a metabolic model, set
up initial conditions and run the simulation.

In ADFBA you also define an initial metabolic model and conditions (metabolite 
concentrations and possibly exchange rates), but at any step during the simulation
you can inspect the status of the simulation, querying concentration of any 
metabolite, values of any flux (not just exchange rates), and model configuration.

Just as you can query information on the fly, you can, at any and every step during
the simulation introduce any arbitrary change in metabolite concentrations, flux 
rates or limits, or even the model itself.

## What is the use of this?

Being able to change metabolite concentrations allows us to model fed-batch systems
where metabolites are/may be added or removed at arbitrary points in time. E.g. giving
pulses of a carbon source like glucose or removing/harvesting interesting or toxic products.
Coupled with knowledge of the status of the system, we can attach these changes to
current conditions, like, e.g. detect whenever glucose or pH falls below a given level (which we
cannot predict in advance) and apply the changes desired to the medium (e.g. as having sensors 
in a production tank and adding more nutrients or removing producs/toxins when a suitable 
concentration is reached).

Being able to change the model allows us to simulate almost any physiological situation:
say you are modeling a plant, knowing that at some times light will be switched off. Its
metabolism should also switch off photosynthesis, but there is no way a metabolic model in
DFBA knows this. With ADFBA we can detect when the night-time is reached and modify the limits
of specific reactions in the model to activate/inactivate specific routes (and vice-versa to 
return to normal when light is restored). Or say that you are modeling response to fever or
climate: environmental temperature will change and with it, metabolic rates should be increased 
or reduced correspondingly.

Coupled with sensors of time, concentration, etc, this allows us to model situations
dependent on environment (like oxidative stress) or internal fluxes: we simply detect 
when a given metabolite of flux has surpassed a threshold and modify flux limits or
any other aspect of the simulation as required.

We can even modify the model itself: let's say we want to know what would be the 
effect of interrupting a gene or modifying gene expression (e.g. because we have 
transcriptomic data) at a given point or in response to specific conditions: we just
need to knock out or activate the corresponding genes/reactions. Or that we want
to know what would happen if we added new capabilities to a growing or stable culture
(e.g. we add a plasmid or vector carrying new genes): we just modify the model to
add/remove reactions. Or the effect of progressively substituting a bacterial species by 
another. We can even define this progressively by changing limits for
the new reactions slowly, increasing or reducing them through sucessive steps to simulate the
spread of a vector or change in the population.

This has proven most useful (as shown in the paper) to simulate heterologous protein
expression: TAT protein secretion is activated as a stress response, meaning that it
cannot remain active all the time, it has to be activated only after the oxidative stress
response is triggered at the end of the exponential phase. Similarly, SEC protein secretion 
is active during exponential growth, but becomes minor during stress conditions / static 
growth phases. You cannot activate SEC at the start of a simulation and leave it activated: it 
must be canceled at the end of exponential growth, when TAT (which was inactive) must in turn be
activated. And this is not an all or nothing switch: it must be done progressively
over several time steps.

## How do we do this?

To be able to do this, we need to be able to deal with two situations. One in which
we know in advance the modifications to be made and when will they occur (for instance, 
day/night timetables or fever cycles, or replicating available experimental data), 
and one in which we do not know in advance and will need to act in response to 
specific environmental/model conditions whenever they occur.

We have provided two mechanisms to steer the simulation:

The first, easier and simpler one is to use tables of changes indicating the time
at which the change should be applied and the new values, indicating concentrations
or flux limits. This will be useful if you know in advance at which times changes
happen and which changes are these (e.g. because you have experimental data that you
want to model).

The second is more powerful but requires more work: it consists in providing an R
callback function. Your functions will be called with all the information it needs to
know the system status and will return new values for either metabolites, flux limits
or even a new, modified model to continue the simulation. This may be used for fixed-time
changes (just wait for the correct time and apply the changes) but also allows us to
react in response to any change in the system.

The complexity of the situations to be modeled can be as large as you want. The trick 
is that, by using any of these methods, steering the simulation becomes trivial. Even
answering to trends is easy: just save the last n values and compare at each step to
detect a tendency.

## examples

As an example, we have (unpublished results) collected changes in metabolite concentrations
over time in various steered simulations based on experimental data. One would expect 
the evolution of a given flux to be a function of the relative concentrations of environmental 
metabolites. For instance, glucose consumption would adapt to glucose concentration changes,
which is something you can readily model in most current DFBA schemes, but it may also depend 
on the relative concentration of other metabolites: Streptomyces will prefer to use some amino acids 
over glucose if they are present in sufficient concentration, even if there is an excess of
glucose.

For key fluxes (exchange or internal fluxes), we have collected their calculated value as
environmental metabolite concentrations changed, as a function of all other metabolites, then we have tried to
fit them statistically, eliminate the less significant variables and obtained a simplified
formula that matched flux evolution in response to (indirectly related) an ensemble of environmental 
metabolite concentrations. We did also try several AI/ML methods to predict the evolution
of given fluxes of interest in response to environmental conditions. 

And then, we defined an R function that would, at each step, obtain the system conditions
and substitute the flux values calculated by DFFBA by the ones obtained with our curve fits
or AI/ML models to see how well would the simulation using our predictions emulate
the real system behaviour.

This means that at each step, our function would collect the chosen relevant concentrations (or 
conditions), make a prediction (using an statistical or an AI/ML model) on what the proper 
value should be, and substitute the FBA/MTF computed value by our predicted one.

Besides its academic interest (verifying the quality of simplified model predictions), this
entangles for us a major advantage: we do not want to "know-in-advance" the magnitude and
dependence of all changes in a system. That's too much work. This allows us to have the
computer learn what changes are needed and when, and apply them for us.

As an example: we could try to hand-tune our predictions for day/light or fever cycle
simulations until our runs match experimental data. Or we could use the experimental data to
have the computer figure out how to tune the response to these situations and force them
into the model automatically. Once you have a non-DFBA-predictable model of a dependence 
(say, of a flux on external metabolite concentrations) you would no longer need to measure 
experimentally the response to a new situation, you could theoretically use the model to force 
the appropriate response in the model).

For instance: in the above paper we found an individual instantaneous-time optimal solution
using DFBA for the consumption of some metabolites (like Alanine, i.e. eat it all while you
can), which contradicted evidence (the model would die after exhausting nutrients). Experimental
evidence, instead showed that cells behave "suboptimally": they relase Alanine early in time
(instead of the optimal consumption) which accumulates in the medium. When sugars are
scarce, the cell enters the stationary phase and starts using the secreted Alanine, but now
at a lower rate because it is not growing exponentially. A similar pattern applied to other 
metabolites. This allows it to survive longer at the expense of subotimal growth in the
exponential phase.

This conduct is not mathematically, time-instantaneous optimal. It makes sense because a
population of suboptimal cells would outlive an optimal population in times of scarcity and get
selected by evolution. It also implies that there is no way a system searching for an
optimal solution will ever reach that conclusion. But we could detect the dependence of
alanine flux on the environment and our statistical/AI models knew that on exponential-phase medium, a
suboptimal solution should be forced, and on an exhausted medium, alanine consumption should
be activated to feed on the reserve built during the times of wealth.

This is not so uncommon: many organisms take a similar subotimal strategy. In times of
abundance they store energy as fat (which is suboptimal since it consumes energy and
resources that do not have any immediate benefit, may actually be counterproductive and
reduce their chances of survival -think cardiopathies-, and may indeed never be needed), so
that when the times of need come, they have a reserve to feed upon and enlarge their 
survival expectation. This means they won't multiply so fast in times of abundance, exponential
growth, but will be able to last longer and their populations may outlast fast growers. This
of course will only work if times of hardship happen, for otherwise, the fast growers will
outgroe and occupy the echological niche, but, as we all know, times of hardship are not so 
uncommon and a well-stricken balance may actually be a great plus. And it likely must be 
because so many organisms follow this strategy.

There is, I suspect, a sociological/political/economical lesson to learn from all this,
and indeed, I seem to vaguely remember there were lots of popular sayings related, but
this is not the place to discuss it.

For now, suffice it to say that the R program we have been developing makes using these
strategies even easier yet (and more intuitive). We hope to publish it as soon as our
work on CoV allows us to round off all our development and prepare a publication.


## Other goodies

You will also find here the banneR package (to print UNIX(TM)-like banners in
R scripts, example data and an example driver script that can be used as
a command line program to simplify adpative dynamic FBA calculations in most
cases.

## Installation

Please, read the Supplementary Materials to the paper to learn more about 
installing this software.

Basically: you need to install R, sybil, sybilDynFBA, one ODE solver (to
choose among GLPK, CPLEX, CLP or LP-SOLVE) and its R binding (the corresponding
glpkAPI, cplexAPI, clpAPI or lpSolveAPI).

Then, download ADFBA, unzip it, and install it using the R 'devtools' package
(which you will need to install it until we have time to get it on CRAN).

A sample session follows (assuming that you have R installed and an ODE 
solver installed (which should be trivial on Linux using a package manager).

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

