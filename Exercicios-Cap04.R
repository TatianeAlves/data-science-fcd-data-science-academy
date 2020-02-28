# Exercicios 
setwd("C:/Users/Ttaty/Google Drive/DSA/FCD/BigDataRAzure/Cap04")

# Exercicio 1 - Crie uma função que receba os dois vetores abaixo como parâmetro, 
# converta-os em um dataframe e imprima no console
vec1 <- (10:13)
vec2 <- c("a", "b", "c", "d")

func <- function(x, y){
        df <- as.data.frame(x, y)
        print(df)
}

func(vec1, vec2)

# Exercicio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com 
# números inteiros e calcule a média de cada linha

mt <- matrix(data = sample(1:100), nrow = 4, ncol = 4)
soma <- vector()

for(i in 1:ncol(mt)){
  soma[i] <- sum(mt[i,])
}

mt <- cbind(mt, soma)
mt

apply(mt, 1, mean)

# Exercicio 3 - Considere o dataframe abaixo. 
# Calcule a média por disciplina e depois calcule a média de apenas uma disciplina
escola <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Ajay'),
                     Matematica = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Quimica = c(76, 56, 89, 90, 100, 87))

View(escola)

medias <- lapply(escola[,2:4], mean)
unlist(medias)

lapply(escola$Matematica, mean)

# Exercicio 4 - Cria uma lista com 3 elementos, todos numéricos 
# e calcule a soma de todos os elementos da lista

lista <- list(sample(1:100, 3))
lapply(lista, sum)

do.call(lista, sum)

# Exercicio 5 - Transforme a lista anterior um vetor
vec <- unlist(lista)
vec


# Exercicio 6 - Considere a string abaixo. Substitua a palavra "textos" por "frases"
str <- c("Expressoes", "regulares", "em linguagem R", 
         "permitem a busca de padroes", "e exploracao de textos",
         "podemos buscar padroes em digitos",
         "como por exemplo",
         "10992451280")
gsub("textos", "frases", str)


# Exercicio 7 - Usando o dataset mtcars, crie um gráfico com ggplot do tipo 
# scatter plot. Use as colunas disp e mpg nos eixos x e y respectivamente
mc <- mtcars
ggplot(data = mc, aes(x = disp, y = mpg)) + geom_point()


# Exercicio 8 - Considere a matriz abaixo.
# Crie um bar plot que represente os dados em barras individuais.????????????????????????????????
mat1 <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
mat1

barplot(mat1, beside = T)

# Exercício 9 - Qual o erro do código abaixo?
data(diamonds)
ggplot(data = diamonds, aes(x = price, group = fill, fill = cut)) + 
  geom_density(adjust = 1.5)

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) + 
  geom_density(adjust = 1.5)


# Exercício 10 - Qual o erro do código abaixo?
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_barplot() +
  labs(fill = "cyl")

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cyl")
