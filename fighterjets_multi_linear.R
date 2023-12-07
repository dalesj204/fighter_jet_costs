setwd("/Users/jordan.Mac/Desktop/college/clarkson/fall23/stats_project") # change this
cat("\f") # clean console
rm(list = ls()) # clean environment

# read the data
df <- read.csv("fighterjetcosts.csv")

#df$vs <- factor(df$vs)
# multiple linear regression
fit_mlr <- lm(FlyawayCost ~ Thrust + Climb + MTOW, data = df)

# print the summary of the regression model
print(summary(fit_mlr))

# summary of 2nd regression model (thrust and FFD only)
fit_mlr2 <- lm(FlyawayCost ~ Thrust + FFD, data = df)
print(summary(fit_mlr2))


res <- resid(fit_mlr)
plot(fitted(fit_mlr), res, main = "Residual Plot for Multiple Linear Regression",
     xlab = "Fitted", ylab = "Residual")
abline(0,0) # horizontal line at (0,0)

qqnorm(res) # make a Q-Q plot
qqline(res) # add diagonal line

plot(density(res), main="Density Plot") # density plot to verify ~N

