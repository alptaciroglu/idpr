% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chargeCalculations.R
\name{netCharge}
\alias{netCharge}
\title{Protein Charge Calculation, Net Charge}
\usage{
netCharge(
  sequence,
  pKaSet = "IPC_protein",
  pH = 7,
  includeTermini = TRUE,
  averaged = FALSE
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

\item{includeTermini}{Logical value, TRUE by default. This
determines how the calculation handles the N- and C- terminus.
includeTermini determines if the calculation will use the charge of the
amine and carboxyl groups at the ends of the peptide (When TRUE). These
charges are ignored when \code{includeTermini = FALSE}.}

\item{averaged}{logical value. FALSE by default.
When \code{averaged = FALSE}, the total net charge is returned.
When \code{averaged = TRUE}, the total net charge is averaged by the
sequence length. This gives a value of -1 to +1.}
}
\value{
numeric value. Either the net charge or average net charge, depending
  on the value of the averaged argument
}
\description{
This function will determine the net charge of a peptide using the
  Henderson-Hasselbalch Equation. The output is a numeric value describing
  the total net charge or the average net charge.
}
\examples{
#Amino acid sequences can be character strings
aaString <- "ACDEFGHIKLMNPQRSTVWY"
#Amino acid sequences can also be character vectors
aaVector <- c("A", "C", "D", "E", "F",
              "G", "H", "I", "K", "L",
              "M", "N", "P", "Q", "R",
              "S", "T", "V", "W", "Y")
#Alternatively, .fasta files can also be used by providing a character string
 # of the path to the file.

#Calculate the Net Charge
netCharge(aaString,
          averaged = FALSE)
netCharge(aaVector,
          averaged = FALSE)

#Calculate the Average Net Charge
netCharge(aaString,
          averaged = TRUE)
netCharge(aaVector,
          averaged = TRUE)

#Change the pH
netCharge(aaString,
          pH = 8)
netCharge(aaString,
          pH = 7)
netCharge(aaString,
          pH = 5.5)

#Specify which pKa set to use
netCharge(aaString,
          pKaSet = "IPC_protein") #Default
netCharge(aaString,
          pKaSet = "IPC_peptide")
netCharge(aaString,
          pKaSet = "Dawson")
netCharge(aaString,
          pKaSet = "EMBOSS")

#Should the termini be included in charge calculations?
netCharge(aaString,
          includeTermini = TRUE) #Default
netCharge(aaString,
          includeTermini = FALSE)
}
\seealso{
\code{\link{pKaData}} for residue pKa values and citations. See
  \code{\link{hendersonHasselbalch}} for charge calculations.

Other charge functions: 
\code{\link{chargeCalculationGlobal}()},
\code{\link{chargeCalculationLocal}()},
\code{\link{hendersonHasselbalch}()}
}
\concept{charge functions}
