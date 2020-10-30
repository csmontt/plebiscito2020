## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(plebiscito2020)
library(dplyr)

## -----------------------------------------------------------------------------
circ_electoral_df <- circ_electoral("elecciones_constitucion")
head(circ_electoral_df)

## -----------------------------------------------------------------------------
mesas <- data.frame()
for(i in 1:nrow(circ_electoral_df)){ 
             res <- mesas_circ_electoral("elecciones_constitucion",
                                         circ_electoral_df[i,"id_circ"])
             mesas <- bind_rows(mesas, res)
        }
head(mesas)

## -----------------------------------------------------------------------------
resultado_mesa("elecciones_constitucion", 71030001)

## -----------------------------------------------------------------------------
resultado_mesa("elecciones_constitucion", 71030001)$data

## -----------------------------------------------------------------------------
resultado_mesa("elecciones_constitucion", 71030001)$resumen

## -----------------------------------------------------------------------------
resultado_mesa("elecciones_convencion", 71030001)$data
resultado_mesa("elecciones_convencion", 71030001)$resumen

## -----------------------------------------------------------------------------
sel_columnas <- function(resultado){
  sel <- resultado[, c("a","c")]
  names(sel) <- c("opcion", "votos")
  sel$votos <- as.numeric(sel$votos)
  return(sel)
}

## -----------------------------------------------------------------------------
id_mesas <- mesas$id_mesa[1:10]
datos_mesas_con <-  data.frame()
datos_mesas_con_val <-  data.frame()
datos_mesas_org <-  data.frame()
datos_mesas_org_val <-  data.frame()
for(i in 1:length(id_mesas)){  
  mesa <- id_mesas[i]
  res_mesa  <- sel_columnas(resultado_mesa("elecciones_constitucion", mesa)$data)
  res_mesa <- cbind(id_mesa = mesa, res_mesa)
  datos_mesas_con <- bind_rows(datos_mesas_con, res_mesa)
  
  res_mesa  <- sel_columnas(resultado_mesa("elecciones_constitucion", mesa)$resumen)
  res_mesa <- cbind(id_mesa = mesa, res_mesa)
  datos_mesas_con_val <- bind_rows(datos_mesas_con_val, res_mesa)
  
  res_mesa  <- sel_columnas(resultado_mesa("elecciones_convencion", mesa)$data)
  res_mesa <- cbind(id_mesa = mesa, res_mesa)
  datos_mesas_org <- bind_rows(datos_mesas_org, res_mesa)
  
  res_mesa  <- sel_columnas(resultado_mesa("elecciones_convencion", mesa)$resumen)
  res_mesa <- cbind(id_mesa = mesa, res_mesa)
  datos_mesas_org_val <- bind_rows(datos_mesas_org_val, res_mesa)
  
}      
resultados <- list(apruebo_rechazo = datos_mesas_con,
                   apruebp_rechazo_val = datos_mesas_con_val,
                   tipo_organo = datos_mesas_org, 
                   tipo_organo_val = datos_mesas_org_val)

resultados$apruebo_rechazo


