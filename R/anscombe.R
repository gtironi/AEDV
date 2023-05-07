# limpa o workspace -----------------------------------------------------
rm(list = ls())

# carrega os pacotes ----------------------------------------------------
library(ggplot2)

ggplot(anscombe, aes(x = x1, y = y1)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE)

ggplot(anscombe, aes(x = x2, y = y2)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE)

ggplot(anscombe, aes(x = x3, y = y3)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE)

ggplot(anscombe, aes(x = x4, y = y4)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE)

