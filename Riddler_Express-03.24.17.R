# Riddler Express 3/24/17

run_total <- NULL
for (j in 1:1000){
location <- 0
for (i in 2:1001) {
  move <- ifelse(location[i-1] == 0, 
                 sample(c(1, 0, 0, 0), 1), 
                 sample(c(-1, -1, 0, 1), 1))
  location[i] <- location[i-1] + move
  location[i] <- ifelse(location[i] < 0, 0, location[i])
}
location <- location[2:1001]
run_total[j] <- sum(location == 0) / 1000
}
mean(run_total)
