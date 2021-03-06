% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/banner.R
\name{bannerStr}
\alias{bannerStr}
\title{bannerStr}
\usage{
cat(bannerStr(text="something"))
}
\arguments{
\item{text}{the text to print (default=" ")}
}
\value{
a long character string that spans multiple lines, so that
	each line contains the corresponding scan line for the text
}
\description{
\code{bannerStr()} transforms a text for printing in large letters much 
like UNIX banner but does not truncate text at 10 characters. Instead,
	 it will produce all the text given as a single "line".
}
\details{
Since output letters are 8 characters wide, this means, in fact, that
if you want your text to look good, you should truncate it to the
line width limit selected in your R session divided by 8.

Maybe in a future release I will modify the package to detect maximum
line width and do the truncation... for now I find it more useful not
to have explicit limits.

Banner is used typically to draw attention to special text in your R
output
}
\examples{
cat(bannerStr('Hello world!'))
banner()
cat(bannerStr('---------'))
cat(bannerStr('Hi world!'))
cat(bannerStr('---------'))
\dontshow{ cat(banner('Hi World!')) }

}
\author{
(C) José R Valverde, CNB-SIC, 2018
}
