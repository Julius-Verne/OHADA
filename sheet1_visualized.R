
#Bar
ggplot(sheet.one.bar,)

#Pie


#Map
world <- st_as_sf(countries110) %>% 
  filter(sovereignt!="Antarctica")

world.status <- left_join(sheet.one.map, 
                  world, by = c("CountryName"="sovereignt")) 


world.status.two <- left_join(world, 
                              sheet.one.map, by = c("sovereignt"="CountryName"))

world.status.two <- world.status %>% subset(!is.na(scalerank))

ggplot(world.status.two) +
  geom_sf(col="#fafafa", aes(fill=Status)) +
  coord_sf(crs="+proj=robin") +
  scale_colour_manual(values = c("red", "blue", "green", "yellow")) +
  theme_minimal() +
  theme(panel.grid.major = element_line(colour = "transparent"),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        legend.position="none")
