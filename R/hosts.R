#' List hosts
#'
#' @export
#' @inheritParams index
#' @examples \dontrun{
#' hirs_hosts()
#' }
hirs_hosts <- function(raw = FALSE, ...) hir_GET("hosts", ...)
