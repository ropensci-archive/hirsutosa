#' Frame operations
#'
#' @export
#' @name frame
#' @inheritParams index
#' @param frame (character) A frame name
#' @param time_quantum (character) Time Quantum for this frame
#' @param inverse_enabled (logical) Enables the inverted view for 
#' this frame if `TRUE`
#' @param cache_type (character) ranked or LRU caching on this frame. 
#' Default: "lru"
#' @param cache_size (integer) Number of rows to keep in the cache. 
#' Default: 50,000
#' @param range_enabled (logical) Enables range-encoded fields in 
#' this frame  
#' @param fields (character) character vector of range-encoded fields
#' @examples \dontrun{
#' # first, create an index
#' hirs_index_create("hello")
#' 
#' # then, create a frame
#' hirs_frame_create("hello", "world")
#' hirs_frame_delete("hello", "world")
#' 
#' # update frame time quantum
#' hirs_frame_create("hello", "world")
#' hirs_frame_updatetq("hello", "world", time_quantum = "MD")
#' }

#' @export
#' @rdname frame
hirs_frame_create <- function(index, frame, time_quantum = NULL, 
  inverse_enabled = NULL, cache_type = "lru", cache_size = 50000L, 
  range_enabled = NULL, fields = NULL, ...) {

  args <- list(options = comp(list(timeQuantum = time_quantum, 
    inverseEnabled = inverse_enabled, cacheType = cache_type, 
    cacheSize = cache_size, rangeEnabled = range_enabled, 
    fields = fields)))
  hir_POST(file.path("index", index, "frame", frame), 
    body = args, ...)
}

#' @export
#' @rdname frame
hirs_frame_delete <- function(index, frame, ...) {
  hir_DELETE(file.path("index", index, "frame", frame), ...)
}

#' @export
#' @rdname frame
hirs_frame_updatetq <- function(index, frame, time_quantum, ...) {
  stopifnot(is.character(time_quantum))
  body <- list(timeQuantum = time_quantum)
  hir_POST(file.path("index", index, "frame", frame, "time-quantum"), 
    body = body, ...)
}
