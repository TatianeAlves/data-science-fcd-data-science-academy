# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
list.files()
list.dirs()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
?letters
vec_1 <- c(letters)
vec_2 <- c(TRUE, FALSE)
?rnorm
vec_3 <- c(rnorm(n = 26, sd = 1))

df <- data.frame(vec_1, vec_2, vec_3)
df

# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.

# Criando um Vetor

vec1 <- c(12, 3, 4, 19, 34)
vec1

for(i in 1:length(vec1)){
  if(vec1[i] > 10){
    print(vec1[i])
    print("o número é maior que 10.")
  }
}

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

?lapply
lapply(lst2, print)

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat1*mat2

# Multiplicação de matrizes
mat1%*%mat2

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
vec_4 <- c(1:5)
names(vec_4) <- c("n1", "n2", "n3", "n4", "n4")
vec_4

matriz <- matrix(c(1:10), nrow = 2, ncol = 5)
matriz
dimnames(matriz) <- (list(c("c1", "c2"), c("r1", "r2", "r3", "r4", "r5")))

?list
lista <- list(c("AZUL", "VERMELHO", "ROXO"), c(10, 20, 30))
lista

?names
names(lista) <- c("COR", "TOTAL")
lista

df
colnames(df) <- c("letras", "booleanos", "randomicos")
df

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

mat2[sample(50, size = 10)] = NA
mat2

# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

rowSums(mat1)
colSums(mat1)

# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a

order(a)
a[order(a)]

# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

for(i in mat1){
  if(i  > 15){
    print(i)
  }
}


