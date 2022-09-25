library(tidyverse)
library(palmerpenguins)
library(ggplot2)
glimpse(penguins)

ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g))+
  geom_point(color="purple")

ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g))+
  geom_point(aes(shape=species))

ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g))+
  geom_point(aes(color=species,
                 shape=species)) + facet_wrap(~sex)

