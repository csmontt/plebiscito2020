#' Función para obtener los resultados de una mesa de votación
#'
#' @param eleccion elección para la cual se desea obtener las circunscripciones
#' electorales
#' @param id_circ_elect id de circunscripción electoral
#' @export
#' @examples
#' resultado_mesa('elecciones_constitucion', 7479)
#'

resultado_mesa <- function(eleccion = "elecciones_constitucion",
                           id_mesa = 70071112){
                  url = paste0("http://pv.servelelecciones.cl/data/",
                        eleccion, "/computomesas/",id_mesa,".json")
                  resultado = obtener_json(url)
                  resultado
}
