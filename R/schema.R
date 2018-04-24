#' Get schema
#'
#' @export
#' @inheritParams index
#' @examples \dontrun{
#' hirs_schema()
#' }
hirs_schema <- function(...) {
  hir_GET("schema", ...)
}
