# 3. faza: Vizualizacija podatkov

library(ggplot2)
library(dplyr)
library(reshape2)

# Izračunamo povprečno število porok v posamezni regiji
imena_regij = colnames(regije)
#sapply(m,function(x){ mean(meseci[meseci$mesec == x,"stevilo"])})
povprecja = sapply(imena_regij,function(x){ round(mean(as.numeric(regije[,x])))})
tabela_povprecij_regij = data.frame(regija=imena_regij, povprecje = povprecja)
tabela_povprecij_regij = tabela_povprecij_regij[1:12,]


# Izračunamo povprečno število porok v posameznem mesecu
imena = unique(meseci$mesec)
#sapply(m,function(x){ mean(meseci[meseci$mesec == x,"stevilo"])})
povprecja = sapply(imena,function(x){ round(mean(meseci[meseci$mesec == x,"stevilo"]))})
tabela_povprecij_meseci = data.frame(mesec=imena, povprecje = povprecja)

#Prvi graf: Istosplone poroke 

graf1 <- ggplot(istospolne) + aes(x = factor(leto), y = stevilo, fill = spol) +
  geom_col(position = "dodge")


#Drugi graf : Število porok po mesecih

graf2 <- ggplot(tabela_povprecij_meseci) + aes(x = mesec, y = povprecje)  +
  geom_col()

#Tretji graf: Starost ženina in neveste

 graf3 <- ggplot(starost) + aes( x = leto, y =factor("Povprecna staorst zenina ob poroki"))
 




#ZEMLJEVID
library(sp)
library(maptools)
library(digest)
gpclibPermit()

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "utf-8") %>% pretvori.zemljevid()

levels(zemljevid$NAME_1)[levels(zemljevid$NAME_1) %in%
                           c("Notranjsko-kraška", "Spodnjeposavska")] <- c("Primorsko-notranjska",
                                                                           "Posavska")



zemljevid.regije <- ggplot() +
  geom_polygon(data = tabela_povprecij_regij %>% right_join(zemljevid, by = c("regija" = "NAME_1")), color = "black",
               aes(x = long, y = lat, group = group, fill = povprecje))+
  xlab("") + ylab("") + ggtitle("Število porok po slovenskih regijah")





source("lib/uvozi.zemljevid.r", encoding = "UTF-8")
library(ggplot2)
library(dplyr)


