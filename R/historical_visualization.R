# limpa o workspace -----------------------------------------------------
rm(list = ls())

# carregando os pacotes -------------------------------------------------
library(reshape2)
library(ggplot2)
library(stats)

# preparando o dado para o ggplot2 --------------------------------------

## Dado retirado de https://plot.ly/~MattSundquist/2404/exports-and-imports-to-and-from-denmark-norway-from-1700-to-1780/#plot
playfair <- readRDS("william_playfair.rds")

## cria min para o geom_ribbon
playfair$min <- with(playfair, pmin(exp, imp))
year <- playfair$year

## melt data
molten_data <- melt(playfair,  id.vars = c("year", "min"))

# ggplot2 ---------------------------------------------------------------

ggplot(molten_data, aes(x = year, y = value)) + 
  geom_line(aes(col = variable), size  = 1.1) +
  geom_ribbon(aes(ymin = min, ymax = value, fill = variable), alpha = 0.3) +
  scale_color_manual(values = c("darkred", "gold3"), guide = "none") + 
  scale_fill_manual(values = c("#90752d", "#BB5766"), guide = "none") + 
  theme_bw() + 
  annotate("text", x = year[5],        y = 101000, label = "Line", angle = 25, size = 3) +
  annotate("text", x = year[6] - 100,  y = 105000, label = "of",  angle = 0, size = 3) +
  annotate("text", x = year[7],        y = 102000, label = "Imports", angle = 340, size = 3) +
  annotate("text", x = year[5] + 400,  y = 72800,  label = "Line",  angle = 345, size = 3) +
  annotate("text", x = year[6],        y = 69800,  label = "of",  angle = 330, size = 3) +
  annotate("text", x = year[7] - 200,  y = 63600,  label = "Exports",  angle = 335, size = 3) +
  annotate("text", x = year[8],        y = 83000,  label = "italic('BALANCE AGAINST')",  angle = 0, parse = TRUE) +
  annotate("text", x = year[16] + 400, y = 110000, label = "italic('BALANCE in\nFAVOUR of\nENGLAND')",  angle = 0, parse = TRUE) +
  annotate("text", x = year[16],       y = 80800,  label = "Imports",  angle = 28, size = 3) +
  annotate("text", x = year[14] + 100, y = 131000, label = "Exports",  angle = 65, size = 3) +
  annotate("text", x = year[4],  y = 145000,  label = "Frederick IV", size = 6) +
  annotate("text", x = year[8]+1100,  y = 145000,  label = "Christian VI", size = 6) +
  annotate("text", x = year[12]+200,  y = 165000,  label = "Frederick V", size = 6) +
  annotate("text", x = year[17],  y = 45000,  label = "Christian VII", size = 6) +
  ggtitle("Exports and Imports to and from DENMARK & NORWAY from 1700 to 1780") + 
  scale_x_date(breaks = seq(year[1], year[18], by = "10 years"), 
               labels = format(seq(year[1], year[18], by = "10 years"), "%Y")) + 
  scale_y_continuous(breaks = seq(0, 190e3, 10e3), 
                     labels = seq(0, 190, 10),
                     position = "right",
                     limits = c(10000, NA)) +
  theme(title = element_text(size = 14, face = 'bold'),
        plot.title = element_text(hjust=0.5),
        axis.title = element_blank(),
        axis.text = element_text(), 
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(color = "#c8c8c6"),
        panel.background = element_rect(fill = "#fcfcfa")) +
  geom_vline(xintercept = year[7], linetype = "dashed") +
  geom_vline(xintercept = year[10]+300, linetype = "dashed") +
  geom_vline(xintercept = year[15]+100, linetype = "dashed")

