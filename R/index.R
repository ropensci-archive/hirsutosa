#' Index operations
#'
#' @export
#' @name index
#' @param index (character) A character vector of index names
#' @param ... Curl args passed on to [crul::HttpClient]
#' @references <https://www.pilosa.com/docs/latest/api-reference/>
#' @examples \dontrun{
#' hirs_index_get()
#' hirs_index_create("foobar")
#' hirs_index_delete("foobar")
#' }
hirs_index_get <- function(index = NULL, ...) {
  tmp <- hir_GET("index", parse = FALSE)
  structure(tmp, class = "pilosa_index")
}

#' @export
#' @rdname index
hirs_index_create <- function(index, ...) {
  hir_POST(file.path("index", index), ...)
}

#' @export
#' @rdname index
hirs_index_delete <- function(index, ...) {
  hir_DELETE(file.path("index", index), ...)
}

#' @export
print.pilosa_index <- function(x, ...) {
  cat("<pilosa indexes>", sep = "\n")
  lapply(x$indexes, function(z) {
    cat(" index:", z$name, "\n")
    if (!is.null(z$frames)) {
      cat("  frames:", "\n")
      lapply(z$frames, function(w) {
        cat("   ", w$name, "\n")
        cat("      views (n):", length(w$views), "\n")
      })
    } else {
      cat("  frames: none", "\n")
    }
  })
}
