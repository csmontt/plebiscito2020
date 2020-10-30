``` r
library(plebiscito2020)
library(dplyr)
#> Warning: package 'dplyr' was built under R version 3.6.3
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

``` r
circ_electoral_df <- circ_electoral("elecciones_constitucion")
head(circ_electoral_df)
#>   id_circ circ_electoral
#> 1    7103     AGUA SANTA
#> 2    7491          AISEN
#> 3    7140        ALAMEDA
#> 4    7610         ALERCE
#> 5    7122      ALGARROBO
#> 6    7218          ALHUE
```

``` r
mesas <- data.frame()
for(i in 1:nrow(circ_electoral_df)){ 
             res <- mesas_circ_electoral("elecciones_constitucion",
                                         circ_electoral_df[i,"id_circ"])
             mesas <- bind_rows(mesas, res)
        }
head(mesas)
#>    id_mesa mesa
#> 1 71030001   1M
#> 2 71030002   2M
#> 3 71030003   3M
#> 4 71030004   4M
#> 5 71030005   5M
#> 6 71030006   6M
```

``` r
resultado_mesa("elecciones_constitucion", 71030001)
#> $title
#> $title$a
#> [1] "Votación"
#> 
#> $title$b
#> [1] "Partido"
#> 
#> $title$c
#> [1] "Votos"
#> 
#> $title$d
#> [1] "Porcentaje"
#> 
#> $title$e
#> [1] "Candidatos"
#> 
#> $title$f
#> [1] "Opción Ganadora"
#> 
#> $title$sd
#> NULL
#> 
#> 
#> $isVisible
#> $isVisible$a
#> [1] "true"
#> 
#> $isVisible$b
#> [1] "false"
#> 
#> $isVisible$c
#> [1] "true"
#> 
#> $isVisible$d
#> [1] "true"
#> 
#> $isVisible$e
#> [1] "false"
#> 
#> $isVisible$f
#> [1] "true"
#> 
#> $isVisible$sd
#> NULL
#> 
#> 
#> $dataType
#> $dataType$a
#> [1] "String"
#> 
#> $dataType$b
#> [1] "String"
#> 
#> $dataType$c
#> [1] "Integer"
#> 
#> $dataType$d
#> [1] "Integer"
#> 
#> $dataType$e
#> [1] "Integer"
#> 
#> $dataType$f
#> [1] "Integer"
#> 
#> $dataType$sd
#> NULL
#> 
#> 
#> $data
#>         a        b  c      d  e f sd
#> 1 Apruebo EnBlanco 73 62,93% NA * NA
#> 2 Rechazo EnBlanco 43 37,07% NA   NA
#> 
#> $resumen
#>                      a  b   c       d  e  f sd
#> 1 Válidamente Emitidos NA 116 100,00% NA NA NA
#> 2          Votos Nulos NA   0   0,00% NA NA NA
#> 3      Votos en Blanco NA   0   0,00% NA NA NA
#> 4       Total Votación NA 116 100,00% NA NA NA
#> 
#> $colegioEscrutador
#> NULL
#> 
#> $labels
#> NULL
#> 
#> $mesasEscrutadas
#> NULL
#> 
#> $totalMesas
#> NULL
#> 
#> $totalMesasPorcent
#> NULL
#> 
#> $tipoGlosaComputo
#> NULL
#> 
#> $mostrarGlosaNominados
#> [1] TRUE
#> 
#> $tipoGlosaNominados
#> [1] "1"
```

``` r
resultado_mesa("elecciones_constitucion", 71030001)$data
#>         a        b  c      d  e f sd
#> 1 Apruebo EnBlanco 73 62,93% NA * NA
#> 2 Rechazo EnBlanco 43 37,07% NA   NA
```

``` r
resultado_mesa("elecciones_constitucion", 71030001)$resumen
#>                      a  b   c       d  e  f sd
#> 1 Válidamente Emitidos NA 116 100,00% NA NA NA
#> 2          Votos Nulos NA   0   0,00% NA NA NA
#> 3      Votos en Blanco NA   0   0,00% NA NA NA
#> 4       Total Votación NA 116 100,00% NA NA NA
```

``` r
resultado_mesa("elecciones_convencion", 71030001)$data
#>                                 a        b  c      d  e f sd
#> 1 Convención Mixta Constitucional EnBlanco 31 29,25% NA   NA
#> 2       Convención Constitucional EnBlanco 75 70,75% NA * NA
resultado_mesa("elecciones_convencion", 71030001)$resumen
#>                      a  b   c       d  e  f sd
#> 1 Válidamente Emitidos NA 106  91,38% NA NA NA
#> 2          Votos Nulos NA   8   6,90% NA NA NA
#> 3      Votos en Blanco NA   2   1,72% NA NA NA
#> 4       Total Votación NA 116 100,00% NA NA NA
```

Obtener el resultado de todas las mesas
---------------------------------------

``` r
sel_columnas <- function(resultado){
  sel <- resultado[, c("a","c")]
  names(sel) <- c("opcion", "votos")
  sel$votos <- as.numeric(sel$votos)
  return(sel)
}
```

``` r
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
#>     id_mesa  opcion votos
#> 1  71030001 Apruebo    73
#> 2  71030001 Rechazo    43
#> 3  71030002 Apruebo    64
#> 4  71030002 Rechazo    43
#> 5  71030003 Apruebo    76
#> 6  71030003 Rechazo    40
#> 7  71030004 Apruebo    81
#> 8  71030004 Rechazo    36
#> 9  71030005 Apruebo    93
#> 10 71030005 Rechazo    43
#> 11 71030006 Apruebo    89
#> 12 71030006 Rechazo    59
#> 13 71030007 Apruebo    96
#> 14 71030007 Rechazo    49
#> 15 71030008 Apruebo    92
#> 16 71030008 Rechazo    52
#> 17 71030009 Apruebo   116
#> 18 71030009 Rechazo    37
#> 19 71030010 Apruebo   110
#> 20 71030010 Rechazo    37
resultados$apruebp_rechazo_val
#>     id_mesa               opcion votos
#> 1  71030001 Válidamente Emitidos   116
#> 2  71030001          Votos Nulos     0
#> 3  71030001      Votos en Blanco     0
#> 4  71030001       Total Votación   116
#> 5  71030002 Válidamente Emitidos   107
#> 6  71030002          Votos Nulos     0
#> 7  71030002      Votos en Blanco     0
#> 8  71030002       Total Votación   107
#> 9  71030003 Válidamente Emitidos   116
#> 10 71030003          Votos Nulos     1
#> 11 71030003      Votos en Blanco     0
#> 12 71030003       Total Votación   117
#> 13 71030004 Válidamente Emitidos   117
#> 14 71030004          Votos Nulos     1
#> 15 71030004      Votos en Blanco     0
#> 16 71030004       Total Votación   118
#> 17 71030005 Válidamente Emitidos   136
#> 18 71030005          Votos Nulos    NA
#> 19 71030005      Votos en Blanco    NA
#> 20 71030005       Total Votación   136
#> 21 71030006 Válidamente Emitidos   148
#> 22 71030006          Votos Nulos     1
#> 23 71030006      Votos en Blanco     0
#> 24 71030006       Total Votación   149
#> 25 71030007 Válidamente Emitidos   145
#> 26 71030007          Votos Nulos     0
#> 27 71030007      Votos en Blanco     0
#> 28 71030007       Total Votación   145
#> 29 71030008 Válidamente Emitidos   144
#> 30 71030008          Votos Nulos     2
#> 31 71030008      Votos en Blanco     0
#> 32 71030008       Total Votación   146
#> 33 71030009 Válidamente Emitidos   153
#> 34 71030009          Votos Nulos     0
#> 35 71030009      Votos en Blanco     0
#> 36 71030009       Total Votación   153
#> 37 71030010 Válidamente Emitidos   147
#> 38 71030010          Votos Nulos     0
#> 39 71030010      Votos en Blanco     0
#> 40 71030010       Total Votación   147
```

### merge mesas con el resto de los niveles hasta tener las mesas por region!
