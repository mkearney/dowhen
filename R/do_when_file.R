
#' Do when a file exists
#'
#' Process an expression once a file exists.
#'
#' @param file Name of file on which to trigger expression \code{.f}
#' @param expression A formula where the file name provided with \code{file} is
#'   assigned as either ".x" or "file."
#' @param wait_time Time in seconds to wait between checking for file existence.
#'   The default is to wait 60 seconds between checking for a file.
#' @return The output of the supplied expression \code{.f}
#' @export
do_when_file <- function(file_name, .f, wait_time = 60) {
  ## validate inputs
  stopifnot(
    okay_path(file_name),
    is_formula(.f),
    is.numeric(wait_time)
  )

  ## keep checking condition
  keep_going <- TRUE

  while (keep_going) {
    ## if file doesn't exist, wait a minute and check again
    if (!file.exists(file_name)) {
      tfse::print_start("Waiting ", wait_time, " seconds")
      Sys.sleep(wait_time)
      next
    }
    tfse::print_complete("Found it!")
    assign(".x", file_name, envir = environment())
    x <- eval(.f[[2]], envir = environment())
    break
  }
  x
}

is_formula <- function(x) inherits(x, "formula")

dir_name <- function(path, pos = 1) {
  for (i in seq_len(abs(pos))) {
    path <- dirname(path)
    if (identical(path, "/")) return(character())
  }
  path
}

okay_path <- function(x) {
  d <- lapply(1:5, function(.x) dir_name(x, .x))
  d <- d[lengths(d) > 0]
  any(vapply(d, dir.exists, logical(1)))
}
