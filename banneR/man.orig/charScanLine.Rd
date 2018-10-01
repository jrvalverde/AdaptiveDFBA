\name{charScanLine}
\alias{charScanLine}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
charScanLine(ch, l)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ch}{
%%     ~~Describe \code{ch} here~~
}
  \item{l}{
%%     ~~Describe \code{l} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (ch, l) 
{
    if (ch == " ") 
        return(c("        ", "        ", "        ", "        ", 
            "        ", "        ", "        ", "        ")[l])
    else if (ch == "0") 
        return(c(" #####  ", "#    ## ", "#   # # ", "#  #  # ", 
            "# #   # ", "##    # ", " #####  ", "        ")[l])
    else if (ch == "1") 
        return(c("     #  ", "    ##  ", "     #  ", "     #  ", 
            "     #  ", "     #  ", "     #  ", "        ")[l])
    else if (ch == "2") 
        return(c(" #####  ", "#     # ", "      # ", "  ####  ", 
            " #      ", "#       ", "####### ", "        ")[l])
    else if (ch == "3") 
        return(c(" #####  ", "#     # ", "      # ", "  ####  ", 
            "      # ", "#     # ", " #####  ", "        ")[l])
    else if (ch == "4") 
        return(c("#    #  ", "#    #  ", "#    #  ", " ###### ", 
            "     #  ", "     #  ", "     #  ", "        ")[l])
    else if (ch == "5") 
        return(c("####### ", "#       ", "#       ", "######  ", 
            "      # ", "#     # ", " #####  ", "        ")[l])
    else if (ch == "6") 
        return(c(" #####  ", "#       ", "#       ", " #####  ", 
            "#     # ", "#     # ", " #####  ", "        ")[l])
    else if (ch == "7") 
        return(c(" ###### ", "      # ", "     #  ", "    #   ", 
            "   #    ", "  #     ", " #      ", "        ")[l])
    else if (ch == "8") 
        return(c(" #####  ", "#     # ", "#     # ", " #####  ", 
            "#     # ", "#     # ", " #####  ", "        ")[l])
    else if (ch == "9") 
        return(c(" #####  ", "#     # ", "#     # ", " #####  ", 
            "      # ", "      # ", " #####  ", "        ")[l])
    else if (ch == "a") 
        return(c("        ", "        ", " ####   ", "     #  ", 
            " #####  ", "#    #  ", " #### # ", "        ")[l])
    else if (ch == "b") 
        return(c(" #      ", " #      ", " #####  ", " #    # ", 
            " #    # ", " #    # ", "# ####  ", "        ")[l])
    else if (ch == "c") 
        return(c("        ", "        ", "  ###   ", " #   #  ", 
            "#       ", " #   #  ", "  ###   ", "        ")[l])
    else if (ch == "d") 
        return(c("     #  ", "     #  ", " #####  ", "#    #  ", 
            "#    #  ", "#    #  ", " #### # ", "        ")[l])
    else if (ch == "e") 
        return(c("        ", "        ", " ####   ", "#    #  ", 
            "######  ", "#       ", " ####   ", "        ")[l])
    else if (ch == "f") 
        return(c("  ###   ", " #      ", " #      ", "####    ", 
            " #      ", " #      ", " #      ", "        ")[l])
    else if (ch == "g") 
        return(c("        ", "        ", " #### # ", "#    #  ", 
            "#    #  ", " ####   ", "     #  ", " ####   ")[l])
    else if (ch == "h") 
        return(c(" #      ", " #      ", " ####   ", " #   #  ", 
            " #   #  ", " #   #  ", "##   #  ", "        ")[l])
    else if (ch == "i") 
        return(c("  #     ", "        ", " ##     ", "  #     ", 
            "  #     ", "  #     ", "#####   ", "        ")[l])
    else if (ch == "j") 
        return(c("   #    ", "        ", "  ##    ", "   #    ", 
            "   #    ", "   #    ", "#  #    ", " ##     ")[l])
    else if (ch == "k") 
        return(c(" #      ", " #  #   ", " # #    ", " ##     ", 
            " # #    ", " #  #   ", "##  ##  ", "        ")[l])
    else if (ch == "l") 
        return(c("##      ", " #      ", " #      ", " #      ", 
            " #      ", " #      ", "###     ", "        ")[l])
    else if (ch == "m") 
        return(c("        ", "        ", "# # ##  ", "## #  # ", 
            "#  #  # ", "#  #  # ", "#  #  # ", "        ")[l])
    else if (ch == "n") 
        return(c("        ", "        ", " # ##   ", " ##  #  ", 
            " #   #  ", " #   #  ", " #   #  ", "        ")[l])
    else if (ch == "o") 
        return(c("        ", "        ", " ####   ", "#    #  ", 
            "#    #  ", "#    #  ", " ####   ", "        ")[l])
    else if (ch == "p") 
        return(c("        ", "        ", "#####   ", " #   #  ", 
            " #   #  ", " ####   ", " #      ", "##      ")[l])
    else if (ch == "q") 
        return(c("       ", "       ", " #### #", "#    # ", 
            "#    # ", " ##### ", "     # ", "     ##")[l])
    else if (ch == "r") 
        return(c("        ", "        ", "## ##   ", " ##  #  ", 
            " #      ", " #      ", "##      ", "        ")[l])
    else if (ch == "s") 
        return(c("        ", "        ", " ####   ", "#       ", 
            " ####   ", "     #  ", "#####   ", "        ")[l])
    else if (ch == "t") 
        return(c("  #     ", "  #     ", "#####   ", "  #     ", 
            "  #     ", "  #     ", "   ##   ", "        ")[l])
    else if (ch == "u") 
        return(c("        ", "        ", "#    #  ", "#    #  ", 
            "#    #  ", "#    #  ", " #### # ", "        ")[l])
    else if (ch == "v") 
        return(c("        ", "        ", "#     # ", " #   #  ", 
            " #   #  ", "  # #   ", "   #    ", "        ")[l])
    else if (ch == "w") 
        return(c("        ", "        ", "#     # ", "#     # ", 
            "#  #  # ", "#  #  # ", " ## ##  ", "        ")[l])
    else if (ch == "x") 
        return(c("        ", "        ", "#    #  ", " #  #   ", 
            "  ##    ", " #  #   ", "#    #  ", "        ")[l])
    else if (ch == "y") 
        return(c("        ", "        ", " #   #  ", " #   #  ", 
            " #   #  ", "  ###   ", "    #   ", " ###    ")[l])
    else if (ch == "z") 
        return(c("        ", "        ", "######  ", "    #   ", 
            "   #    ", "  #     ", " ###### ", "        ")[l])
    else if (ch == "A") 
        return(c("   #    ", "  # #   ", " #   #  ", "#     # ", 
            "####### ", "#     # ", "#     # ", "        ")[l])
    else if (ch == "B") 
        return(c("#####   ", "#    #  ", "#    #  ", "#####   ", 
            "#    #  ", "#    #  ", "#####   ", "        ")[l])
    else if (ch == "C") 
        return(c("  ###   ", " #   #  ", "#       ", "#       ", 
            "#       ", " #   #  ", "  ###   ", "        ")[l])
    else if (ch == "D") 
        return(c("####    ", "#   #   ", "#    #  ", "#    #  ", 
            "#    #  ", "#   #   ", "####    ", "        ")[l])
    else if (ch == "E") 
        return(c("######  ", "#       ", "#       ", "#####   ", 
            "#       ", "#       ", "######  ", "        ")[l])
    else if (ch == "F") 
        return(c("######  ", "#       ", "#       ", "#####   ", 
            "#       ", "#       ", "#       ", "        ")[l])
    else if (ch == "G") 
        return(c("  ###   ", " #   #  ", "#       ", "#       ", 
            "#   ### ", " #   ## ", "  ### # ", "        ")[l])
    else if (ch == "H") 
        return(c("#     # ", "#     # ", "#     # ", "####### ", 
            "#     # ", "#     # ", "#     # ", "        ")[l])
    else if (ch == "I") 
        return(c("#####   ", "  #     ", "  #     ", "  #     ", 
            "  #     ", "  #     ", "#####   ", "        ")[l])
    else if (ch == "J") 
        return(c(" #####  ", "   #    ", "   #    ", "   #    ", 
            "   #    ", " # #    ", "  #     ", "        ")[l])
    else if (ch == "K") 
        return(c("#    #  ", "#   #   ", "#  #    ", "###     ", 
            "#  #    ", "#   #   ", "#    #  ", "        ")[l])
    else if (ch == "L") 
        return(c("#       ", "#       ", "#       ", "#       ", 
            "#       ", "#       ", "######  ", "        ")[l])
    else if (ch == "M") 
        return(c("##   ## ", "# # # # ", "#  #  # ", "#     # ", 
            "#     # ", "#     # ", "#     # ", "        ")[l])
    else if (ch == "N") 
        return(c("#     # ", "##    # ", "# #   # ", "#  #  # ", 
            "#   # # ", "#    ## ", "#     # ", "        ")[l])
    else if (ch == "O") 
        return(c("  ###   ", " #   #  ", "#     # ", "#     # ", 
            "#     # ", " #   #  ", "  ###   ", "        ")[l])
    else if (ch == "P") 
        return(c("#####   ", "#    #  ", "#    #  ", "#####   ", 
            "#       ", "#       ", "#       ", "        ")[l])
    else if (ch == "Q") 
        return(c("  ###   ", " #   #  ", "#     # ", "#     # ", 
            "# #   # ", " # # #  ", "  ###   ", "     ## ")[l])
    else if (ch == "R") 
        return(c("####    ", "#   #   ", "#   #   ", "####    ", 
            "#   #   ", "#    #  ", "#    #  ", "        ")[l])
    else if (ch == "S") 
        return(c("  ###   ", " #   #  ", "  #     ", "   #    ", 
            "    #   ", " #   #  ", "  ###   ", "        ")[l])
    else if (ch == "T") 
        return(c("####### ", "   #    ", "   #    ", "   #    ", 
            "   #    ", "   #    ", "   #    ", "        ")[l])
    else if (ch == "U") 
        return(c("#     # ", "#     # ", "#     # ", "#     # ", 
            "#     # ", " #   #  ", "  ###   ", "        ")[l])
    else if (ch == "V") 
        return(c("#     # ", "#     # ", " #   #  ", " #   #  ", 
            "  # #   ", "  # #   ", "   #    ", "        ")[l])
    else if (ch == "W") 
        return(c("#     # ", "#     # ", "#     # ", "#     # ", 
            "#  #  # ", "# # # # ", " #   #  ", "        ")[l])
    else if (ch == "X") 
        return(c("#     # ", "#     # ", " #   #  ", "  ###   ", 
            " #   #  ", "#     # ", "#     # ", "        ")[l])
    else if (ch == "Y") 
        return(c("#     # ", "#     # ", " #   #  ", "  # #   ", 
            "   #    ", "   #    ", "   #    ", "        ")[l])
    else if (ch == "Z") 
        return(c("####### ", "     #  ", "    #   ", "   #    ", 
            "  #     ", " #      ", "####### ", "        ")[l])
    else if (ch == ".") 
        return(c("        ", "        ", "        ", "        ", 
            "        ", "        ", "   #    ", "        ")[l])
    else if (ch == ",") 
        return(c("        ", "        ", "        ", "        ", 
            "        ", "    #   ", "    #   ", "   #    ")[l])
    else if (ch == ";") 
        return(c("        ", "        ", "        ", "    #   ", 
            "        ", "    #   ", "    #   ", "   #    ")[l])
    else if (ch == ":") 
        return(c("        ", "        ", "        ", "        ", 
            "   #    ", "        ", "   #    ", "        ")[l])
    else if (ch == "!") 
        return(c("   #    ", "   #    ", "   #    ", "   #    ", 
            "   #    ", "        ", "   #    ", "        ")[l])
    else if (ch == "\\") 
        return(c("#       ", " #      ", "  #     ", "   #    ", 
            "    #   ", "     #  ", "      # ", "        ")[l])
    else if (ch == "/") 
        return(c("      # ", "     #  ", "    #   ", "   #    ", 
            "  #     ", " #      ", "#       ", "        ")[l])
    else if (ch == "|") 
        return(c("   #    ", "   #    ", "   #    ", "   #    ", 
            "   #    ", "   #    ", "   #    ", "   #    ")[l])
    else if (ch == "+") 
        return(c("        ", "   #    ", "   #    ", " #####  ", 
            "   #    ", "   #    ", "        ", "        ")[l])
    else if (ch == "-") 
        return(c("        ", "        ", "        ", " #####  ", 
            "        ", "        ", "        ", "        ")[l])
    else if (ch == "*") 
        return(c("        ", " # # #  ", "  ###   ", "   #    ", 
            "  ###   ", " # # #  ", "        ", "        ")[l])
    else if (ch == "=") 
        return(c("        ", "        ", " #####  ", "        ", 
            " #####  ", "        ", "        ", "        ")[l])
    else if (ch == "_") 
        return(c("        ", "        ", "        ", "        ", 
            "        ", "        ", "        ", "########")[l])
    else if (ch == "(") 
        return(c("     #  ", "    #   ", "   #    ", "   #    ", 
            "   #    ", "    #   ", "     #  ", "        ")[l])
    else if (ch == ")") 
        return(c("  #     ", "   #    ", "    #   ", "    #   ", 
            "    #   ", "   #    ", "  #     ", "        ")[l])
    else if (ch == "[") 
        return(c("   ###  ", "   #    ", "   #    ", "   #    ", 
            "   #    ", "   #    ", "   ###  ", "        ")[l])
    else if (ch == "]") 
        return(c("  ###   ", "    #   ", "    #   ", "    #   ", 
            "    #   ", "    #   ", "  ###   ", "        ")[l])
    else if (ch == "{") 
        return(c("    ##  ", "   #    ", "   #    ", "  #     ", 
            "   #    ", "   #    ", "    ##  ", "        ")[l])
    else if (ch == "}") 
        return(c("  ##    ", "    #   ", "    #   ", "     #  ", 
            "    #   ", "    #   ", "  ##    ", "        ")[l])
    else if (ch == "'") 
        return(c("    #   ", "    #   ", "   #    ", "        ", 
            "        ", "        ", "        ", "        ")[l])
    else if (ch == "\"") 
        return(c("  # #   ", "  # #   ", "  # #   ", "        ", 
            "        ", "        ", "        ", "        ")[l])
    else return(c("########", "#      #", "#      #", "#      #", 
        "#      #", "#      #", "#      #", "########")[l])
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
