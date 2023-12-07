setwd("/Users/jordan.Mac/Desktop/college/clarkson/fall23/stats_project") # change this
cat("\f") # clean the console
rm(list = ls()) # clean the environment
# Lets read the data
# library(readxl)
df <- read.csv("fighterjetcosts.csv")

#df$vs <- factor(df$vs)
# Perform multiple linear regression
fit_mlr <- lm(FlyawayCost ~ Thrust + Climb + MTOW, data = df)

# Print the summary of the regression model
print(summary(fit_mlr))

res <- resid(fit_mlr)
plot(fitted(fit_mlr), res, main = "Residual Plot for Multi-Linear Regression",
     xlab = "Fitted", ylab = "Residual")
abline(0,0) # horizontal line at (0,0)

qqnorm(res) # make a Q-Q plot
qqline(res) # add diagonal line



