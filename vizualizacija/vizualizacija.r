# 3. faza: Vizualizacija podatkov

library(ggplot2)
library(dplyr)
library(reshape2)


graf1 <- ggplot(data = istospolne, aes(x=leto, y = stevilo, group = spol, fill=spol))
graf1 <- graf1 + geom_bar(stat = "identity", width = 0.5, position = "dodge")
graf1 <- graf1 + scale_x_discrete(aes(x=leto, y = stevilo), limits=2006:2016)
# graf1 <- graf1 + facet_grid(. ~ Year)
# graf1 <- graf1 + theme_bw()


print(graf1)



#ZEMLJEVID
library(sp)
library(maptools)
library(digest)
gpclibPermit()



# Izračunamo povprečno število porok v posamezniregiji
imena_regij = colnames(regije)
#sapply(m,function(x){ mean(meseci[meseci$mesec == x,"stevilo"])})
povprecja = sapply(imena_regij,function(x){ round(mean(as.numeric(regije[,x])))})
tabela_povprecij_regij = data.frame(regija=imena_regij, povprecje = povprecja)
tabela_povprecij_regij = tabela_povprecij_regij[1:12,]





# Izračunamo povprečno število porok v posameznem mesecu
imena = unique(meseci$mesec)
#sapply(m,function(x){ mean(meseci[meseci$mesec == x,"stevilo"])})
povprecja = sapply(imena,function(x){ round(mean(meseci[meseci$mesec == x,"stevilo"]))})
tabela_povprecij = data.frame(mesec=imena, povprecje = povprecja)



# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "utf-8") %>% pretvori.zemljevid()


levels(zemljevid$NAME_1)[levels(zemljevid$NAME_1) %in%
                           c("Notranjsko-kraška",
                             "Spodnjeposavska", "Koroška", "Goriška", "Obalno-kraška")] <- c("Primorsko-notranjska",
                                                                                             "Posavska", "Koroska", "Goriska", "Obalno-kraska")


zemljevid.regije <- ggplot() +
  geom_polygon(data = tabela_povprecij_regij %>% right_join(zemljevid, by = c("regija" = "NAME_1")),
               aes(x = long, y = lat, group = group, fill = povprecje))+
  xlab("") + ylab("") + ggtitle("Število porok po slovenskih regijah")





source("lib/uvozi.zemljevid.r", encoding = "UTF-8")
library(ggplot2)
library(dplyr)


