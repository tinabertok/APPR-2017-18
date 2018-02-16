# 4. faza: Analiza podatkov

#Napoved za število porok
poroke$Leto <- poroke$Leto %>% as.character() %>% as.numeric()
LMP <- lm(data = poroke, Poroke ~ Leto)
P <- predict(LMP, data.frame(Leto = (seq(2017, 2027, 1))))


#SKUPAJ NAPOVED TABELA
NAPOVED  <- data.frame("Poroke" = as.integer(P), row.names = (2017:2027))
