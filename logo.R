library(igraph)
library(ggraph)
library(tidygraph)
library(ggthemes)

set.seed(42)

g <- sample_smallworld(dim = 1, size = 12,nei = 2, p = 0.1) %>% as_tbl_graph()

g <- g %>% activate(what = "nodes") %>% 
  mutate(color = as.factor(sample(1:4,vcount(g), replace = T)))

p <- ggraph(g, layout = "nicely") + 
  geom_edge_link(color = "#073642", alpha = 0.4) + 
  geom_node_point(size = 8, aes(color = color)) + 
  scale_color_solarized(accent = "magenta") +
  theme_graph(background = NA) + 
  guides(color = FALSE)

p

ggsave(filename = "logo.png", plot = p, 
       width = 4, height = 4, 
       bg = "transparent")

