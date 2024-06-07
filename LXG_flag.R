library(tidyverse)

IN <- "pids_2nd.faa.tsv"

LXG <- "IPR006829"

NAMES <- c(
  "pid",
  "md5",
  "length",
  "analysis",
  "memberDB",
  "memberDB_txt",
  "start",
  "end",
  "score",
  "recommended",
  "date",
  "interpro",
  "interpro_txt",
  "GO",
  "residue"
)



iscan <- read_tsv(IN, col_names = NAMES)

iscan <- iscan |>
  filter(interpro == LXG)

iscan <- iscan |>
  select(pid, interpro, interpro_txt) |>
  distinct()

iscan$LXG <- TRUE

neighW<- read_tsv("second_from_endoV.tsv")


out <- left_join(neighW, iscan, join_by(pid == pid)) |>
  relocate(pid, LXG)

out$LXG[is.na(out$LXG)] <- FALSE

write_tsv(out, "LXG_on_second.tsv")
