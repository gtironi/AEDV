library(gapminder)
library(ggplot2)
library(socviz)
library(tidyverse)
library(dplyr)
library(ggrepel)

theme_set(theme_classic())

grafico_1 <- ggplot(gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_line()

grafico_1

grafico_2 <- ggplot(gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_line(aes(group=country))

grafico_2

grafico_3 <- ggplot(gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_line(aes(group=country)) +
  facet_wrap(~continent) +
  theme_bw()

grafico_3

grafico_4 <- ggplot(gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_line(color = "gray70", aes(group=country)) +
  geom_smooth(size=1.1, method="loess", se=FALSE) +
  scale_y_log10(labels=scales::dollar) +
  facet_wrap(~ continent, ncol=5) +
  labs(x = "Ano",
       y = "PIB per capita",
       title = "PIB per capita nos cinco continentes") +
  theme_bw()

grafico_4

grafico_5 <- ggplot(data = gss_sm, mapping = aes(x = age, y = childs)) +
  geom_point(alpha=0.2) +
  geom_smooth() +
  facet_grid(sex~race)
  
grafico_5

grafico_6 <- ggplot(data = gss_sm, mapping = aes(x = bigregion)) +
  geom_bar()

grafico_6

grafico_7 <- ggplot(data = gss_sm, mapping = aes(x = bigregion)) +
  geom_bar(mapping = aes(y=after_stat(prop), group = 1))

grafico_7

grafico_8 <- ggplot(data = gss_sm, aes(x = religion, color = religion)) +
  geom_bar()  +
  theme(legend.position="top")

grafico_8

grafico_9 <- ggplot(data = gss_sm, mapping = aes(x = religion, fill = religion)) +
  geom_bar() +
  guides(fill = FALSE)

grafico_9

grafico_10 <- ggplot(data = gss_sm, mapping = aes(x = bigregion, fill = religion)) +
  geom_bar() +
  theme(legend.position="top")

grafico_10

grafico_11 <- ggplot(data = gss_sm, mapping = aes(x = bigregion, fill = religion)) +
  geom_bar(position = "fill") +
  theme(legend.position="top")

grafico_11

grafico_12 <- ggplot(data = gss_sm, mapping = aes(x = bigregion, fill = religion)) +
  geom_bar(position = "dodge", aes(y = after_stat(prop), group = religion))

grafico_12

grafico_13 <- ggplot(data = gss_sm, mapping = aes(x = religion)) +
  geom_bar(position = "dodge", aes(y = after_stat(prop), group = bigregion)) +
  facet_wrap(~bigregion, ncol = 2) +
  theme_bw()

grafico_13

grafico_14 <- ggplot(data = midwest, mapping = aes(x = area)) +
  geom_histogram()

grafico_14

grafico_15 <- ggplot(data = midwest, mapping = aes(x = area)) +
  geom_histogram(bins = 10)

grafico_15

oh_wi <- c("OH", "WI")

grafico_16 <- ggplot(data = subset(midwest, state %in% oh_wi),
              mapping = aes(x = percollege, fill = state)) +
  geom_histogram(bins = 20, alpha = 0.4)

grafico_16

grafico_17 <- ggplot(data = midwest,  mapping = aes(x = area)) +
  geom_density()

grafico_17

grafico_18 <- ggplot(data = midwest,  mapping = aes(x = area, fill = state, color = state)) +
  geom_density(alpha = 0.3)

grafico_18

grafico_19 <- ggplot(data = subset(midwest, state %in% oh_wi), 
              mapping = aes(x = area, fill = state, color = state)) +
  geom_density(alpha = 0.3, mapping = aes(y = after_stat(scaled)))

grafico_19

grafico_20 <- ggplot(data = titanic, mapping = aes(x = fate, y = percent, fill = sex)) +
  geom_bar(position = "dodge", stat = "identity") +
  theme(legend.position="top")

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