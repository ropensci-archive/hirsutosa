#' Get Pilosa version
#'
#' @export
#' @inheritParams index
#' @examples \dontrun{
#' hirs_version()
#' }
hirs_version <- function(raw = FALSE, ...) hir_GET("version", ...)
