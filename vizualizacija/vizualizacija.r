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

#Izračunamo števila porok v preteklih letih
leta = regije$leto
vsote = sapply(leta,function(x){ 
  
  sum(
    sapply(regije[regije$leto == x,1:12], function(y){
      as.numeric(levels(y))[y]
    })
    ) 

  })
tabela_porok = data.frame(leto = as.numeric(leta), poroke = vsote)

#Prvi graf: Istosplone poroke 

graf1 <- ggplot(istospolne) + aes(x = factor(leto), y = stevilo, fill = spol) +
  geom_col(position = "dodge") +
  labs( x = "Leto", y ="Število")


#Drugi graf : Število porok po mesecih

graf2 <- ggplot(tabela_povprecij_meseci) + aes(x = mesec, y = povprecje, group = 1)  +
  geom_line()+ scale_x_discrete(breaks=tabela_povprecij_meseci$mesec,
                                labels=c("Jan", "Feb", "Mar", "Apr", "Maj", "Jun", "Jul", "Avg", "Sep", "Okt", "Nov", "Dec")) +
  labs(x="Mesec", y = "Povprečno število porok")


#Tretji graf: Starost ženina in neveste

 graf3 <- ggplot(starost)  + geom_line(aes( x = leto, y = `Povprecna starost zenina ob poroki`, color='ženin')) +
    geom_line(aes( x = leto, y = `Povprecna starost neveste ob poroki`, color='nevesta')) +
    scale_colour_manual(name="Starost",values=c("nevesta"="red","ženin"="blue")) +
   labs( x = "Leto", y ="Starost")
 


#Četrti in peti graf : Zakonski stan ženina in neveste 
 
graf4 <- ggplot(stan[stan$leto==1985,]) + aes(x = factor(leto), y = stevilo, fill = interaction(`Stan neveste`, `Stan zenina`, sep = "-"), group=interaction(`Stan neveste`, `Stan zenina`, sep = "-")) +
   geom_col(position = "dodge") +
  labs( x = "Leto", y ="Število porok")

graf4$labels$fill <- "Stan"

# interaction sep ne dela

graf5 <- ggplot(stan[stan$leto==2016,]) + aes(x = factor(leto), y = stevilo, fill = interaction(`Stan neveste`, `Stan zenina`) ,group=interaction(`Stan neveste`, `Stan zenina`)) +
  geom_col(position = "dodge")  +
  labs( x = "Leto", y ="Število porok")

 




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

mesta = data.frame(lon = c(14.508333,15.6455,15.2675,14.366667, 13.733333,15.166667,16.166667,13.643242), lat = c(46.055556,46.557611,46.235833,46.233333,45.55,45.8,46.666667,45.955883))

zemljevid.regije <- ggplot() +
  geom_polygon(data = tabela_povprecij_regij %>% right_join(zemljevid, by = c("regija" = "NAME_1")), color = "black",
               aes(x = long, y = lat, group = group, fill = povprecje))+
  xlab("") + ylab("") + ggtitle("Število porok po slovenskih regijah") +
  geom_point(data=mesta, aes(x=lon, y=lat), color="black", size=3, alpha=1)





source("lib/uvozi.zemljevid.r", encoding = "UTF-8")
library(ggplot2)
library(dplyr)


