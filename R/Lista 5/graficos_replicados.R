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
  geom_bar +
  theme(legend.position="top")

  grafico_10
