library(maps)

setwd("~/Desktop/Studi_Yosik/least/code/")
load("../data/topograp.rda")

xor = seq(90,150,10)
yor = seq(-15,15,10)

sxor = parse(text = paste(xor, "*degree ~ S", sep = ""))
syor = c(parse(text = paste(yor[1:2], "*degree ~ LS", sep = "")),
         parse(text = paste(yor[3:4], "*degree ~ LU", sep = "")) )

pdf(file = "../png/legend.pdf", width = 10,height = 6)


filled.contour(topograp$xnya,topograp$ynya,topograp$el,axes = T,
               col = terrain.colors(24),las=0,
plot.axes ={ map("world",xlim = c(90,150),ylim = c(-15,15), fill=F, col="Black", bg=NULL,
                resolution = 0.00001,add = T,);
axis(1, at = xor, labels = sxor,cex.axis = 1);
axis(2, at = yor, labels = syor,cex.axis = 1);
grid()
}
)
dev.off()
