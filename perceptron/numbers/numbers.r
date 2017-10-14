getwd()
#setwd("/home/IC/perceptron/numbers")

# 1,1,1,1,1
# 1,0,0,0,1
# 1,0,0,0,1
# 1,1,1,1,1
# 1,0,0,0,1
# 1,0,0,0,1
# 1,1,1,1,1


database <- read.csv("zero.csv")
#print(database)
rows <- nrow(database)
cols <- ncol(database)

#Combinador Linear
v <- function(x,w){
  sum <- 0
  for (i in 1:length(w)){
    sum <- sum + (x[i]*w[i])
  }
  return (sum)
}

#Função de ativação
activation <- function(result){
  if(result >= 0)
    return (1)
  return (0)
}


#Função de treinamento
training <- function(x,w,error,LF){
  for(i in 1:length(w)){
    w[i] <- w[i] + LF*error*x[i]
  }
  return(w)
}

#Lê da base e insere no vetor x
read_database <- function(line){
  x <- c()
  for (i in 1:cols){
    x[i] <- database[line,i]
  }
  return (x)
}

learn <- function(active,x){
  if(active != x[cols])
    return (TRUE)
  return (FALSE)
}

perceptron <- function(LF){
  w <- c(runif ((cols - 1),-1,1)) #Pesos sinápticos aleatórios (valores entre -1 e 1)
  print(w)
  epoch <- 0
  for (i in 1:rows){
    x <- read_database(i)
    learning <- TRUE
    while (learning){
      result <- v(x,w)
      active <- activation(result)
      error <- x[cols] - active #Calculando o erro
      w <- training(x,w,error,LF) #Ajustando os pesos
      #print(w)
      learning <- learn(active,x)
      epoch <- epoch + 1
    }
    print(active)
  }
  format(data.frame("--- Épocas ---" = epoch,check.names = FALSE))
}

perceptron(0.1)










