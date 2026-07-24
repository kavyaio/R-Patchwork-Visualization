library(ggplot2)
library(patchwork)

p1 <- ggplot(mtcars,aes(x=wt,y=mpg))+
  geom_point(color="#2E86DE",pch=19,alpha=0.8)+
  labs(title="Relationship Between Vehicle Weight and Fuel Efficiency",x="Vehicle Weight (1000 lbs)",y="Fuel Efficiency (Miles per Gallon)")+
  annotate("text",y=31,x=4.5,label="Heavier Cars → Lower MPG",fontface="bold",color="#2E86DE",size=3,alpha=0.8)+
  theme_light(base_size=12)+
  theme(plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 13))
      


p2 <- ggplot(mpg, aes(x=class))+
  geom_bar(linewidth = 1,fill="#F39C12",color="black",alpha=0.6)+
  coord_flip()+
  labs(title= "Number of Vehicles in Each Class",x = "Vehicle Class", y="Number of Vehicles")+
  theme_light(base_size=12)+
  theme(plot.title = element_text(
    hjust = 0.5,
    face = "bold",
    size = 13))
  


p3 <- ggplot(mpg,aes(x=class,y =hwy,fill=class))+
  geom_boxplot(outlier.shape=8)+
  labs(title="Highway Fuel Efficiency Across Vehicle Classes",x="Vehicle Class",y="Highway Fuel Efficiency (MPG)")+
  theme_light(base_size=12)+
  scale_fill_brewer(palette="Set2")+
  theme(legend.position = "bottom",plot.title = element_text(hjust = 0.5,face = "bold", size = 13))

p4 <- ggplot(data = mpg, aes(x = cty,fill=drv)) + 
  geom_histogram(binwidth = 2,color="white",alpha=0.7) +
  scale_fill_manual(values = c("4" = "#FF6B6B", "f" = "#4DABF7", "r" = "#FCC419"),
                    labels = c("4" = "4-Wheel", "f" = "Front-Wheel", "r" = "Rear-Wheel"))+
  labs(title = "HISTOGRAM(City Fuel Economy Distribution)", x = "City Fuel Economy (MPG)", y = "Number of Vehicles") +
  theme_light()+
  theme(legend.position ="bottom",plot.title = element_text(hjust = 0.5,face = "bold",size = 13))

(((p1|p2)/(p3|p4))) + plot_annotation(title = "MPG Dataset Visualization using ggplot2 & Patchwork",
                                      theme = theme( plot.title = element_text(size=16,face="bold",hjust=0.5)))

