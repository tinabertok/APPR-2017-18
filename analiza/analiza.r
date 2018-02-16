# 4. faza: Analiza podatkov

#Napoved za število porok
LMP <- lm(data = tabela_porok, poroke ~ leto)
P <- predict(LMP, data.frame(leto = (seq(2017, 2027, 1))))


#SKUPAJ NAPOVED TABELA
NAPOVED  <- data.frame("Poroke" = as.integer(P), row.names = (2017:2027))
