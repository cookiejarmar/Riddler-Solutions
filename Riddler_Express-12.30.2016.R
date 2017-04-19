set.seed(1111)
results <- NULL
speak <- rep(1:13, 4)
for (i in 1:100000) {
  card <- sample(1:13, 13, replace = FALSE)
  card <- c(card, sample(1:13, 13, replace = FALSE))
  card <- c(card, sample(1:13, 13, replace = FALSE))
  card <- c(card, sample(1:13, 13, replace = FALSE))
  results[i] <- sum(card == speak)
}
sum(results == 0)/length(results)
