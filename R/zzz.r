comp <- function(l) Filter(Negate(is.null), l)

as_log <- function(x){
  if (is.null(x)) {
    x
  } else {
    if (x) 'true' else 'false'
  }
}

`%|||%` <- function(x, y) if (x == "false") y else x

cl <- function(x) if (is.null(x)) NULL else paste0(x, collapse = ",")

cw <- function(x) if (is.null(x)) x else paste(x, collapse = ",")

esc <- function(x) {
  if (is.null(x)) {
    NULL
  } else {
    curl::curl_escape(x)
  }
}

pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

# make_up <- function() {
#   up <- es_get_user_pwd()
#   if (nchar(up$user) != 0 && nchar(up$pwd) != 0) {
#     authenticate(up$user, up$pwd)
#   } else {
#     list()
#   }
# }

strmatch <- function(x, y) regmatches(x, regexpr(y, x))

strloc2match <- function(x, first, y) substring(x, first, regexpr(y, x) - 1)

prune_trailing_slash <- function(x) {
  gsub("\\/$", "", x)
}

extractr <- function(x, y) regmatches(x, gregexpr(y, x))

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}

# checkconn <- function(...) {
#   res <- tryCatch(HEAD(make_url(es_get_auth()), make_up(), es_env$headers, ...), error = function(e) e)
#   if (inherits(res, "error")) {
#     stop("Check your connection, server may be down, url or port incorrect, or authentication wrong", call. = FALSE)
#   }
# }
