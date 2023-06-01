library(gapminder)
library(ggplot2)
library(socviz)
library(tidyverse)
library(dplyr)
library(ggrepel)

theme_set(theme_classic())

grafico_1 <- ggplot(gapminder, aes(x = year, y = gdpPercap)) +
  geom_line()

grafico_1

grafico_2 <- ggplot(gapminder, aes(x = year, y = gdpPercap)) +
  geom_line(aes(group=country), color = "#0072B2")

grafico_2

grafico_3 <- ggplot(gapminder, aes(x = year, y = gdpPercap)) +
  geom_line(aes(group=country), color = "#0072B2") +
  facet_wrap(~continent)

grafico_3

grafico_4 <- ggplot(gapminder, aes(x = year, y = gdpPercap)) +
  geom_line(color = "gray70", aes(group=country)) +
  geom_smooth(size=1.1, method="loess", se=FALSE, color = "#E69F00") +
  scale_y_log10(labels=scales::dollar) +
  facet_wrap(~ continent, ncol=5) +
  labs(x = "Ano",
       y = "PIB per capita",
       title = "PIB per capita em cinco continentes")

grafico_4