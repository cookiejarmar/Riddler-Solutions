df <- data.frame(location = c("me", "90 degree point", "person"),
           x = c(0, 100, 100),
           y = c(0, 0, 100))

ggplot() +
  geom_point(data = df, aes(x = x, y = y, color = location), size = 5)



run.speed <- 15/100  # secends/meter
swim.speed <- 75/100  # seconds/meter
total.dist.x <- 100  # meters
total.dist.y <- 100  # meters
total.time <- NULL
dist.z <- NULL
for (i in 1:100) {
  dist.x <- i
  dist.z[i] <- sqrt((100 - dist.x)^2 + total.dist.y^2)  # meters
  total.time[i] <- run.speed * dist.x + swim.speed * dist.z[i]  # seconds
}
baseline <- run.speed*total.dist.x + swim.speed*total.dist.y
results <- data.frame(dist.x = 1:100,
                      dist.z = dist.z,
                      toatl.time = total.time)
ggplot(data = results) + 
  geom_line(aes(x = dist.x, y = total.time), color = "red")


# closer inspection
run.speed <- 15/100  # secends/meter
swim.speed <- 75/100  # seconds/meter
total.dist.x <- 100  # meters
total.dist.y <- 100  # meters
total.time <- NULL
dist.z <- NULL
sequence <- seq(79.5875, 79.5876, by = .00001)
for (i in sequence) {
  dist.x <- i
  dist.z.tmp <- sqrt((100 - dist.x)^2 + total.dist.y^2)  # meters
  dist.z <- c(dist.z, dist.z.tmp)
  total.time.tmp <- run.speed * dist.x + swim.speed * dist.z.tmp  # seconds
  total.time <- c(total.time, total.time.tmp)
}
baseline <- run.speed*total.dist.x + swim.speed*total.dist.y
results <- data.frame(dist.x = sequence,
                      dist.z = dist.z,
                      toatl.time = total.time)
ggplot(data = results) + 
  geom_line(aes(x = dist.x, y = total.time), color = "red")

#### ANSWER -> x = 79.5876 so total.time = 88.48469 seconds

x <- 79.5876
.15*x + .75*sqrt(x^2 - 200*x + 20000)
