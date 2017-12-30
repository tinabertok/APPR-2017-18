# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")



# Funkcija, ki uvozi podatke iz datoteke istospolne_partnerske_skupnosti.csv

uvozi.istospolne <- function() {
  data <- read_csv2("podatki/Istospolne_partnerske_skupnosti.csv", skip = 2,
                    locale = locale(encoding = "Windows-1250"), n_max = 2) %>%
    melt()
  colnames(data) <- c("spol", "leto", "stevilo")
  data$leto <- parse_number(data$leto)
  return(data)
}

# Zapišimo podatke v razpredelnico istospolne
istospolne <- uvozi.istospolne()



# Funkcija, ki uvozi podatke iz datoteke Poroke_po_mesecih.csv
uvozi.meseci <- function() {
  data <- read_csv2("podatki/Poroke_po_mesecih.csv", skip = 2,
                    locale = locale(encoding = "Windows-1250"), n_max = 32) %>%
    melt(id.vars = 1)
  colnames(data) <- c("leto", "mesec", "stevilo")
#  data$leto <- parse_number(data$leto)
  return(data)
}

# Zapišimo podatke v razpredelnico meseci
meseci <- uvozi.meseci()



