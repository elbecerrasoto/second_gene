#!/usr/bin/Rscript

suppressPackageStartupMessages({
  library(tidyverse)
})

assert <- function(assertion, msg) {
  assert_l <- list(assertion)
  names(assert_l) <- msg
  do.call(stopifnot, assert_l)
}


args <- commandArgs(trailingOnly = TRUE)

assert(
  length(args) == 1,
  "Script accepts only one argument:
    Neighborhood Table."
)

IN <- args[1]
# IN <- "neighborhoods_bsub.tsv"

RELEVANT_COLS <- c(
  "Nseq",
  "pid",
  "strand",
  "gene",
  "product",
  "genome",
  "locus_tag"
)


neigh <- read_tsv(IN)


attach(neigh)

zeros_pos <- which(Nseq == 0 & q_alias == "endo")

companions_pos <- if_else(strand[zeros_pos] == "-",
  zeros_pos + 2,
  zeros_pos - 2
)

relevant_pos <- sort(c(zeros_pos, companions_pos))

detach(neigh)


neigh <- neigh[relevant_pos, ][RELEVANT_COLS]
# write_tsv(neigh, "second_from_endoV_large.tsv")

neigh |>
  filter(Nseq != 0) |>
  format_tsv() |>
  writeLines(stdout(), sep = "")
