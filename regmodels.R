data(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)
str(mtcars)

#pairs(mtcars)
library("GGally")
ggpairs(mtcars, axisLabels = "internal")

library("ggplot2")

g <- ggplot(mtcars, aes(am, mpg))
g <- g + geom_boxplot() + xlab("Transmission Type") + ylab("MPG") + 
        geom_jitter()
print(g)

initial <- lm(mpg ~ ., data = mtcars)
best <- step(initial, direction = "both")
