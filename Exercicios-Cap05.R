# Solução Lista de Exercícios - Capítulo 5

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/Tatiane/Google Drive/DSA/FCD/BigDataRAzure/Cap05")

getwd()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = N, qmethod = "double")

View(mtcars)
?write.table

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
read.csv2("mtcars2.txt", header = TRUE, sep = "|")

# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)

df_iris <- read_csv("iris.csv", col_types = cols(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

?readr
?read_csv

View(df_iris)

# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30) 
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="", add = TRUE)

?hist
hist(c(dataset1, dataset2), breaks=30 , xlim=c(0,300) , col=c(col=rgb(1,0,0,0.5), rgb(0,0,1,0.5)) , xlab="Altura" , ylab="Peso" , main="")


# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))


# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. 
# Crie o gráfico que resulta nesta imagem.

detach(package : ggplot2)

library(plotly)

serie_x <- sample(1:60)
serie_y <- sample(1:80)
serie_z <- sample(1:180)

data <- list(c(serie_x, serie_y, serie_z))
data

# volcano is a numeric matrix that ships with R
p <- plot_ly(z = ~volcano) %>% add_surface()
p

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
# chart_link = api_create(p, filename="surface-1")
# chart_link

# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson

install.packages("rjson")
library(rjson)

?rjson
data <- fromJSON(file = "input.json")
print(data)

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício
# anterior em um dataframe e imprima o conteúdo no console.

df <- as.data.frame(data)
View(df)

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML

install.packages("XML")
library(XML)

dataXML <- xmlParse(file = "input.xml")
dataXML

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe

library(methods)

dfXML <- xmlToDataFrame(dataXML)
View(dfXML)

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às
# seguintes perguntas:

dataCSV <- read.csv(file = "input.csv", header = TRUE, sep = ",")
View(dataCSV)

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?

ncol(dataCSV)
# 5
nrow(dataCSV)
# 8

# Pergunta 2 - Qual o maior salário?

summary(dataCSV)
max(dataCSV$salary)
# 843.2

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.

v <- subset(dataCSV, salary == max(dataCSV$salary))
print(v)

# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de 
# IT.

v <- subset(dataCSV, dept == "IT")
print(v)

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário 
# superior a 600. 

v <- subset(dataCSV, salary > 600 & dept == "IT")
print(v)
