#' Función para obtener mesas por locales de votacion
#'
#' @param eleccion eleccion para la cual se desea obtener las mesas
#' @param id_local id de circunscripción electoral para la cual
#' deseamos obtener sus locales
#' @export
#' @examples
#' mesas_x_locales('elecciones_constitucion', 2847)

mesas_x_locales <- function(eleccion = "elecciones_constitucion",
                           id_local = 2987){
                  url = paste0("http://pv.servelelecciones.cl/data/",
                        eleccion, "/filters/mesas/bylocales/",
                        id_local,".json")
                  resultado = obtener_json(url)#[,c(1,3)]
                  names(resultado) <- c("id_mesa", "nombre_mesa")
                  resultado
}
