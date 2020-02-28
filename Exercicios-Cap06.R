# Solução Lista de Exercícios - Capítulo 6

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/Tatiane/Google Drive/DSA/FCD/BigDataRAzure/Cap06")
getwd()


# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
library(RSQLite)

# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
?RSQLite
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "mamiferos.sqlite")
con

# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
?src_dbi

library(dplyr)

src_sqlite("mamiferos.sqlite")


# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys
query <- "SELECT year, species_id, plot_id FROM surveys"
result <- dbSendQuery(con, query)
print(result)

data <- fetch(result, n = -1)
print(data)

# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
class(data)

# Exercicio 6 - Já carregamos a tabela abaixo para você. 
# Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
pesquisas <- tbl(con, "surveys")
?tbl
class(pesquisas)

pesquisas %>% filter(weight < 5) %>% select(species_id, sex, weight)

# Exercicio 7 - Grave o resultado do item anterior em um objeto R.
# O objeto final deve ser um dataframe
rs <- as.data.frame(pesquisas %>% filter(weight < 5))
class(rs)

rs

?explain
as.data.frame(rs)

# Exercicio 8 - Liste as tabelas do banco de dados carregado
db_list_tables(con)

# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
?db_create_table

db_create_table(con, "teste",)

# Exercicio 10 - Imprima os dados da tabela criada no item anterior


dbDisconnect(con)

