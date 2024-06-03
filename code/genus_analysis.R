## 6/3/24
## Following Pat's tutorial: 
# Cleaning and manipulating data with the tidyverse: dplyr, readr, and stringr in action (CC121)
# https://riffomonas.org/code_club/2021-06-30-data-cleaning

library(tidyverse)

shared <- read_tsv("raw_data/baxter.subsample.shared",
         col_types = cols(Group = col_character(),
                   .default = col_double())) %>% 
  rename_all(tolower) %>% 
  select(group, starts_with("otu")) %>% 
  pivot_longer(-group, names_to = "otu", values_to = "count")
  
#R prefers long rather than wide dataframes

read_tsv("raw_data/baxter.cons.taxonomy") %>% 
  rename_all(tolower) %>% 
  select(otu, taxonomy) %>% 
  mutate(otu = tolower(otu),
         taxonomy = str_replace_all(taxonomy, "\\(\\d+\\)", ""))

# Resume video ~10:40
