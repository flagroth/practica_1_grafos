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

# sg <- subgraph(g, c(190,191,192,193,194,13167))

sg <- induced_subgraph(g, V(g)[which(V(g)$name %in% c("190","191","192","193","194","13167"))])
plot(sg)

# Max followers
which.max(degree(g, mode="in"))
# Max following
which.max(degree(g, mode="out"))

clique_num(g)