#' This function converts the vector of values into a factor
#' and rearranges levels in a descending order
#'
#' @title A version of \code{reorder()} function that uses \code{desc()} from \link{dplyr}
#' @param x, a vector of values
#' @return x as a factor, levels reordered in descending order
#' @export
#' @importFrom stats reorder
#' @examples
#' fct_desc(c(1, 3, 10, 2, 20))
#' fct_desc(c("Spring", "Fall", "Summer", "Winter"))
fct_desc <- function(x) {
  if (is.factor(x)) {
    factor(reorder(x, dplyr::desc(as.character(x))))
  } else {
  factor(reorder(x, dplyr::desc(x))) }
}
