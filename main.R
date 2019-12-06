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

csvurl <- readURL()
csv <- read.csv(csvurl)
df <- as.data.frame(csv)
print(df)