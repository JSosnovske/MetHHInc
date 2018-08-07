library(tidyverse)
library(tidycensus)
library(ggplot2)
library(dplyr)

library(sf)
library(mapview)
#census_api_key("6fa3249e91f06646ac58ac42e64d8f8c5407da0c")
portland_tract_medhhinc <- get_acs(geography="tract",
                                   year=2016, 
                                   variables="B19013_001", 
                                   state="OR", county=c("Multnomah County", "Washington County", "Clackamas County"),
                                   geometry=TRUE)
myplot <- ggplot(portland_tract_medhhinc) +
  geom_sf(aes(fill=estimate)) +
  coord_sf(datum=NA)+
  theme_minimal()
ggsave("docs/mymap.pdf", myplot)
mapview(portland_tract_medhhinc %>% select(estimate), col.regions=sf.colors(10), alpha=0.1)

## Great job finding the new room after lunch! :) ##
