# Solução Lista de Exercícios - Capítulo 10

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap11")
getwd()


# Pacotes
install.packages("dplyr")
install.packages('nycflights13')
library('ggplot2')
library('dplyr')
library('nycflights13')
View(flights)
?flights

# Definindo o Problema de Negócio
# Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)


##### ATENÇÃO #####
# Você vai precisar do conhecimento adquirido em outros capítulos do curso 
# estudados até aqui para resolver esta lista de exercícios!


# Exercício 1 - Construa o dataset pop_data com os dados de voos das 
# companhias aéreas UA (United Airlines) e DL (Delta Airlines). 
# O dataset deve conter apenas duas colunas, nome da companhia e atraso nos voos de chegada.
# Os dados devem ser extraídos do dataset flights para construir o dataset pop_data
# Vamos considerar este dataset como sendo nossa população de voos

View(flights)

busca <- flights %>%
  select(carrier, arr_delay) %>%
  filter(carrier == "UA" | carrier == "DL")

pop_data <- as.data.frame(busca)

View(pop_data)

class(pop_data)

# Exercício 2  - Crie duas amostras de 1000 observações cada uma a partir do 
# dataset pop_data apenas com dados da companhia DL para amostra 1 e apenas dados 
# da companhia UA na amostra 2

names(pop_data)

# Amostra 1
dados_1 <- pop_data %>%
              select(carrier, arr_delay) %>%
              filter(carrier == "DL")
View(dados_1)
amostra_1 <- as.data.frame(sample(dados_1$arr_delay, 1000))
View(amostra_1)
class(amostra_1)

# Amostra 2
dados_2 <- pop_data %>%
  select(carrier, arr_delay) %>%
  filter(carrier == "UA")
View(dados_2)
amostra_2 <- as.data.frame(sample(dados_2$arr_delay, 1000))
View(amostra_2)

# Dica: inclua uma coluna chamada sample_id preenchida com número 1 para a primeira 
# amostra e 2 para a segunda amostra

View(amostra_1)
class(amostra_1)

amostra_1 <- cbind(amostra_1, c(1))
amostra_2 <- cbind(amostra_2, c(2))

?colnames
colnames(amostra_1) <- c("arr_delay", "sample_id")
colnames(amostra_2) <- c("arr_delay", "sample_id")

head(amostra_1)
head(amostra_2)

# Exercício 3 - Crie um dataset contendo os dados das 2 amostras criadas no item anterior. 

new_dataset <- rbind(amostra_1, amostra_2)

class(new_dataset)
head(new_dataset)
nrow(new_dataset)

# Exercício 4 - Calcule o intervalo de confiança (95%) da amostra1

# Usamos a fórmula: erro_padrao_amostra1 = sd(amostra1$arr_delay) / sqrt(nrow(amostra1))

# Esta fórmula é usada para calcular o desvio padrão de uma distribuição da média amostral
# (de um grande número de amostras de uma população). Em outras palavras, só é aplicável 
# quando você está procurando o desvio padrão de médias calculadas a partir de uma amostra de 
# tamanho n𝑛, tirada de uma população.

# Digamos que você obtenha 10000 amostras de uma população qualquer com um tamanho de amostra de n = 2.
# Então calculamos as médias de cada uma dessas amostras (teremos 10000 médias calculadas).
# A equação acima informa que, com um número de amostras grande o suficiente, o desvio padrão das médias 
# da amostra pode ser aproximado usando esta fórmula: sd(amostra) / sqrt(nrow(amostra))
  
# Deve ser intuitivo que o seu desvio padrão das médias da amostra será muito pequeno, 
# ou em outras palavras, as médias de cada amostra terão muito pouca variação.

# Com determinadas condições de inferência (nossa amostra é aleatória, normal, independente), 
# podemos realmente usar esse cálculo de desvio padrão para estimar o desvio padrão de nossa população. 
# Como isso é apenas uma estimativa, é chamado de erro padrão. A condição para usar isso como 
# uma estimativa é que o tamanho da amostra n é maior que 30 (dado pelo teorema do limite central) 
# e atende a condição de independência n <= 10% do tamanho da população.

# Erro padrão
erro_padrao_amostra1 = sd(amostra_1$arr_delay, na.rm = TRUE) / sqrt(nrow(amostra_1))
erro_padrao_amostra1

erro_padrao_amostra2 = sd(amostra_2$arr_delay, na.rm = TRUE) / sqrt(nrow(amostra_2))
erro_padrao_amostra2


# Limites inferior e superior
max(amostra_1, na.rm = TRUE)
min(amostra_1, na.rm = TRUE)
mean(amostra_1$arr_delay, na.rm = TRUE)
median(amostra_1$arr_delay, na.rm = TRUE)

max(amostra_2, na.rm = TRUE)
min(amostra_2, na.rm = TRUE)
mean(amostra_2$arr_delay, na.rm = TRUE)
median(amostra_2$arr_delay, na.rm = TRUE)

# 1.96 é o valor de z score para 95% de confiança


# Intervalo de confiança



# Exercício 5 - Calcule o intervalo de confiança (95%) da amostra2



# Exercício 6 - Crie um plot Visualizando os intervalos de confiança criados nos itens anteriores
# Dica: Use o geom_point() e geom_errorbar() do pacote ggplot2



# Exercício 7 - Podemos dizer que muito provavelmente, as amostras vieram da mesma população? 
# Por que?



# Exercício 8 - Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)

# H0 e H1 devem ser mutuamente exclusivas.

