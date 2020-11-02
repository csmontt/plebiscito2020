#' Función para obtener las comunas
#'
#' @param eleccion eleccion para la cual se desea obtener las comunas
#' @export
#' @examples
#' comunas('elecciones_constitucion')

comunas <- function(eleccion = "elecciones_constitucion"){
        url = paste0("http://servelelecciones.cl/data/",
                        eleccion, "/filters/",
                        "comunas","/all.json")
        resultado = obtener_json(url)
        names(resultado) <- c("id_comuna", "nombre_comuna")
        return(resultado)
}
