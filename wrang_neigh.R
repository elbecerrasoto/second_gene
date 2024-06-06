library(tidyverse)

IN <- "neighborhoods_bsub.tsv"
RELEVANT_COLS <- c(
  "Nseq",
  "pid",
  "q_alias",
  "strand"
)


neigh <- read_tsv(IN) |>
  select(RELEVANT_COLS)


attach(neigh)
zero_pos <- which(Nseq == 0 & q_alias == "endo")
relevant_pos <- sort(c(zero_pos - 2, zero_pos, zero_pos + 2))
detach(neigh)


neigh <- neigh[relevant_pos, ]

view(neigh)
