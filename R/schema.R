#' Get schema
#'
#' @export
#' @inheritParams index
#' @examples \dontrun{
#' hirs_schema()
#' }
hirs_schema <- function(raw = FALSE, ...) {
  hir_GET("schema", ...)
}
