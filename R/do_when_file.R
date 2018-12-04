
#' Do when a file exists
#'
#' Process an expression once a file exists.
#'
#' @param file Name of file on which to trigger expression \code{.d}
#' @inheritParams do_when
#' @export
do_when_file <- function(.d, file, .s = 60) {
  ## check file
  if (!okay_path(file)) {
    stop("Not a valid file", call. = FALSE)
  }
  do_when_(rlang::enquo(.d), rlang::quo(file.exists(file)), .s)
}

