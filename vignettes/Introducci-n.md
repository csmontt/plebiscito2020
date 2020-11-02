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

Accediendo a los datos
======================

``` r
head(constitucion)
#>   id_region         nombre_region id_comuna nombre_comuna id_circ_electoral
#> 1      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 2      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 3      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 4      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 5      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 6      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#>   nombre_circ_electoral id_local     nombre_local  id_mesa nombre_mesa  opcion
#> 1                 ARICA     2985 COLEGIO DEL ALBA 70011235   235V-236V Apruebo
#> 2                 ARICA     2985 COLEGIO DEL ALBA 70011235   235V-236V Rechazo
#> 3                 ARICA     2985 COLEGIO DEL ALBA 70011237   237V-238V Apruebo
#> 4                 ARICA     2985 COLEGIO DEL ALBA 70011237   237V-238V Rechazo
#> 5                 ARICA     2985 COLEGIO DEL ALBA 70011239   239V-240V Apruebo
#> 6                 ARICA     2985 COLEGIO DEL ALBA 70011239   239V-240V Rechazo
#>   votos
#> 1   141
#> 2    37
#> 3   147
#> 4    40
#> 5   146
#> 6    42
```

Agregación datos usando `dplyr`
-------------------------------

``` r
constitucion %>% group_by(opcion) %>% summarize(total_votos = sum(votos, na.rm = TRUE))
#> `summarise()` ungrouping output (override with `.groups` argument)
#> # A tibble: 2 x 2
#>   opcion  total_votos
#>   <chr>         <dbl>
#> 1 Apruebo     5861090
#> 2 Rechazo     1628609
```

``` r
constitucion %>% group_by(nombre_comuna, opcion) %>% summarize(total_votos = sum(votos, na.rm = TRUE))
#> `summarise()` regrouping output by 'nombre_comuna' (override with `.groups` argument)
#> # A tibble: 692 x 3
#> # Groups:   nombre_comuna [346]
#>    nombre_comuna   opcion  total_votos
#>    <chr>           <chr>         <dbl>
#>  1 ALGARROBO       Apruebo        4932
#>  2 ALGARROBO       Rechazo        2118
#>  3 ALHUE           Apruebo        2323
#>  4 ALHUE           Rechazo         309
#>  5 ALTO BIOBIO     Apruebo        1269
#>  6 ALTO BIOBIO     Rechazo         424
#>  7 ALTO DEL CARMEN Apruebo        1559
#>  8 ALTO DEL CARMEN Rechazo         241
#>  9 ALTO HOSPICIO   Apruebo       21373
#> 10 ALTO HOSPICIO   Rechazo        4608
#> # ... with 682 more rows
```

``` r
head(tipo_de_organo)
#>   id_region         nombre_region id_comuna nombre_comuna id_circ_electoral
#> 1      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 2      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 3      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 4      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 5      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#> 6      3015 DE ARICA Y PARINACOTA      2822         ARICA              7001
#>   nombre_circ_electoral id_local     nombre_local  id_mesa nombre_mesa
#> 1                 ARICA     2985 COLEGIO DEL ALBA 70011235   235V-236V
#> 2                 ARICA     2985 COLEGIO DEL ALBA 70011235   235V-236V
#> 3                 ARICA     2985 COLEGIO DEL ALBA 70011237   237V-238V
#> 4                 ARICA     2985 COLEGIO DEL ALBA 70011237   237V-238V
#> 5                 ARICA     2985 COLEGIO DEL ALBA 70011239   239V-240V
#> 6                 ARICA     2985 COLEGIO DEL ALBA 70011239   239V-240V
#>                            opcion votos
#> 1 Convención Mixta Constitucional    28
#> 2       Convención Constitucional   141
#> 3 Convención Mixta Constitucional    36
#> 4       Convención Constitucional   142
#> 5 Convención Mixta Constitucional    30
#> 6       Convención Constitucional   139
```

``` r
tipo_de_organo %>% group_by(opcion) %>% summarize(total_votos = sum(votos, na.rm = TRUE))
#> `summarise()` ungrouping output (override with `.groups` argument)
#> # A tibble: 2 x 2
#>   opcion                          total_votos
#>   <chr>                                 <dbl>
#> 1 Convención Constitucional           5621836
#> 2 Convención Mixta Constitucional     1496492
```

