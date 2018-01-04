# 3. faza: Vizualizacija podatkov

library(ggplot2)
library(dplyr)

graf1 <- ggplot(istospolne) + aes(x=leto, y = stevilo, fill = stevilo) + geom_col()
print(graf1)








# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip",
                             "OB/OB", encoding = "Windows-1250")
levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels = levels(obcine$obcina))
zemljevid <- pretvori.zemljevid(zemljevid)

# Izračunamo povprečno velikost družine
povprecja <- druzine %>% group_by(obcina) %>%
  summarise(povprecje = sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))



source("lib/uvozi.zemljevid.r", encoding = "UTF-8")
library(ggplot2)
library(dplyr)


