count <- rep(0, 1000000)
for (i in 1:1000000) {
  a_arrival <- sample(1:60, 1)
  b_arrival <- sample(1:60, 1)
  count[i] <- ifelse(abs(a_arrival - b_arrival) < 15, 1, 0)
}
sum(count)/length(count)
7/16

b_arrival <- NULL
for(i in 1:60) {
  tmp <- rep(i, 60)
  b_arrival <- c(b_arrival, tmp)
}

library(dplyr)
df <- data.frame(a_arrival = rep(1:60, 60*60),
                 b_arrival = b_arrival)
df <- mutate(df, interval = abs(a_arrival - b_arrival))
df <- mutate(df, capture = ifelse(interval < 15, 1, 0))





#### Random ####
results <- rep(0, 100000)
for (i in 1:100000) {
  srs <- sample(0:9, 4)
  results[i] <- as.numeric(paste0(srs[1], srs[2])) * as.numeric(paste0(srs[3], srs[4]))
}
mean(results)

