# 2. faza: Uvoz podatkov
library(readr)
sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")

#ISTOSPOLNE PARTNERSKE SKUPNOSTI


# Funkcija, ki uvozi podatke iz datoteke istospolne_partnerske_skupnosti.csv

uvozi.istospolne <- function() {
  data <- read_csv2("podatki/Istospolne_partnerske_skupnosti.csv", skip = 2,
                    locale = locale(encoding = "Windows-1250"), n_max = 2) 
  data = melt(data)
  colnames(data) <- c("spol", "leto", "stevilo")
  data$leto <- parse_number(data$leto)
  return(data)
}

# Zapišimo podatke v razpredelnico istospolne
istospolne <- uvozi.istospolne()

#POROKE PO MESECIH

# Funkcija, ki uvozi podatke iz datoteke Poroke_po_mesecih.csv
uvozi.meseci <- function() {
  data <- read_csv2("podatki/Poroke_po_mesecih.csv", skip = 2,
                    locale = locale(encoding = "Windows-1250"), n_max = 32)
  data = melt(data, id.vars = 1)
  colnames(data) <- c("leto", "mesec", "stevilo")
#  data$leto <- parse_number(data$leto)
  return(data)
}

# Zapišimo podatke v razpredelnico meseci
meseci <- uvozi.meseci()



#POROKE PO REGIJAH

uvozi.regije <- function() {
  data <- read_csv2("podatki/Poroke_po_regijah.csv", skip = 4,
                    locale = locale(encoding = "Windows-1250"), n_max = 12)

  data = as.data.frame(t(data))
  colnames(data) = sapply(data[1,], toString)
  #vzemi prvo vrstico in to spremeni v string in daj za imena stolpcev
  data = data[rownames(data) != c("X1"),]
  #izbriši vrstico X1
  data$leto = rownames(data)
  rownames(data) = 1:(dim(data)[1])
  
  return(data)
}

# Zapišimo podatke v razpredelnico regije
regije <- uvozi.regije()

#STAROST ŽENINA IN NEVESTE


uvozi.starost <- function() {
  data <- read_csv2("podatki/Starost_zenina_in_neveste.csv", skip = 2,
                    locale = locale(encoding = "Windows-1250"), n_max = 61) 
  
  colnames(data) <- c("leto", "Povprecna starost zenina ob poroki", "Povprecna starost neveste ob poroki")
  #data$leto <- parse_number(data$leto)
  return(data)
}

# Zapišimo podatke v razpredelnico starost
starost <- uvozi.starost()


#ZAKONSKI STAN


uvozi.stan <- function() {
  data <- read_csv2("podatki/Zakonski_stan.csv", skip = 3,
                    locale = locale(encoding = "Windows-1250"), n_max = 13) %>%
    fill(1) %>% drop_na(2)
  data <- melt(data)
  colnames(data) <- c("Stan zenina", "Stan neveste", "leto", "stevilo")
  return(data)
}

# Zapišimo podatke v razpredelnico stan
stan <- uvozi.stan()

