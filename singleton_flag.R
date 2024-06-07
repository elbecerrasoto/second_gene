library(tidyverse)

IN <- "neighborhoods_bsub.tsv"

neigh <- read_tsv(IN)

neigh <- neigh |>
  filter(Nseq == 0)

flag <- neigh |>
  group_by(genome) |>
  summarise(n = n())

flag$singleton <- flag$n == 1
flag$blast_pair <- flag$n == 2

IN_SEC <- "LXG_on_second.tsv"

lxg <- read_tsv(IN_SEC)

OUT <- left_join(lxg, flag, join_by(genome == genome)) |>
  relocate(genome, pid, LXG, blast_pair) |>
  select(-n, -singleton) |>
  rename(from_endoV = Nseq)

# view(OUT)

IN_all_bsub <- "1423_refseq.tsv"
all_1423 <- read_tsv(IN_all_bsub)

SEL_1423 <- c("genome", "org", "tax_id", "level", "date", "owner", "proj", "n_cds", "completeness")

all_1423 <- all_1423 |>
  select(all_of(SEL_1423))

OUT2 <- left_join(all_1423, OUT, join_by(genome == genome)) |>
  relocate(all_of(SEL_1423[-1]), .after = interpro_txt)

# from neg to pos

# Other domains ...?
# Super interesting ...
# NO pid
# NO LXG
# NO pair

OUT2 <- OUT2 |>
  arrange(desc(is.na(pid)), LXG, blast_pair)
# view(OUT2)

# WTFFFFF!!!!!!!!!!!!
# GCF_018603715.1
# WP_003242882.1


IN_SEQ <- "2nd_pids.tsv"
seqs <- read_tsv(IN_SEQ, col_names = c("pid", "seq"))

OUT2 <- left_join(OUT2, seqs, join_by(pid == pid))


doms <- read_tsv("pids_doms.tsv")

OUT2 <- left_join(OUT2, doms, join_by(pid == pid))


# write_tsv(OUT2, "Bsub_2ndFromEndoV.tsv")
