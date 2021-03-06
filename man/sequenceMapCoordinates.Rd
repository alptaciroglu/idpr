% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sequenceMap.R
\name{sequenceMapCoordinates}
\alias{sequenceMapCoordinates}
\title{Sequence Map Coordinates}
\usage{
sequenceMapCoordinates(sequence, nbResidues = 30)
}
\arguments{
\item{sequence}{amino acid sequence as a single character string,
a vector of single characters, or an AAString object.
It also supports a single character string that specifies
the path to a .fasta or .fa file.}

\item{nbResidues}{numeric value, 30 by default.
The number of residues to display on each row of the plot.
It is not recommended to be over 50 or under 10 for standard sequences.
Optimal value may vary between sequences of extreme lengths.}
}
\value{
A data frame with rows containing the amino acid sequence, residue
  position within the sequence, as well as the row and column of each
  residue within the ggplot output of sequenceMap().
}
\description{
This is a function used to create a coordinate grid for the
  \code{\link{sequenceMap}} function. It is based on the length of the
  sequence being mapped, and how many residues per line are specified.
  The function wraps the sequence to have a number of columns that is
  the sequence length / number of residues per row, rounded up. \cr\cr
  This is intended for use within the sequenceMap function, however, this
  can also be used to identify the coordinates of residues within the ggplot
  coordinate plane for addition annotations.
}
\examples{
#Amino acid sequences can be character strings
aaString <- "ACDEFGHIKLMNPQRSTVWY"
#Amino acid sequences can also be character vectors
aaVector <- c("A", "C", "D", "E", "F",
           "G", "H", "I", "K", "L",
           "M", "N", "P", "Q", "R",
           "S", "T", "V", "W", "Y")
#Alternatively, .fasta files can also be used by providing
##The path to the file as a character string

exampleDF <- sequenceMapCoordinates(aaString,
                                  nbResidues = 10)
head(exampleDF)

exampleDF <- sequenceMapCoordinates(aaVector,
                                 nbResidues = 10)
head(exampleDF)

#Getting a data frame for plotting with sequenceMap
 tendencyDF <- structuralTendency(sequence = aaVector)
 #Making a sequenceMap ggplot to annotate
gg <- sequenceMap(sequence = tendencyDF$AA,
            property = tendencyDF$Tendency,
             nbResidues = 3,
              labelType = "both")

#Change the nbResidues to correspond to the sequenceMap setting
mapCoordDF <- sequenceMapCoordinates(aaVector,
                                  nbResidues = 3)
head(mapCoordDF)

#subsetting for positive residues
mapCoordDF_subset <- mapCoordDF$AA \%in\% c("K", "R", "H")
mapCoordDF_subset <- mapCoordDF[mapCoordDF_subset,]

#use mapCoordDF to annotate positive residues with a plus
library(ggplot2)
gg <- gg + geom_point(inherit.aes = FALSE,
                    data = mapCoordDF_subset,
                   aes(x = col + 0.5, #to center on the residue
                       y = row + 0.2), #to move above on the residue
                   color = "purple",
                   size = 3,
                   shape = 3)
plot(gg)
}
\seealso{
\code{\link{sequenceMapCoordinates}} for mapping coordinates
}
