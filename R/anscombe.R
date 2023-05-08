# limpa o workspace -----------------------------------------------------
rm(list = ls())

# carrega os pacotes ----------------------------------------------------
library(ggplot2)

ggplot(anscombe, aes(x = x1, y = y1)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE, fullrange = TRUE) +
  ggtitle("Gráfico x1 vs y1") +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_y_continuous(breaks = seq(4, 12, 2),
                     limits = c(4, 12)) +
  scale_x_continuous(breaks = seq(4, 18, 2),
                     limits = c(4, 18))

ggplot(anscombe, aes(x = x2, y = y2)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE, fullrange = TRUE) +
  ggtitle("Gráfico x2 vs y2") +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_y_continuous(breaks = seq(4, 12, 2),
                     limits = c(4, 12)) +
  scale_x_continuous(breaks = seq(4, 18, 2),
                     limits = c(4, 18))

ggplot(anscombe, aes(x = x3, y = y3)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE, fullrange = TRUE) +
  ggtitle("Gráfico x3 vs y3") +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_y_continuous(breaks = seq(4, 12, 2),
                     limits = c(4, NA)) +
  scale_x_continuous(breaks = seq(4, 18, 2),
                     limits = c(4, 18))

ggplot(anscombe, aes(x = x4, y = y4)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE, fullrange = TRUE) +
  ggtitle("Gráfico x4 vs y4") +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_y_continuous(breaks = seq(4, 12, 2),
                     limits = c(4, NA)) +
  scale_x_continuous(breaks = seq(4, 18, 2),
                     limits = c(4, NA))