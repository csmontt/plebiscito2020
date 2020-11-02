#' Función para obtener locales por circunscripción electoral
#'
#' @param eleccion eleccion para la cual se desea obtener las circunscripciones
#' electorales
#' @param id_circ_electoral id de circunscripción electoral para la cual
#' deseamos obtener sus locales
#' @export
#' @examples
#' locales_x_circ_electoral('elecciones_constitucion', 7122)

locales_x_circ_electoral <- function(eleccion = "elecciones_constitucion",
                           id_circ_electoral = 7122){
                  url = paste0("http://servelelecciones.cl/data/",
                        eleccion, "/filters/locales/bycirc_electoral/",
                        id_circ_electoral,".json")
                  resultado = obtener_json(url)#[,c(1,3)]
                  names(resultado) <- c("id_local", "nombre_local")
                  resultado
}
