# Análisis de los determinantes del rendimiento en el baloncesto

Este repositorio contiene los scripts en R utilizados en el caso práctico del Trabajo de Fin de Grado titulado **"Análisis de los determinantes del rendimiento en el baloncesto"**, realizado por **Gonzalo Campos Gómez-Pardo** en la **Universitat de València**.

El estudio se centra en un modelo de **regresión beta bayesiana** para predecir la **proporción de votos** recibida por los candidatos al premio **MVP** de la NBA, utilizando técnicas como **MCMC** e **INLA**.

## Estructura del repositorio

- `modelo_completo_jags.R`: estimación del modelo completo con todas las covariables usando JAGS.
- `seleccion_modelos_inla.R`: selección del modelo óptimo mediante criterios bayesianos (DIC, WAIC, LCPO) con INLA.

## Requisitos

- R versión ≥ 4.0.0
- Paquetes necesarios: `magrittr`, `httr`, `rvest`, `tidyverse`, `rjags`, `rethinking`, `dplyr`, `INLA`

## Reproducibilidad

Los modelos y figuras del caso práctico pueden replicarse ejecutando los scripts incluidos, utilizando los datos de la temporada **2023–24** disponibles en el directorio `data/`.

## Licencia

Este repositorio tiene fines académicos y de divulgación. Si deseas reutilizar el contenido, se agradece citar adecuadamente al autor.


