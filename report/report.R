usePackage <- function(p) {
  if (!is.element(p, installed.packages()[,1]))
    install.packages(p, dep = TRUE)
  require(p, character.only = TRUE)
}

usePackage("ggplot2")
usePackage("ggforce")
usePackage("data.table")


folder = "e5-4620"
folder = "i5-2500k"
res <- data.table(read.csv(paste0("../",folder, "/results.csv"),
                           sep=" ", 
                           col.names = c("version","scale","type","run","clients","tps")))

ggplot(data = res[type=="read-only"][run==3],
       aes(x=clients, 
           y=tps, 
           group=version, 
           colour=version)) + facet_grid(scale ~ .)+
  geom_line() + geom_point() + ggtitle(paste0("pgbench ", folder, " read-only"))


ggplot(data = res[type=="read-write"][run==3],
       aes(x=clients, 
           y=tps, 
           group=version, 
           colour=version)) + facet_grid(scale ~ .)+
  geom_line() + geom_point() + ggtitle(paste0("pgbench ", folder, " read-write"))


ggplot(data = res[type=="read-only"][run==3],
       aes(x=clients, 
           y=tps, 
           group=version, 
           colour=version)) + facet_grid(scale ~ substr(version, 1, 1))+
  geom_line() + geom_point() + ggtitle(paste0("pgbench ", folder, " read-only"))


ggplot(data = res[type=="read-write"][run==3],
       aes(x=clients, 
           y=tps, 
           group=version, 
           colour=version)) + facet_grid(scale ~ substr(version, 1, 1))+
  geom_line() + geom_point() + ggtitle(paste0("pgbench ", folder, " read-write"))


#aes(linetype = variable)
