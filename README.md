# Análisis de los determinantes del rendimiento en el baloncesto

Este repositorio contiene los scripts en R utilizados en el caso práctico del Trabajo de Fin de Grado titulado **"Análisis de los determinantes del rendimiento en el baloncesto"**, realizado por **Gonzalo Campos Gómez-Pardo** en la **Universitat de València**. El estudio se centra en un modelo de **regresión beta bayesiana** para predecir la **proporción de votos** recibida por los candidatos al premio **MVP** de la NBA, utilizando técnicas como **MCMC** e **INLA**.

## Estructura del repositorio

- `Caso_Práctico.rmd`: estimación del modelo completo y el óptimo usando JAGS.
- `sel_modelos_inla.R`: selección del modelo óptimo mediante criterios bayesianos (DIC, WAIC, LCPO) con INLA.

## Requisitos

- R versión ≥ 4.0.0
- Paquetes necesarios: `magrittr`, `httr`, `rvest`, `tidyverse`, `rjags`, `rethinking`, `GoFKernel`, `dplyr` e `INLA`.

## Reproducibilidad

Los modelos y figuras del caso práctico pueden replicarse ejecutando los scripts incluidos, utilizando los datos de la temporada **2023–24** disponibles en el archivo de texto `2024_dat.txt`.

## Licencia

Este repositorio tiene fines académicos y de divulgación. Si desea reutilizar el contenido, se agradece citar adecuadamente al autor.

---

Gonzalo Campos Gómez-Pardo, 2025.

Trabajo fin de grado presentado en la Universitat de València - Facultat de Ciències Matemàtiques.
