#' Función para obtener las regiones
#'
#' @param eleccion eleccion para la cual se desea obtener las comunas
#' @export
#' @examples
#' regiones('elecciones_constitucion')

regiones <- function(eleccion = "elecciones_constitucion"){
        url = paste0("http://servelelecciones.cl/data/",
                        eleccion, "/filters/",
                        "regiones","/all.json")
        resultado = obtener_json(url)
        names(resultado) <- c("id_region", "nombre_region")
        return(resultado)
}
