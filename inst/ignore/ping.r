#' Ping an Elasticsearch server.
#'
#' @export
#' @param ... Curl args passed on to [crul::HttpClient]
#' @seealso [connect()]
#' @examples \dontrun{
#' ping()
#' }
ping <- function(...) { 
  hir_GET(make_url(es_get_auth()), ...)
}
