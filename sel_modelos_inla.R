# Importar librería necesaria
library(INLA)

# Preparación de datos
Share = full_df$Share
df_inla = data.frame(Share,full_df[2:15]) # Conjunto de datos
df_inla$Share[which.max(df_inla$Share)] <- df_inla$Share[which.max(df_inla$Share)] - 0.00001 
y = df_inla$Share # Variable respuesta
covariables <- names(df_inla)[2:15] # Conjunto de covariables

#Función selección exhaustiva
Bdicwaiclcpo_model<-function(y, variables, data, n, family="beta",...)
{  
  # Términos a usar
  sel.terms <- switch('terms',terms=variables)
  
  # Todas las combinaciones de los m elementos de v
  comb.terms <- function(m, v=sel.terms) {
    if(m==0) return('y ~ 1')
    else {
      combis <- apply(combn(v, m), 2, paste, collapse=' + ')
      return(paste('y ~ 1', combis, sep=' + '))
    }
  }
  
  # Lista con todos los modelos posibles
  f.list <- unlist(sapply(0:length(sel.terms), comb.terms))
  
  # Lanzar cada uno de los modelos guardados en el objeto 'f.list' y quedarse con el DIC
  dic<-numeric()
  LCPO<-numeric()
  waic<-numeric()
  for(i in 1:length(f.list)){
    res =inla(formula = eval(parse(text=f.list[i])), family=family, data=data.frame(y=y, data),
              control.compute=list(dic=TRUE, waic=TRUE, cpo=TRUE), ...)
    dic[i] <- res$dic$dic
    LCPO[i] = -mean(log(res$cpo$cpo))
    waic[i]<-res$waic$waic
    print(c(i, dic[i], waic[i], LCPO[i]))
  }
  
  # Ordenar los modelos según DIC
  models_dic<-data.frame(f.list[order(dic)[1:n]], dic[order(dic)[1:n]], waic[order(dic)[1:n]], LCPO[order(dic)[1:n]])
  colnames(models_dic)<-c("models", "DIC", "WAIC", "LCPO")
  
  # Ordenar los modelos según WAIC
  models_waic<-data.frame(f.list[order(waic)[1:n]], dic[order(waic)[1:n]], waic[order(waic)[1:n]], LCPO[order(waic)[1:n]])
  colnames(models_waic)<-c("models", "DIC", "WAIC", "LCPO")
  
  # Ordenar los modelos según LCPO
  models_lcpo<-data.frame(f.list[order(LCPO)[1:n]], dic[order(LCPO)[1:n]], waic[order(LCPO)[1:n]], LCPO[order(LCPO)[1:n]])
  colnames(models_lcpo)<-c("models", "DIC", "WAIC", "LCPO")
  
  models<-list(models_dic, models_waic, models_lcpo)
  names(models)<-c("modelsDIC", "modelsWAIC", "modelsLCPO")
  models
  
}

# Ejecutar función
modelos <- Bdicwaiclcpo_model(
  y = y,
  variables = covariables,
  data = df_inla,
  family = "beta",
  n = 10 # Indicar el número de mejores modelos que aparecen por pantalla
)

#Elección de modelos según criterios

#Mejores modelos según DIC
modelos_DIC=modelos$modelsDIC

#Mejores modelos según WAIC
modelos_WAIC=modelos$modelsWAIC

#Mejores modelos según LCPO
modelos_LCPO=modelos$modelsLCPO

