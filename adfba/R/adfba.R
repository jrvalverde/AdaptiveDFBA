#' adfba: A package for Adaptive DFBA metabolic modeling.
#'
#' @details	The adfba Package provides the function
#' 		adaptiveDFBA.
#' 
#' @section adfba functions:
#' \code{adaptiveDFBA} implements the Adaptive Dynamic Flux Balance Analysis
#' algorithm as described in Valverde et al. 2018.
#'
#' @docType package
#' @name adfba
#' @keywords internal
#' @references
#'	Valverde, Jose R., Sonia Gullon, and Rafael P. Mellado.  (2018)
#'  	\emph{Modelling the metabolism of protein secretion through the Tat route in Streptomyces lividans}.
#'  	BMC microbiology 18.1: 59
#'
"_PACKAGE"
#> [1] "_PACKAGE"

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
#' @usage	\code{data(Ec_core)}
#'
"Ec_core"
#> [1] "EC_core"

