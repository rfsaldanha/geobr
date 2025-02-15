#' Download spatial data of Brazil's Legal Amazon
#'
#' @description
#' This data set covers the whole of Brazil's Legal Amazon as defined in the
#' federal law n. 12.651/2012). The original data comes from the Brazilian
#' Ministry of Environment (MMA) and can be found at "http://mapas.mma.gov.br/i3geo/datadownload.htm".
#'
#' @param year A date number in YYYY format. Defaults to `2012`
#' @param simplified Logic `FALSE` or `TRUE`, indicating whether the function
#' returns the data set with original' resolution or a data set with 'simplified'
#' borders. Defaults to `TRUE`. For spatial analysis and statistics users should
#' set `simplified = FALSE`. Borders have been simplified by removing vertices of
#' borders using `sf::st_simplify()` preserving topology with a `dTolerance` of 100.
#' @param showProgress Logical. Defaults to `TRUE` display progress bar
#'
#' @return An `"sf" "data.frame"` object
#'
#' @export
#' @family general area functions
#' @examples \dontrun{ if (interactive()) {
#' # Read Brazilian Legal Amazon
#' a <- read_amazon(year = 2012)
#'}}
read_amazon <- function(year=2012, simplified=TRUE, showProgress=TRUE){

  # Get metadata with data url addresses
  temp_meta <- select_metadata(geography="amazonia_legal", year=year, simplified=simplified)

  # # check if download failed
  # if (is.null(temp_meta)) { return(invisible(NULL)) }

  # list paths of files to download
  file_url <- as.character(temp_meta$download_path)

  # download files
  temp_sf <- download_gpkg(file_url, progress_bar = showProgress)
  return(temp_sf)
}
