library(tidyverse)
Hospitals <- read.csv("Hospitals.csv")

Hospitals <- filter(Hospitals, !STATE %in% c("PR", "GU", "MP", "AS", "VI", "PW"))

HospitalNumberStates <- Hospitals %>%
  group_by(STATE) %>%
  summarise(n=n())
