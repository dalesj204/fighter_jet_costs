setwd("/Users/jordan.Mac/Desktop/college/clarkson/fall23/stats_project") # change this
cat("\f") # clean console
rm(list = ls()) # clean environment
dev.off() # clean previous plots

# read the data
df <- read.csv("fighterjetcosts.csv")

#df$vs <- factor(df$vs)
# multiple linear regression
fit_mlr <- lm(FlyawayCost ~ Thrust + Climb + MTOW + FFD, data = df)

# print the summary of the regression model
print(summary(fit_mlr))

# summary of 2nd regression model (thrust and FFD only)
fit_mlr2 <- lm(FlyawayCost ~ Thrust + FFD, data = df)
print(summary(fit_mlr2))


# extras
res <- resid(fit_mlr)
plot(fitted(fit_mlr), res, main = "Residual Plot for Multiple Linear Regression",
     xlab = "Fitted", ylab = "Residual")
abline(0,0, col = "red") # horizontal line at (0,0)

qqnorm(res) # make a Q-Q plot
qqline(res, col = "red") # add diagonal line

plot(density(res), main="Density Plot", col = "red") # density plot to verify ~N

