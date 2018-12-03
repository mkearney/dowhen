
#' Do when a time happens
#'
#' Process an expression once a time is reached.
#'
#' @param time A date-time specifying when \code{.d} should be done.
#' @inheritParams do_when
#' @export
do_when_time <- function(.d, time, .s = 60) {
  ## check time
  if (is.character(time)) {
    time <- as.POSIXct(time, origin = "1970-01-01")
  }
  if (!okay_time(time)) {
    stop("Not a valid time", call. = FALSE)
  }
  do_when_(rlang::enquo(.d), rlang::quo(Sys.time() > time), .s)
}
