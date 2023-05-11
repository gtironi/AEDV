# carrega os pacotes ----------------------------------------------------
library(ggplot2)
library(gridExtra)
library(grid)

# Definindo os gráficos -------------------------------------------------

p1 <- ggplot(anscombe, aes(x = x1, y = y1)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE, fullrange = TRUE) +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_y_continuous(breaks = seq(4, 12, 2),
                     limits = c(4, 12)) +
  scale_x_continuous(breaks = seq(4, 18, 2),
                     limits = c(4, 18))

p2 <- ggplot(anscombe, aes(x = x2, y = y2)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE, fullrange = TRUE) +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_y_continuous(breaks = seq(4, 12, 2),
                     limits = c(4, 12)) +
  scale_x_continuous(breaks = seq(4, 18, 2),
                     limits = c(4, 18))

p3 <- ggplot(anscombe, aes(x = x3, y = y3)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE, fullrange = TRUE) +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_y_continuous(breaks = seq(4, 12, 2),
                     limits = c(4, NA)) +
  scale_x_continuous(breaks = seq(4, 18, 2),
                     limits = c(4, 18))

p4 <- ggplot(anscombe, aes(x = x4, y = y4)) +
  geom_point() +
  geom_smooth(method = "lm", color = "Red", se = FALSE, fullrange = TRUE) +
  theme_test() +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_y_continuous(breaks = seq(4, 12, 2),
                     limits = c(4, NA)) +
  scale_x_continuous(breaks = seq(4, 18, 2),
                     limits = c(4, NA))

# plotando os gráficos juntos -------------------------------------------
grid.arrange(p1, p2,
             p3, p4,
             ncol=2, nrow=2,
             top = textGrob("Quarteto de Anscombe",gp=gpar(fontsize=28,font=2)))