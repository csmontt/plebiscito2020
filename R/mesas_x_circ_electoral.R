#' Función para obtener las mesas por circunscripción electoral
#'
#' @param eleccion eleccion para la cual se desea obtener las circunscripciones
#' electorales
#' @param id_circ_electoral id de circunscripción electoral para la cual
#' deseamos obtener sus mesas
#' @export
#' @examples
#' mesas_x_circ_electoral('elecciones_constitucion', 7122)

mesas_x_circ_electoral <- function(eleccion = "elecciones_constitucion",
                           id_circ_electoral = 7122){
                  url = paste0("http://pv.servelelecciones.cl/data/",
                        eleccion, "/filters/mesas/bycirc_electoral/",
                        id_circ_electoral,".json")
                  resultado = obtener_json(url)[,1:2]
                  names(resultado) <- c("id_mesa", "nombre_mesa")
                  resultado
}
