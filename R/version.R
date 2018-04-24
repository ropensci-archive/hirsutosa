#' Get Pilosa version
#'
#' @export
#' @inheritParams index
#' @examples \dontrun{
#' hirs_version()
#' }
hirs_version <- function(...) hir_GET("version", ...)
