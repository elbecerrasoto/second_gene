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



iscan <- read_tsv(IN, col_names = NAMES, na = c("-", "NA", ""))

iscan_lxg <- iscan |>
  filter(interpro == LXG)

iscan_lxg <- iscan_lxg |>
  select(pid, interpro, interpro_txt) |>
  distinct()

iscan_lxg$LXG <- TRUE

neighW <- read_tsv("second_from_endoV.tsv")


out <- left_join(neighW, iscan_lxg, join_by(pid == pid)) |>
  relocate(pid, LXG)

out$LXG[is.na(out$LXG)] <- FALSE

# write_tsv(out, "LXG_on_second.tsv")


# find other IPR_IDS ------------------------------------------------------

library(stringr)

rm_na <- function(x) {
  x[!is.na(x)]
}


collapse_ipr <- function(x) {
  str_flatten(
    unique(rm_na(x)),
    collapse = ";"
  )
}


pids_doms <- iscan |>
  select(pid, interpro) |>
  group_by(pid) |>
  summarize(domains = collapse_ipr(interpro))

# write_tsv(pids_doms, "pids_doms.tsv")
