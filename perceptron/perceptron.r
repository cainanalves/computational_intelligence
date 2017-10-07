#print(getwd())
#setwd("/home/cainan/Inteligência_Computacional/perceptron/")
database <- read.csv("database.csv")

rows <- 4
cols <- 3
LF <- 0.1 #Learning Factor
#######################
class <- c(-1,-1,-1,1)# AND
      # <- c(-1,1,1,1)# OR
      # <- c(1,1,-1,1)# IMPLIES
#######################



v <- function(x,w){
  sum <- 0
  for (i in 1:cols){
    sum <- sum + (x[i]*w[i])
  }
  return (sum)
}

#Função de ativação
activation <- function(result){
  if(result != 0)
    return (TRUE)
  return (FALSE)
}

#Condição para treinar
learn <- function(result,line){
  if(result != class[line])
    return (TRUE)
  return (FALSE)
}

#Função de treinamento
training <- function(x,w,error){
  for(i in 1:cols){
    w[i] <- w[i] + LF*error*x[i] 
  }
  return(w)
}

#Lê da base e insere no vetor x
read_database <- function(line){
  x <- rep(0,cols)
  for (i in 1:cols){
      x[i] <- database[line,i]
  }
  return (x)
}

perceptron <- function(w){
  for (i in 1:rows){
    x <- read_database(i)
    result <- v(x,w)
    active <- activation(result)
    learning <- learn(result,i)
    epoch <- 0
    while (active && learning && (epoch < 90)){
      error <- class[i] - result #Calculando o erro
      w <- training(x,w,error) #Ajustando os pesos
      #print(w)
      result <- v(x,w) #Reavaliando o resultado
      epoch <- epoch + 1
    }
    print(result)
  }
}

sort <- runif (3,-1,1)
print(sort)
weights <- c(sort)
perceptron(weights)





