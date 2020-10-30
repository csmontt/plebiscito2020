#' Función para obtener las circunscripciones electorales
#'
#' @param eleccion eleccion para la cual se desea obtener las circunscripciones
#' electorales
#' @export
#' @examples
#' circ_electoral('elecciones_constitucion')
#' circ_electoral('elecciones_convencion')

circ_electoral <- function(eleccion = "elecciones_constitucion"){
        url = paste0("http://servelelecciones.cl/data/",
                        eleccion, "/filters/",
                        "circ_electoral","/allchile.json")
        resultado = obtener_json(url)
        names(resultado) <- c("id_circ", "circ_electoral")
        return(resultado)
}
