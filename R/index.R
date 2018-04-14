#' Index API operations
#'
#' @export
#' @name index
#' @param index (character) A character vector of index names
#' @param raw If `TRUE` (default), data is parsed to list. If `FALSE`, 
#' then raw JSON.
#' @param ... Curl args passed on to [crul::HttpClient]
#' @references <>
#' @author Scott Chamberlain <myrmecocystus@@gmail.com>
#' @examples \dontrun{
#' index_get()
#' index_create("foobar")
#' index_delete("foobar")
#' }
index_get <- function(index = NULL, raw = FALSE, ...) {
  hir_GET("index", ...)
}

#' @export
#' @rdname index
index_create <- function(index, raw = FALSE, ...) {
  hir_POST(file.path("index", index), ...)
}

#' @export
#' @rdname index
index_delete <- function(index, raw = FALSE, ...) {
  hir_DELETE(file.path("index", index), ...)
}
