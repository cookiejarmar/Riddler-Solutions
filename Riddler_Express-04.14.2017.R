# Riddler Express 4/14/17

perm <- function(n, k) choose(n, k) * factorial(k)

b <- perm(15, 5)
i <- perm(15, 5)
n <- perm(15, 4)
g <- perm(15, 5)
o <- perm(15, 5)

b * i * n * g * o