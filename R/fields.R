#' Fields
#'
#' @export
#' @inheritParams index
#' @param frame (character) A frame name. required
#' @param field (character) A field name. required
#' @param type (character) A type, only "int". required
#' @param min (integer) minimum value. required
#' @param max (integer) maximum value. required
#' @examples \dontrun{
#' # first, create an index
#' hirs_index_create("hello")
#' 
#' # then, create a frame
#' hirs_frame_create("hello", "world")
#' hirs_frame_delete("hello", "world")
#' 
#' # then, create a field
#' hirs_field_create(index="hello", frame="world", 
#'   field = "prs", type="int", min=0, max=100000L)
#' }
hirs_field_create <- function(index, frame, field, type = "int", 
  min, max, ...) {

  args <- comp(list(type = type, min = min, max = max))
  path <- file.path("index", index, "frame", frame, "field", field)
  hir_POST(path, body = args, ...)
}
