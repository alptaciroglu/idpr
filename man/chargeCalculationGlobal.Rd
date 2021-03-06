% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chargeCalculations.R
\name{chargeCalculationGlobal}
\alias{chargeCalculationGlobal}
\title{Protein Charge Calculation, Globally}
\usage{
chargeCalculationGlobal(
  sequence,
  pKaSet = "IPC_protein",
  pH = 7,
  plotResults = FALSE,
  includeTermini = TRUE,
  sumTermini = TRUE,
  proteinName = NA,
  printCitation = FALSE,
  ...
)
}
\arguments{
\item{sequence}{amino acid sequence as a character string or vector of
individual residues. alternatively, a character string of the path to a
.fasta / .fa file}

\item{pKaSet}{A character string or data frame. "IPC_protein" by default.
Character string to load specific, preloaded pKa sets.
 c("EMBOSS", "DTASelect", "Solomons", "Sillero", "Rodwell",
  "Lehninger", "Toseland", "Thurlkill", "Nozaki", "Dawson",
  "Bjellqvist", "ProMoST", "Vollhardt", "IPC_protein", "IPC_peptide")
 Alternatively, the user may supply a custom pKa dataset.
 The format must be a data frame where:
 Column 1 must be a character vector of residues named "AA" AND
 Column 2 must be a numeric vector of pKa values.}

\item{pH}{numeric value, 7.0 by default.
The environmental pH used to calculate residue charge.}

\item{plotResults}{logical value, FALSE by default.
This determines what is returned. If \code{plotResults = FALSE}, a
data frame is returned with the position, residue, and charge (-1 to +1).
If  \code{plotResults = TRUE}, a graphical output is returned (ggplot)
showing the charge distribution.}

\item{includeTermini, sumTermini}{Logical values, both TRUE by default. This
determines how the calculation handles the N- and C- terminus.
includeTermini determines if the calculation will use the charge of the
amine and carboxyl groups at the ends of the peptide (When TRUE). These
charges are ignored when \code{includeTermini = FALSE}. sumTermini
determines if the charge of the first (likely Met, therefore uncharged),
and final residue (varies) will be added to the termini charges, or if the
N and C terminus will be returned as separate residues.
When \code{sumTermini = TRUE}, charges are summed. When
\code{sumTermini = FALSE}, the N and C terminus are added as a unique
residue in the DF. This will impact averages by increasing the sequence
length by 2. sumTermini is ignored if \code{includeTermini = FALSE}.}

\item{proteinName}{character string with length = 1.
optional setting to include the name in the plot title.}

\item{printCitation}{Logical value. FALSE by default.
When \code{printCitation = TRUE} the citation for the pKa set is printed.
This allows for the user to easily obtain the dataset citation.
Will not print if there is a custom dataset.}

\item{...}{any additional parameters, especially those for plotting.}
}
\value{
If \code{plotResults = FALSE}, a data frame
  is returned with the position, residue, and charge (-1 to +1). If
  \code{plotResults = TRUE}, a graphical output is returned (ggplot) showing
  the charge distribution.
}
\description{
This function will determine the charge of a peptide using the
  Henderson-Hasselbalch Equation. The output is a data frame (default) or q
  plot of charge calculations along the peptide sequence. Charges are
  determined globally, or along the entire chain.
}
\section{Plot Colors}{

  For users who wish to keep a common aesthetic, the following colors are
  used when plotResults = TRUE. \cr
  \itemize{
  \item Dynamic line colors: \itemize{
  \item Close to -1 = "#92140C"
  \item Close to +1 = "#348AA7"
  \item Close to 0 (midpoint) = "grey65" or "#A6A6A6"}}
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
#a character string of the path to the file.
exampleDF <- chargeCalculationGlobal(aaString)
head(exampleDF)
exampleDF <- chargeCalculationGlobal(aaVector)
head(exampleDF)


#Changing pKa set or pH used for calculations
exampleDF_pH5 <- chargeCalculationGlobal(aaString,
                                         pH = 5)
head(exampleDF_pH5)
exampleDF_pH7 <- chargeCalculationGlobal(aaString,
                                         pH = 7)
head(exampleDF_pH7)
exampleDF_EMBOSS <- chargeCalculationGlobal(aaString,
                                            pH = 7,
                                            pKa = "EMBOSS")
head(exampleDF_EMBOSS)

#If the termini charge should not be included with includeTermini = F
exampleDF_NoTermini <- chargeCalculationGlobal(aaString,
                                               includeTermini = FALSE)
head(exampleDF_NoTermini)

#and how the termini should be handeled with sumTermini
exampleDF_SumTermini <- chargeCalculationGlobal(aaString,
                                                sumTermini = TRUE)
head(exampleDF_SumTermini)
exampleDF_SepTermini <- chargeCalculationGlobal(aaString,
                                                sumTermini = FALSE)
head(exampleDF_SepTermini)

#plotResults = TRUE will output a ggplot as a line plot
  chargeCalculationGlobal(aaString,
                          plot = TRUE)

  #since it is a ggplot, you can change or annotate the plot
  gg <- chargeCalculationGlobal(aaVector,
                                window = 3,
                                plot = TRUE)
  gg <- gg + ggplot2::ylab("Residue Charge")
  gg <- gg + ggplot2::geom_text(data = exampleDF,
                                ggplot2::aes(label = AA,
                                             y = Charge + 0.1))
  plot(gg)
#alternativly, you can pass the data frame to sequenceMap()
sequenceMap(sequence = exampleDF$AA,
            property = exampleDF$Charge)
}
\seealso{
\code{\link{pKaData}} for residue pKa values and
  \code{\link{hendersonHasselbalch}} for charge calculations.

Other charge functions: 
\code{\link{chargeCalculationLocal}()},
\code{\link{hendersonHasselbalch}()},
\code{\link{netCharge}()}
}
\concept{charge functions}
