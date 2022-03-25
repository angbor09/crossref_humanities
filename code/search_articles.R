library(rcrossref)
library(tidyverse)

dois.eng <- c( ) # Introduce DOIs for English outputs

refs.eng <- rcrossref::cr_works(dois.eng, .progress = 'text') # Search dois

refs.eng.2 <- purrr::pluck(refs.eng, "data") # Extract data

length(refs.eng.2$abstract[refs.eng.2$abstract == "NULL"]) # Count no abstract

length(refs.eng.2$funder[refs.eng.2$funder == "NULL"]) # Count no funder

length(refs.eng.2$license[refs.eng.2$license == "NULL"]) # Count no license

refs.eng.3 <- dplyr::select(refs.eng.2, doi, is.referenced.by.count) # Citations

write.table(refs.eng.3, file = "dois_eng", sep = ",")

authors_eng <- tidyr::unnest(refs.eng.2, author, names_repair = "universal")

length(authors_eng$ORCID[authors_eng$ORCID == "NULL"]) # Count no ORCID

length(authors_eng$ORCID[authors_eng$affiliation.name == "NULL"]) # Count no affiliation

# The same code can be applied for outputs in other languages