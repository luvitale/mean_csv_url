is.url <- function(x) {
  grepl("www.|http:|https:", x)
}

readURL <- function() {
  inputURL <- readline(prompt="Ingresá una URL: ")
  while (!is.url(inputURL)) {
    inputURL <- readline(prompt="Ingresá una URL válida: ")
  }
  return(inputURL)
}

showOptions <- function() {
  i <- 1
  for(coldatacsv in colnames(datacsv)) {
    print(paste(i, "->", coldatacsv))
    i <- i + 1
  }
}

csvurl <- readURL()
csv <- read.csv(csvurl)
datacsv <- as.data.frame(csv)
print("Ingresá un número para calcular la media de la columna especificada")
showOptions()