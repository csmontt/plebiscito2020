#' Función para obtener las comunas por region
#'
#' @param eleccion eleccion para la cual se desea obtener las circunscripciones
#' electorales
#' @param id_region id de región para la cual deseamos obtener sus comunas
#' @export
#' @examples
#' comunas_x_region('elecciones_constitucion', '3015')

comunas_x_region <- function(eleccion = "elecciones_constitucion",
                           id_region = 3015){
                  url = paste0("http://pv.servelelecciones.cl/data/",
                        eleccion, "/filters/comunas/byregion/",id_region,".json")
                  resultado = obtener_json(url)
                  names(resultado) <- c("id_comuna", "nombre_comuna")
                  resultado
}






