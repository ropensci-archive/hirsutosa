#' List hosts
#'
#' @export
#' @inheritParams index
#' @examples \dontrun{
#' hirs_hosts()
#' }
hirs_hosts <- function(...) hir_GET("hosts", ...)
