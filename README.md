## Analiza sklenitev zakonskih zvez v Sloveniji

Avtor: Tina Bertok

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Tematika

V svojem projektu se bom osredotočila na sklenitve zakonskih zvez v Sloveniji. Analizirala bom starost ženina in neveste, njun zakonski stan ter datum poroke (ugotoviti bom poskušala v katerem mesecu se poroča največ ljudi). Podrobneje si bom ogledala tudi število porok glede na posamezne slovenske regije in to v nadaljnih fazah vizualizirala s pomočjo zemljevida. Kot dodatno spremenljivko bi lahko uporabila tudi istospolne partnerske skupnosti.

Za vir podatkov bom uporabila OPSI in SURS.



Tabele:

1.tabela : STAROST OB SKLENITVI ZAKONSKE ZVEZE (starost ženina, starost neveste, leto)

2.tabela : DATUM POROKE (število porok, mesec, leto)

3.tabela : ZAKONSKI STAN PRED SKLENITVIJO ZAKONSKE ZVEZE (zakonski stan ženina, zakonski stan neveste, leto)

4.tabela : REGIJE SKLENITEV ZAKONSKIH ZVEZ (število porok, regija, leto)

5.tabela : ISTOSPOLNE PARTNERSKE SKUPNOSTI (število istospolnih partnerskih skupnosti, število sklenitev zakonske zveze, leto)

Plan dela:
-razvrščanje podatkov, primerjanje vplivov, ki jih imajo spremenljivke druga na drugo (kako so se z leti spreminjala števila porok, pri kakšni starosti so se poročali včasih in pri kakšni zdaj, v katerih mesecih je največ porok, ali se ločeni ljudje še poročajo...)
-predikcija : napovedala bom, kako bo s trendom porok v prihodnosti, ali se bo starost ženina in neveste povišala ali znižala...

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
