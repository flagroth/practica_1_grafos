library(igraph)


df <- read.table("data/out.ego-twitter")
g <- graph_from_data_frame(df)
g <- simplify(g)

# V(g)$size <- 8
# V(g)$frame.color <- "white"
# V(g)$color <- "orange"
# V(g)$label <- "" 
# E(g)$arrow.mode <- 0
# l <- layout_with_kk(g,maxiter = 100)
# plot(g, edge.arrow.size=.4,vertex.label=NA,layout=l)

deg <- degree(g)
summary(deg)