``` r
tipo_de_organo %>% group_by(nombre_comuna, opcion) %>% summarize(total_votos = sum(votos, na.rm = TRUE))
#> `summarise()` regrouping output by 'nombre_comuna' (override with `.groups` argument)
#> # A tibble: 692 x 3
#> # Groups:   nombre_comuna [346]
#>    nombre_comuna   opcion                          total_votos
#>    <chr>           <chr>                                 <dbl>
#>  1 ALGARROBO       Convención Constitucional              4754
#>  2 ALGARROBO       Convención Mixta Constitucional        1856
#>  3 ALHUE           Convención Constitucional              2158
#>  4 ALHUE           Convención Mixta Constitucional         406
#>  5 ALTO BIOBIO     Convención Constitucional              1131
#>  6 ALTO BIOBIO     Convención Mixta Constitucional         424
#>  7 ALTO DEL CARMEN Convención Constitucional              1465
#>  8 ALTO DEL CARMEN Convención Mixta Constitucional         278
#>  9 ALTO HOSPICIO   Convención Constitucional             20247
#> 10 ALTO HOSPICIO   Convención Mixta Constitucional        4663
#> # ... with 682 more rows
```

### Construyendo la base de datos

``` r
circ_electoral_df <- circ_electoral("elecciones_constitucion")
head(circ_electoral_df)
#>   id_circ_electoral nombre_circ_electoral
#> 1              7103            AGUA SANTA
#> 2              7491                 AISEN
#> 3              7140               ALAMEDA
#> 4              7610                ALERCE
#> 5              7122             ALGARROBO
#> 6              7218                 ALHUE
```

``` r
mesas_df <- data.frame()
for(i in 1:nrow(circ_electoral_df)){ 
             res <- mesas_circ_electoral("elecciones_constitucion",
                                       circ_electoral_df[i,"id_circ_electoral"])
             mesas_df <- bind_rows(mesas_df, res)
        }
head(mesas_df)
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
id_mesas <- mesas$id_mesa
datos_mesas_con <-  data.frame()
datos_mesas_con_val <-  data.frame()
datos_mesas_org <-  data.frame()
datos_mesas_org_val <-  data.frame()
for(i in 1:5){   #solo las 5 priemras mesas
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
#> 1  70011235 Apruebo   141
#> 2  70011235 Rechazo    37
#> 3  70011237 Apruebo   147
#> 4  70011237 Rechazo    40
#> 5  70011239 Apruebo   146
#> 6  70011239 Rechazo    42
#> 7  70011241 Apruebo   132
#> 8  70011241 Rechazo    57
#> 9  70011243 Apruebo   139
#> 10 70011243 Rechazo    47
resultados$apruebp_rechazo_val
#>     id_mesa               opcion votos
#> 1  70011235 Válidamente Emitidos   178
#> 2  70011235          Votos Nulos     1
#> 3  70011235      Votos en Blanco    NA
#> 4  70011235       Total Votación   179
#> 5  70011237 Válidamente Emitidos   187
#> 6  70011237          Votos Nulos     1
#> 7  70011237      Votos en Blanco     0
#> 8  70011237       Total Votación   188
#> 9  70011239 Válidamente Emitidos   188
#> 10 70011239          Votos Nulos     0
#> 11 70011239      Votos en Blanco     0
#> 12 70011239       Total Votación   188
#> 13 70011241 Válidamente Emitidos   189
#> 14 70011241          Votos Nulos     2
#> 15 70011241      Votos en Blanco    NA
#> 16 70011241       Total Votación   191
#> 17 70011243 Válidamente Emitidos   186
#> 18 70011243          Votos Nulos     2
#> 19 70011243      Votos en Blanco     0
#> 20 70011243       Total Votación   188
resultados$tipo_organo
#>     id_mesa                          opcion votos
#> 1  70011235 Convención Mixta Constitucional    28
#> 2  70011235       Convención Constitucional   141
#> 3  70011237 Convención Mixta Constitucional    36
#> 4  70011237       Convención Constitucional   142
#> 5  70011239 Convención Mixta Constitucional    30
#> 6  70011239       Convención Constitucional   139
#> 7  70011241 Convención Mixta Constitucional    38
#> 8  70011241       Convención Constitucional   134
#> 9  70011243 Convención Mixta Constitucional    38
#> 10 70011243       Convención Constitucional   137
resultados$tipo_organo_val
#>     id_mesa               opcion votos
#> 1  70011235 Válidamente Emitidos   169
#> 2  70011235          Votos Nulos     6
#> 3  70011235      Votos en Blanco     4
#> 4  70011235       Total Votación   179
#> 5  70011237 Válidamente Emitidos   178
#> 6  70011237          Votos Nulos     8
#> 7  70011237      Votos en Blanco     2
#> 8  70011237       Total Votación   188
#> 9  70011239 Válidamente Emitidos   169
#> 10 70011239          Votos Nulos    17
#> 11 70011239      Votos en Blanco     2
#> 12 70011239       Total Votación   188
#> 13 70011241 Válidamente Emitidos   172
#> 14 70011241          Votos Nulos    14
#> 15 70011241      Votos en Blanco     5
#> 16 70011241       Total Votación   191
#> 17 70011243 Válidamente Emitidos   175
#> 18 70011243          Votos Nulos    12
#> 19 70011243      Votos en Blanco     1
#> 20 70011243       Total Votación   188
```
