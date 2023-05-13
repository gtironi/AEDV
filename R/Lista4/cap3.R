library("ggplot2")
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

p9 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(color = "purple") +
  geom_smooth(method =  "loess") + 
  scale_x_log10()

p9

p10 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(alpha = 0.3) +
  geom_smooth(color = "orange", se = FALSE, size = 8, method =  "lm") + 
  scale_x_log10()

p10


p11 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(alpha = 0.3) +
  geom_smooth(method =  "lm") + 
  scale_x_log10(labels = scales::dollar) +
  labs(x = "GDP Per capita", y = "Life Expectancy in Years",
       title = "Economic Growth and Life Expectancy",
       subtitle = "Data points are country-years",
       caption = "Source: Gapminder.")

p11

p12 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent, fill = continent)) + 
  geom_point() +
  geom_smooth(method =  "loess") + 
  scale_x_log10()

p12

p13 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() +
  geom_smooth(method =  "loess") + 
  scale_x_log10()

p13

p14 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(mapping = aes(color = continent)) +
  geom_smooth(method =  "loess") + 
  scale_x_log10()

p14

p15 <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(mapping = aes(color = log(pop))) +
  scale_x_log10()

p15
