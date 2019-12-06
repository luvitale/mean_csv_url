is.url <- function(x) {
  grepl("www.|http:|https:", x)
}

readURL <- function() {
  inputURL <- readline(prompt="Ingresá una URL: ")
  while(!is.url(inputURL)) {
    inputURL <- readline(prompt="Ingresá una URL válida: ")
  }
  return(inputURL)
}

showOptions <- function(columnNames) {
  i <- 1
  for(columnName in columnNames) {
    print(paste(i, "->", columnName))
    i <- i + 1
  }
}

readOption <- function(len) {
  option <- readline(prompt="Ingresá una opción: ")
  option <- as.integer(option)
  while(option < 1 || option > len) {
    option <- readline(prompt=paste("Ingresá una opción válida ( del 1 al", len, "): "))
    option <- as.integer(option)
  }
  return(option)
}

csvurl <- readURL()
csv <- read.csv(csvurl)
datacsv <- as.data.frame(csv)

print("Ingresá un número para calcular la media de la columna especificada")
columnNames <- colnames(datacsv)
showOptions(columnNames)
option <- readOption(length(datacsv))

dataoption <- datacsv[,option]
dataoption <- dataoption[!is.na(dataoption)]
meanoption <- mean(dataoption)

msg <- paste("La media de la columna", option)
msg <- paste(msg, "(", columnNames[option], ") es", meanoption)
print(msg)