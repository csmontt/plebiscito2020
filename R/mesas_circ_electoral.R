#' Función para obtener las mesas de votación de una circunscripción electoral
#'
#' @param eleccion elección para la cual se desea obtener las mesas
#' @param id_circ_elect id de circunscripción electoral
#' @export
#' @examples
#' mesas_circ_electoral('elecciones_constitucion', 7479)
#'
mesas_circ_electoral <- function(eleccion = "elecciones_constitucion",
                                 id_circ_elect = "7479"){
        url = paste0("http://servelelecciones.cl/data/", eleccion,
                     "/filters/", "mesas/bycirc_electoral/",
                     id_circ_elect, ".json")
        resultado = obtener_json(url)[,1:2]
        names(resultado) <- c("id_mesa", "mesa")
        return(resultado)

}
