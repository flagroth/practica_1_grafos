library(igraph)

df <- read.table("/home/javier/practica_1_grafos/data/out.ego-twitter")
g <- graph_from_data_frame(df)
rm(df)

V(g)$size <- 8
V(g)$frame.color <- "white"
V(g)$color <- "orange"
V(g)$label <- "" 
E(g)$arrow.mode <- 1
plot(g)

hist(degree(g))
summary(degree(g))

sg <- induced_subgraph(g, V(g)[which(V(g)$name %in% c("190","191","192","193","194","13167"))])
plot(sg)

# No es fuertemente conexo

# Max followers
which.max(degree(g, mode="in"))
# Max following
which.max(degree(g, mode="out"))

adjacent_vertices(g,V(g)[V(g)$name=="1305"],mode="in")

adjacent_vertices(g,V(g)[V(g)$name=="1373"],mode="out")

id <- V(g)[V(g)$name=="13815"]
length(adjacent_vertices(g,id,mode="in")[[1]])/length(adjacent_vertices(g,id,mode="out")[[1]])

is.connected(g)

cl <- cluster_infomap(g)
print(sizes(cl))

id_com <- which(sizes(cl)==35)
sg <- induced_subgraph(g,V(g)[cl$membership==id_com])
degree(sg)
plot(sg)

id_max <- which.max(sizes(cl))
sg <- induced_subgraph(g,V(g)[cl$membership==id_max])
which.max(closeness(sg))

which.max(betweenness(sg))

