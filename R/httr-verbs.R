# url <- make_url()
pilosa_url <- "http://localhost:10101"

catch_err <- function(x) {
  if (x$status_code > 201) {
    mssg <- jsonlite::fromJSON(x$parse("UTF-8"))$error
    stop("pilosa error: ", mssg)
  }
}

# verbs
hir_GET <- function(path, query = list(), ...) {
  cli <- crul::HttpClient$new(pilosa_url, opts = list(...))
  tt <- cli$get(path, query = query)
  catch_err(tt)
  jsonlite::fromJSON(tt$parse("UTF-8"))
}

hir_POST <- function(path, query = list(), body = list(), ...) {
  cli <- crul::HttpClient$new(pilosa_url, opts = list(...))
  tt <- cli$post(path, query = query, body = body)
  catch_err(tt)
  jsonlite::fromJSON(tt$parse("UTF-8"))
}

hir_DELETE <- function(path, ...) {  
  cli <- crul::HttpClient$new(pilosa_url, opts = list(...))
  tt <- cli$delete(path)
  catch_err(tt)
  jsonlite::fromJSON(tt$parse("UTF-8"))
}
