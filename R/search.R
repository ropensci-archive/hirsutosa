#' Search
#'
#' @export
#' @param index (character) A character vector of index names
#' @param body a named list passed to HTTP body
#' @param column_attrs column attributes
#' @param slices slices
#' @param raw If `TRUE` (default), data is parsed to list. If `FALSE`, 
#' then raw JSON.
#' @param ... Curl args passed on to [crul::HttpClient]
#' @references <https://www.pilosa.com/docs/latest/api-reference/>
#' @examples \dontrun{
#' index_search("repository", 'Bitmap(frame="language", rowID=5)')
#' index_search("repository", 'Bitmap(frame="language", rowID=5)', 
#'    columnAttrs = TRUE, slices = "0,1", verbose = TRUE)
#' index_search("repository", 'Count(Bitmap(frame="stargazer", rowID=10))')
#' 
#' # error
#' index_search("repository", 
#'   'Union(Bitmap(frame="stargazer", stargazer_id=1), Bitmap(frame="stargazer", stargazer_id=2))')
#' }
index_search <- function(index, body, column_attrs = NULL, slices = NULL, 
  raw = FALSE, ...) {

  args <- comp(list(columnAttrs = column_attrs, slices = slices))
  hir_POST(file.path("index", index, "query"), query = args, 
    body = body, ...)
}
