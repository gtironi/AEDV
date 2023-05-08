# limpa o workspace -----------------------------------------------------
rm(list = ls())

# carrega os pacotes ----------------------------------------------------
library(ggplot2)

ggplot(anscombe, aes(x = x1, y = y1)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE) +
  ggtitle("Gráfico x1 vs y1") +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5))

ggplot(anscombe, aes(x = x2, y = y2)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE) +
  ggtitle("Gráfico x2 vs y2") +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5))

ggplot(anscombe, aes(x = x3, y = y3)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE) +
  ggtitle("Gráfico x3 vs y3") +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5))

ggplot(anscombe, aes(x = x4, y = y4)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE) +
  ggtitle("Gráfico x4 vs y4") +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5))

