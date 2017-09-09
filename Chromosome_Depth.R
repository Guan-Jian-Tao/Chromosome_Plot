library(ggplot2)
args <- commandArgs(TRUE)
coverage <- args[1]
data <- read.table(coverage,sep="\t") #¶ÁÈ¡Êý¾Ý
head(data)
data[,4] <- log2(data[,4])
max_value <- ceiling(max(data[,4]))
head(data)
color <- "#FF8247"
png(args[2],width = 1000,height = 2500)
p<-ggplot(data)+facet_grid(V1~.)+
  geom_bar(aes(x=V2/1000000,V4,colour=color),size=1,stat="identity") 
p+theme(
  strip.text.y=element_text(angle=0,face="bold",hjust=0,size=20),
  legend.position="none",panel.grid.minor=element_blank(),
  panel.grid.major=element_blank(),
  plot.title=element_text(size=20,face="bold"),
  axis.text.y=element_text(size=20,angle=50,face="bold"),
  axis.text.x=element_text(size=20,face="bold"),
  strip.background=element_blank(),
  panel.background=element_rect(fill="white"),
  axis.line=element_line(linetype=1)
)+
  scale_colour_manual(values=color)+
  scale_y_continuous(breaks=c(0,max_value))+
  labs(title="Reads Density in Chromosomes")+
  xlab("chromosome position(Mb)")+
  ylab("reads density(log2)")+theme(axis.title = element_text(face="bold",size=20))

dev.off()


