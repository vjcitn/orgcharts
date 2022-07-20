library(ggplot2)
library(reshape2)
library(RColorBrewer)
cbbPalette2 <- c("#000000", "#E69F00", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
cbbPalette <- c("#000000", "#0072B2", "#CC79A7", "#D55E00")
x = read.csv("Hubgantt.csv", allowEscapes=TRUE)
#x$title[1] = "Inclusive CGDS\nStrategy Setup"
nn = melt(x, measure.vars=c("start", "end")) 
nn$title = ordered(nn$title, levels=unique(rev(x$title)))
nn$level = ordered(nn$level, levels=rev(c("focus", "deliverable", "process")))
ggplot(nn,  aes(value, title, colour=level, size=4)) + geom_line(size=4) + 
   xlab("Project quarter; abbr: WP=working paper, TTT='train the trainer'") +  ylab(NULL) + theme(text = element_text(size = 24)) +
  scale_colour_manual(values=brewer.pal(3, "Dark2")) +
  scale_x_continuous(breaks = seq(0, 20, 4))

# theme(panel.grid.major.x = element_blank(),
#        panel.grid.minor.x = element_blank())
# To use for fills, add
