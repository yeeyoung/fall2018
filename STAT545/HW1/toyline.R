a <- 2
b <- -3
sigSq <- 0.5
x <- runif(40)
y <- a + b * x + rnorm(40, sd = sqrt(sigSq))
(avgX <- mean(x))
write(avgX,'avgX.txt')
plot(x,y)
abline(a, b, col = 'purple')
dev.print(pdf, 'toylinePlot.pdf')
