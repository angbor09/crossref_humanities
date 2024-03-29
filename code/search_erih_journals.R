library(rcrossref)

# Search ERIH print ISSNs in Crossref
print.issn <- c('') # introduce print ISSNs of ERIH journals

df_print <- rcrossref::cr_journals(issn = print.issn, .progress = 'text')

df_print$data

library(purrr)

revistes.print <- purrr::pluck(df_print, "data")

write.table(revistes.print, file = "erih_print", sep = "\t")


# Search ERIH online ISSNs in Crossref
online.issn <- c('') # introduce online ISSNs of ERIH journals

df_online <- rcrossref::cr_journals(issn = online.issn, .progress = 'text')

df_online$data

library(purrr)

revistes.online <- purrr::pluck(df_online, "data")

write.table(revistes.online, file = "erih_online", sep = "\t")
