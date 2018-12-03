
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

okay_time <- function(x) {
  inherits(x, "POSIXct") && x > Sys.time()
}
