library("tidyverse")
library("gapminder")

p1 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()

p1

p2 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_smooth()

p2

p3 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth()

p3

p4 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth(method =  "lm")

p4

p5 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth(method =  "lm") + 
  scale_x_log10()

p5

p6 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth(method =  "lm") + 
  scale_x_log10(labels = scales::dollar)

p6

p7 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point() +
  geom_smooth(method =  "loess") + 
  scale_x_log10()

p7

p8 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = "purple")) + 
  geom_point() +
  geom_smooth(method =  "loess") + 
  scale_x_log10()

p8

p9 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = "purple")) + 
  geom_point() +
  geom_smooth(method =  "loess") + 
  scale_x_log10()

p9

