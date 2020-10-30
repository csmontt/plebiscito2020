#' Función para obtener JSON desde url
#'
#' @param url url de http://servelelecciones.cl correspondiente a un archivo JSON
#' @import jsonlite
#' @export
#' @examples
#' obtener_json('http://servelelecciones.cl/data/elecciones_constitucion/computomesas/70071112.json')

obtener_json <- function(url){
        jsonlite::fromJSON(url)
}
