#' Index operations
#'
#' @export
#' @name index
#' @param index (character) A character vector of index names
#' @param raw If `TRUE` (default), data is parsed to list. If `FALSE`, 
#' then raw JSON.
#' @param ... Curl args passed on to [crul::HttpClient]
#' @references <>
#' @examples \dontrun{
#' hirs_index_get()
#' hirs_index_create("foobar")
#' hirs_index_delete("foobar")
#' }
hirs_index_get <- function(index = NULL, raw = FALSE, ...) {
  hir_GET("index", ...)
}

#' @export
#' @rdname index
hirs_index_create <- function(index, raw = FALSE, ...) {
  hir_POST(file.path("index", index), ...)
}

#' @export
#' @rdname index
hirs_index_delete <- function(index, raw = FALSE, ...) {
  hir_DELETE(file.path("index", index), ...)
}
