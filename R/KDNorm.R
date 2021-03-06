#' Kyte and Doolittle Scaled Hydropathy Index
#'
#' A dataset containing a measure of hydropathy for each amino acid residue
#'   as reported by Kyte J. and Doolittle R.F. (1982). Values normalized from
#'   0 to 1. \cr If you use these values, please cite the source article.
#' @format a data frame with 20 rows, one for each standard amino acid, and
#'   2 variables
#' \describe{
#'    \item{V1}{Amino acid residues as a single letter}
#'    \item{V2}{Scaled Hydropathy of a residue, measured 0-1}
#'  }
#' @family scaled hydropathy functions
#' @source Kyte, Jack, and Russell F. Doolittle.
#'   "A simple method for displaying the hydropathic character of a protein."
#'   Journal of molecular biology 157.1 (1982): 105-132.
#'   \url{https://doi.org/10.1016/0022-2836(82)90515-0}
"KDNorm"
