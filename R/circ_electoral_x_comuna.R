#' Función para obtener las circunscripción electoral por comuna
#'
#' @param eleccion eleccion para la cual se desea obtener las circunscripciones
#' electorales
#' @param id_comuna id de comuna para la cual deseamos obtener sus
#' circunscripciones electorales
#' @export
#' @examples
#' circ_electoral_x_comuna('elecciones_constitucion', 2637)

circ_electoral_x_comuna <- function(eleccion = "elecciones_constitucion",
                           id_comuna = 2637){
                  url = paste0("http://servelelecciones.cl/data/",
                        eleccion, "/filters/circ_electoral/bycomuna/",
                        id_comuna,".json")
                  resultado = obtener_json(url)
                  names(resultado) <- c("id_circ_electoral", "nombre_circ_electoral")
                  resultado
}
