# Project code for STAT 383 final project
#
# This program creates a variety of linear regression models for important
# explanatory variables within our dataset. Each model is trying to predict
# the dependent variable Flyaway Cost. This program also creates a couple
# multiple linear regression models in order to find the most accurate 
# prediction model.
#
# Author: Ryan Quirk

setwd("D:\\Stats\\code\\") # Set to directory that contains csv file
cat("\f") # clean the console
rm(list = ls()) # clean the environment

# Import useful libraries and data
library(ggplot2)
df <- read.csv("fighterjetcosts.csv")

# Summarize variables
print(summary(df))


# Create linear regression models
# Cost v Thrust
plot(df$Thrust, df$FlyawayCost, main = "Flyaway Cost vs Thrust",
     xlab = "Thrust", ylab = "Flyaway Cost",
     pch = 1)
fit_lm <- lm(FlyawayCost ~ Thrust, data = df)
abline(fit_lm, col = "red")
print(summary(fit_lm))

# Cost v FFD
plot(df$FFD, df$FlyawayCost, main = "Flyaway Cost vs First Flyaway Date",
     xlab = "FFD", ylab = "Flyaway Cost",
     pch = 1)
fit_lm <- lm(FlyawayCost ~ FFD, data = df)
abline(fit_lm, col = "red")
print(summary(fit_lm))

# Cost v Climb
plot(df$Climb, df$FlyawayCost, main = "Flyaway Cost vs Climb",
     xlab = "Climb", ylab = "Flyaway Cost",
     pch = 1)
fit_lm <- lm(FlyawayCost ~ Climb, data = df)
abline(fit_lm, col = "red")
print(summary(fit_lm))

# Cost v MTOW
plot(df$MTOW, df$FlyawayCost, main = "Flyaway Cost vs Moving Take Off Weight",
     xlab = "MTOW", ylab = "Flyaway Cost",
     pch = 1)
fit_lm <- lm(FlyawayCost ~ MTOW, data = df)
abline(fit_lm, col = "red")
print(summary(fit_lm))


# Create multiple linear regression models
# Cost v Thrust MTOW Climb FFD
multiple.regression <- lm(FlyawayCost ~ Thrust + MTOW + Climb + FFD, data=df)
print(summary(multiple.regression))


# Cost v Thrust MTOW Climb 
multiple.regression <- lm(FlyawayCost ~ Thrust + MTOW + Climb, data=df)
print(summary(multiple.regression))


# Cost v Thrust FFD
multiple.regression <- lm(FlyawayCost ~ Thrust + FFD, data=df)
print(summary(multiple.regression))


# Gather R^2 values of categorical variables - basAvionics, advAvionics, Stealth
fit_lm <- lm(FlyawayCost ~ basAvionics, data = df)
print(summary(fit_lm))

fit_lm <- lm(FlyawayCost ~ advAvionics, data = df)
print(summary(fit_lm))

fit_lm <- lm(FlyawayCost ~ Stealth, data = df)
print(summary(fit_lm))


