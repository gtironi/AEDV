library(gapminder)
library(ggplot2)
library(socviz)
library(tidyverse)
library(dplyr)
library(ggrepel)

theme_set(theme_classic())
theme_update(legend.position="top")
theme_update(plot.title = element_text(size = 12, face = "bold"))

gapminder <- gapminder::gapminder %>% rename("Ano" = "year",
 "País" = "country",
 "Continente" = "continent",
 "População" = "pop",
 "PIBpercapita" = "gdpPercap",
 "Expvida" = "lifeExp")

gss_sm <- socviz::gss_sm %>%
rename("Ano" = "year",
 "Idade" = "age",
 "Crianças" = "childs",
 "Região" = "bigregion",
 "Religião" = "religion")
  
organdata <- socviz::organdata %>%
rename("Ano" = "year",
 "País" = "country",
 "Doadores" = "donors",
 "População" = "pop",
 "Estradas" = "roads")

midwest <- ggplot2::midwest %>%
rename("Estado" = "state",
 "Área" = "area")

# --------------Cap 4----------------

grafico_1 <- ggplot(gapminder, mapping = aes(x = Ano, y = PIBpercapita)) +
  geom_line()

grafico_1

grafico_2 <- ggplot(gapminder, mapping = aes(x = Ano, y = PIBpercapita)) +
  geom_line(aes(group=País))

grafico_2

grafico_3 <- ggplot(gapminder, mapping = aes(x = Ano, y = PIBpercapita)) +
  geom_line(aes(group=País)) +
  facet_wrap(~Continente) +
  theme_bw()

grafico_3

grafico_4 <- ggplot(gapminder, mapping = aes(x = Ano, y = PIBpercapita)) +
  geom_line(color = "gray70", aes(group=País)) +
  geom_smooth(size=1.1, method="loess", se=FALSE) +
  scale_y_log10(labels=scales::dollar) +
  facet_wrap(~ Continente, ncol=5) +
  labs(x = "Ano",
       y = "PIB per capita",
       title = "PIB per capita nos cinco Continentees") +
  theme_bw()

grafico_4

grafico_5 <- ggplot(data = gss_sm, mapping = aes(x = Idade, y = Crianças)) +
  geom_point(alpha=0.2) +
  geom_smooth() +
  facet_grid(sex~race)
  
grafico_5

grafico_6 <- ggplot(data = gss_sm, mapping = aes(x = Região)) +
  geom_bar()

grafico_6

grafico_7 <- ggplot(data = gss_sm, mapping = aes(x = Região)) +
  geom_bar(mapping = aes(y=after_stat(prop), group = 1))

grafico_7

grafico_8 <- ggplot(data = gss_sm, aes(x = Religião, color = Religião)) +
  geom_bar()  +
  theme()

grafico_8

grafico_9 <- ggplot(data = gss_sm, mapping = aes(x = Religião, fill = Religião)) +
  geom_bar() +
  guides(fill = FALSE)

grafico_9

grafico_10 <- ggplot(data = gss_sm, mapping = aes(x = Região, fill = Religião)) +
  geom_bar() +
  theme()

grafico_10

grafico_11 <- ggplot(data = gss_sm, mapping = aes(x = Região, fill = Religião)) +
  geom_bar(position = "fill") +
  theme()

grafico_11

grafico_12 <- ggplot(data = gss_sm, mapping = aes(x = Região, fill = Religião)) +
  geom_bar(position = "dodge", aes(y = after_stat(prop), group = Religião))

grafico_12

grafico_13 <- ggplot(data = gss_sm, mapping = aes(x = Religião)) +
  geom_bar(position = "dodge", aes(y = after_stat(prop), group = Região)) +
  facet_wrap(~Região, ncol = 2) +
  theme_bw()

grafico_13

grafico_14 <- ggplot(data = midwest, mapping = aes(x = Área)) +
  geom_histogram()

grafico_14

grafico_15 <- ggplot(data = midwest, mapping = aes(x = Área)) +
  geom_histogram(bins = 10)

grafico_15

oh_wi <- c("OH", "WI")

grafico_16 <- ggplot(data = subset(midwest, Estado %in% oh_wi),
              mapping = aes(x = percollege, fill = Estado)) +
  geom_histogram(bins = 20, alpha = 0.4)

grafico_16

grafico_17 <- ggplot(data = midwest,  mapping = aes(x = Área)) +
  geom_density()

grafico_17

grafico_18 <- ggplot(data = midwest,  mapping = aes(x = Área, fill = Estado, color = Estado)) +
  geom_density(alpha = 0.3)

grafico_18

grafico_19 <- ggplot(data = subset(midwest, Estado %in% oh_wi), 
              mapping = aes(x = Área, fill = Estado, color = Estado)) +
  geom_density(alpha = 0.3, mapping = aes(y = after_stat(scaled)))

grafico_19

grafico_20 <- ggplot(data = titanic, mapping = aes(x = fate, y = percent, fill = sex)) +
  geom_bar(position = "dodge", stat = "identity")

grafico_20

grafico_21 <- ggplot(data = oecd_sum, mapping = aes(x = year, y = diff, fill = hi_lo)) +
  geom_col() +
  guides(fill = FALSE) +
  labs(x = NULL, 
       y = "Diferença, em anos",
       title = "Diferença na expectativa de Vida nos Estados Unidos",
       subtitle = "Diferença entre a expectativa de vida média dos Estados Unidos e da OECD, 1960-2015",
       caption = "Data: OECD, After a chart por Christopher Ingraham, Washington Post, 27 de Dezembro de 2017") +
  theme_bw()

