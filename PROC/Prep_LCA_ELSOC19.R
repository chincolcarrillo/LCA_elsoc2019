### Codigo Preparacion ELSOC 2019 ###
### Para proyecto de Ciencia Social Abierta 2021, FACSO UChile ###
### Por Carolina Carrillo ###
### 02-09-21 ###

# ---- 0. Cargar librerias y otras configuraciones ----
#install.packages("pacman")
#library(pacman)
pacman::p_load(dplyr,
               summarytools,
               skimr,
               sjPlot)

remove(list = ls()) #limpieza del entorno de trabajo
options(scipen=999) #evita notacion cientifica

# ---- 1. Preparacion de datos ----
load(url("https://dataverse.harvard.edu/api/access/datafile/4606527")) 
# link permanente de acceso a la base de datos, metadata disponible en el repositorio

elsoc_wide_2016_2019[elsoc_wide_2016_2019=="-999"] <- NA
elsoc_wide_2016_2019[elsoc_wide_2016_2019=="-888"] <- NA

elsoc_wide_filtrada <- elsoc_wide_2016_2019 %>% 
  dplyr::filter(tipo_atricion !=2 & tipo_atricion !=5 & tipo_atricion !=6 & tipo_atricion !=8 
                & tipo_atricion !=9 & tipo_atricion !=11 & tipo_caso !=2) #filtrar atricion 2019 y casos c/inconsistencias mayores

elsoc19 <- elsoc_wide_filtrada %>% dplyr::select(f05_03_w04, #carabineros: marcha pacifica
                                                  f05_04_w04, #carabineros: toma liceo
                                                  f05_06_w04, #trabajadores: barricada en huelga
                                                  f05_07_w04, #estudiantes: apedrear pacos
                                                  f05_09_w04, #protestantes: danar prop. publica
                                                  f05_10_w04, #protestantes: danar transporte
                                                  f05_11_w04, #protestantes: danar comercio
                                                  f07_01_w04, #accion contenciosa: situacion critica
                                                  f07_02_w04, #accion contenciosa: unica alternativa
                                                  m0_sexo_w04,
                                                  m0_edad_w04,
                                                  m01_w04, #ocupacion
                                                  m02_w04, #educacion
                                                  m13_w04, #ingreso (n)
                                                  m14_w04, #ingreso (tramo)
                                                  m29_w04, #ingreso hogar (n)
                                                  m30_w04, #ingreso hogar (tramo)
                                                  ponderador01_w04,
                                                  ponderador02_w04,
                                                  fact_exp01_w04,
                                                  fact_exp02_w04)
skim(elsoc19)
#estan todas como numeric
#cerca de 100 casos perdidos por variable excepto en ingresos

# ---- 2. Valores y etiquetamiento variables ----
sjlabelled::get_label(elsoc19)


# ---- 3. Estadisticos de reporte y eliminacion NA ----



# ---- 4. Exportar base ----




# ---- 5. Informacion sesion R ----
sessionInfo()

