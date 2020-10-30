#' Función para obtener los resultados de una mesa de votación
#'
#' @param eleccion elección para la cual se desea obtener las circunscripciones
#' electorales
#' @param id_circ_elect id de circunscripción electoral
#' @export
#' @examples
#' mesas_circ_electoral('elecciones_constitucion', 7479)
#'

resultado_mesa <- function(eleccion = "elecciones_constitucion",
                           id_mesa = "70071112"){
                  url = paste0("http://servelelecciones.cl/data/",
                        eleccion, "/computomesas/",
                        id_mesa,".json")
                  resultado = obtener_json(url)
                  resultado
}