grafico_21

# --------------Cap 5----------------

rel_by_region <- gss_sm %>%
  group_by(Região, Religião) %>%
  summarize(N = n()) %>%
  mutate(freq = N/sum(N),
         pct = round((freq*100), 0))

grafico_22 <- ggplot(rel_by_region, aes(x = Região, y = pct, fill = Religião)) +
  geom_col(position = "dodge2") +
  labs(x = "Região", y = "Porcentagem", fill = "Religião")

grafico_22

grafico_23 <- ggplot(rel_by_region, aes(x = Religião, y = pct, fill = Religião)) +
  geom_col(position = "dodge2") +
  labs(x = NULL, y = "Porcentagem", fill = "Religião") +
  guides(fill = FALSE) +
  coord_flip() +
  facet_grid(~Região)

grafico_23

grafico_24 <- ggplot(organdata, mapping = aes(x = Ano, y = Doadores)) +
  geom_line(aes(group = País)) +
  facet_wrap(~País)

grafico_24

grafico_25 <- ggplot(organdata, mapping = aes(x = reorder(País, Doadores, na.rm = TRUE), y = Doadores, fill = world)) +
  geom_boxplot() +
  labs(x = NULL) +
  coord_flip()

grafico_25

grafico_26 <- ggplot(organdata, mapping = aes(x = reorder(País, Doadores, na.rm = TRUE), y = Doadores, color = world)) +
  geom_point(size = 3) +
  labs(x = NULL) +
  coord_flip()

grafico_26

by_country <- organdata %>% group_by(consent_law, País) %>%
  summarize_if(is.numeric, funs(mean, sd), na.rm = TRUE) %>%
  ungroup

grafico_27 <- ggplot(by_country, mapping = aes(x = Doadores_mean, y = reorder(País, Doadores_mean), color = consent_law)) +
  geom_point(size = 3) +
  labs(x = "Taxa de Captação de Doadores", y = "", color = "Consentimento")

grafico_27

grafico_28 <- ggplot(by_country, mapping = aes(x = Doadores_mean, y = reorder(País, Doadores_mean))) +
  geom_point(size = 3) +
  facet_wrap(~consent_law, scales = "free_y", ncol = 2) +
  labs(x = "Doadores", y = "")

grafico_28

grafico_29 <- ggplot(by_country, mapping = aes(x = reorder(País, Doadores_mean), y = Doadores_mean)) +
  geom_pointrange(mapping = aes(ymin = Doadores_mean - Doadores_sd, ymax = Doadores_mean + Doadores_sd)) +
  labs(x = "", y = "Doadores") +
  coord_flip() +
  theme(legend.position = "none")

grafico_29

p_title <- "Eleições Presidenciais: margens do colégio eleitoral e Populaçãoular"
p_subtitle <- "1824-2016"
p_caption <- "Os dados de 2016 são provisórios."
x_label <- "Porcentagem de votos Populaçãoulares do vencedor"
y_label <- "Porcentagem de votos dos colégios eleitorais do vencedor"

grafico_30 <- ggplot(elections_historic, aes(x = popular_pct, y = ec_pct, label = winner_label)) +
  geom_hline(yintercept = 0.5, size = 1.4, color = "gray80") +
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray80") +
  geom_point(size=2) +
  geom_text_repel() +
  scale_x_continuous(labels = scales::percent) +
  scale_y_continuous(labels = scales::percent) +
  labs(x = x_label, y = y_label, title = p_title, subtitle = p_subtitle, caption = p_caption)

grafico_30

grafico_31 <- ggplot(by_country, mapping = aes(x = gdp_mean, y = health_mean)) +
  geom_point(size=2) +
  geom_text_repel(data = subset(by_country, gdp_mean > 25000), mapping = aes(label = País))

grafico_31

grafico_32 <- ggplot(by_country, mapping = aes(x = gdp_mean, y = health_mean)) +
  geom_point(size=2) +
  geom_text_repel(data = subset(by_country, gdp_mean > 25000 | health_mean < 1500 | País %in% "Belgium"), mapping = aes(label = País))

grafico_32

organdata$ind <- organdata$ccode %in% c("Ita", "Spa") & organdata$Ano > 1998

grafico_33 <- ggplot(organdata, mapping = aes(x = Estradas, y = Doadores, color = ind)) +
  geom_point(size=2) +
  geom_text_repel(data = subset(organdata, ind), mapping = aes(label = ccode)) +
  guides(label = FALSE, color = FALSE)

grafico_33

grafico_34 <- ggplot(organdata, mapping = aes(x = Estradas, y = Doadores)) +
  geom_point(size=2) +
  annotate(geom = "rect", xmin = 120, xmax = 160, ymin = 30, ymax = 35, fill = "red", alpha = 0.2) +
  annotate(geom = "text", x = 162, y = 32.5, label = "Um número surpreendente \n grande de recuperações", hjust = 0)

grafico_34

grafico_35 <- ggplot(organdata, mapping = aes(x = Estradas, y = Doadores, color = world)) +
  geom_point(size=2) +
  scale_x_log10() +
  scale_y_continuous(breaks = c(5, 15, 25), labels = c("Cinco", "Quinze", "Vinte e cinco"))

grafico_35

grafico_36 <- ggplot(organdata, mapping = aes(x = Estradas, y = Doadores, color = world)) +
  geom_point(size=2) +
  labs(x = "Mortes na Estrada", y = "Doadores") +
  guides(color = FALSE)

grafico_36
