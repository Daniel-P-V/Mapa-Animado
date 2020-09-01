library(dplyr)
library(ggplot2)
library(gganimate)
library(sf)
library(haven)
library(gifski)
# importamos shape de region
region <- st_read("R09/comuna.shp")
# importamos ubicacion de colegios
colegios_araucania <- read_dta("Colegios/colegios_r9.dta")
# grafico
plot1 <- ggplot(data = region) + 
  geom_sf(aes(), color = "black", fill = "#99CCFF") + 
  geom_point(data = colegios_araucania, aes(x = longitud, y = latitud), color = "red",
             size = 1.5) +
  transition_states(agno, transition_length = 1, state_length = 20) +
  labs(title = 'Year: {previous_state}') +
  theme_bw()+
  theme(panel.grid.minor = element_blank(),       
        panel.grid.major = element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank())
# ver
plot1
# Exportar (opcional)
anim_save("mapa-colegios.gif", plot1, width = 600, height = 600)
