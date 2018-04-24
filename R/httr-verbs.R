# url <- make_url()
pilosa_url <- "http://localhost:10101"

catch_err <- function(x) {
  if (x$status_code > 201) {
    txt <- x$parse("UTF-8")
    tjson <- tryCatch(jsonlite::fromJSON(txt), error = function(e) e)
    if (inherits(tjson, "error")) {
      mssg <- txt
    } else {
      mssg <- jsonlite::fromJSON(txt)$error
    }
    stop("pilosa error: ", mssg)
  }
}

# verbs
hir_GET <- function(path, query = list(), parse = TRUE, ...) {
  cli <- crul::HttpClient$new(pilosa_url, opts = list(...))
  tt <- cli$get(path, query = query)
  catch_err(tt)
  jsonlite::fromJSON(tt$parse("UTF-8"), parse)
}

hir_POST <- function(path, query = list(), body = c(), parse = TRUE, ...) {
  cli <- crul::HttpClient$new(pilosa_url, opts = list(...))
  if (length(body) == 0 || nchar(body) == 0) body <- ""
  tt <- cli$post(path, query = query, body = body, encode = "json")
  catch_err(tt)
  jsonlite::fromJSON(tt$parse("UTF-8"), parse)
}

hir_PATCH <- function(path, query = list(), body = c(), parse = TRUE, ...) {
  cli <- crul::HttpClient$new(pilosa_url, opts = list(...))
  tt <- cli$patch(path, query = query, body = body, encode = "json")
  catch_err(tt)
  jsonlite::fromJSON(tt$parse("UTF-8"), parse)
}

hir_DELETE <- function(path, parse = TRUE, ...) {  
  cli <- crul::HttpClient$new(pilosa_url, opts = list(...))
  tt <- cli$delete(path)
  catch_err(tt)
  jsonlite::fromJSON(tt$parse("UTF-8"), parse)
}
