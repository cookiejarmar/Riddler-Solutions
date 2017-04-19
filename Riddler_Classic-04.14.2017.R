# Riddler Classic 4/14/17

# Simulation of 100,000 election cycles

judge.bench.lengths <- runif(900000, 0, 40)

current.lengths <- NULL
num.current.judges <- NULL
index <- 1

# Iteration 1
year <- 1
judges.to.replace <- 1:9
prez <- sample(c("R", "D"), 1)
senate <- sample(c("R", "D"), 1)
if (prez == senate) {
  current.lengths <- judge.bench.lengths[index:(index + length(judges.to.replace)-1)]
  index <- tail(judges.to.replace, 1) + 1
}
num.current.judges <- ifelse(is.null(current.lengths), 0, length(current.lengths))

# Iteration 2:100000
for (i in 2:100000) {
  year <- year + 4
  current.lengths <- current.lengths - 4
  if (sum(current.lengths <= 0) > 0 | length(current.lengths) == 0) {
    judges.to.replace <- which(current.lengths <= 0)
    current.lengths <- current.lengths[-judges.to.replace]
    if(is.null(current.lengths)) judges.to.replace <- 1:9
    prez <- sample(c("R", "D"), 1)
    senate <- sample(c("R", "D"), 1)
    number.to.fill <- 9-length(current.lengths)
    if (prez == senate) {
      current.lengths <- c(current.lengths,
                           judge.bench.lengths[index:(index + number.to.fill-1)])
      index <- index + number.to.fill
    }
  }
  num.current.judges <- c(num.current.judges, length(current.lengths))
}

# Expected Number of vacancies:
9 - mean(num.current.judges)
