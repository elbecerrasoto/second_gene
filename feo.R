library(tidyverse)

mean_NAR <- partial(mean, na.rm = TRUE)
sum_NAR <- partial(sum, na.rm = TRUE)

awhich <- function(x) {
  y <- vector(mode = "logical", length = max(x))
  y[x] <- TRUE
  y
}


IN <- "neighborhoods_bsub.tsv"

neigh <- read_tsv(IN)
names(neigh)


library(nycflights13)


flights |>
  filter(dep_time > 600 & dep_time, )



?ungroup

flights |>
  filter(arr_delay > 0) |>
  group_by(year, month, day) |>
  summarize(
    behind = mean(arr_delay),
    n = n(),
    .groups = "drop")


mean_NAR <- partial(mean, na.rm = TRUE)

sum_NAR <- partial(sum, na.rm = TRUE)
NA + 23 + 34

flights |>
  group_by(year, month, day) |>
  summarize(
    ahead = mean_NAR(arr_delay <= 0),
    behind = mean_NAR(arr_delay > 0),
    n_day = n(),
    n_ahead = sum_NAR(arr_delay <= 0),
    n_behind = sum_NAR(arr_delay > 0),
    .groups = "drop")


get_0s_and_2s <- function(neigh) {
  print("hello world")
}


Nseq_filter <- Nseq == 0
Nseq_which <- which(Nseq_filter)

detach(neigh)


zeros <- neigh |>
  filter(Nseq == 0, q_alias == "endo")

zeros_pos # which
zesos_fil # awhich

attach(neigh)

zeros_pos <- which(Nseq == 0 & q_alias == "endo")
relevant_pos <- sort(c(zeros_pos - 2, zeros_pos, zeros_pos + 2))

length(zeros_pos) * 3
length(relevant_pos)


RELEVANT_COLS <- c("Nseq",
                   "pid",
                   "q_alias",
                   "strand")

relevant_sub <- neigh[relevant_pos,][RELEVANT_COLS]

view(relevant_sub)


function(x)


# Machinen Representation
# Mind Representation

attach(neigh)

class(logical_NA)
NA_character_

NA
if (NA) {
  print("Hello World")
}


names(neigh)


in_vec <- c(1,2,5,10)
out_vec <- vector(mode = "logical", length = max(in_vec))

out_vec[in_vec] <- TRUE



x <- which(Nseq == 0)[1:2]
x
awhich(x)


sum(x <- 1:10)
print(x <- 1:10)

?which
(Nseq == 0)










