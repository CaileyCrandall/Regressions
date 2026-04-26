# Multiple Non-Linear Regression Analysis: Salary Data

library(corrplot)

df <- read.csv("C:/Users/Cailey/OneDrive - University of South Florida/USF/Spring 26/Stats 2/Regressions/Multiple Linear Regression/Data/Salary.csv")
head(df)
str(df)

# Correlation matrix
correlation <- cor(df)
print(round(correlation, 3))

corrplot(correlation,
         method = "circle",
         type   = "upper",
         tl.col = "black",
         tl.srt = 45,
         title  = "Correlation Matrix",
         mar    = c(0, 0, 1, 0))

# Scatter plots
par(mfrow = c(1, 3), mar = c(4, 4, 3, 1))

plot(df$Education..in.years., df$Salary,
     main = "Salary vs. Education",
     xlab = "Education (in years)",
     ylab = "Salary ($)",
     pch  = 16, col = "steelblue")
abline(lm(Salary ~ Education..in.years., data = df), col = "red", lwd = 2)

plot(df$Experience..in.years., df$Salary,
     main = "Salary vs. Experience",
     xlab = "Experience (in years)",
     ylab = "Salary ($)",
     pch  = 16, col = "steelblue")
abline(lm(Salary ~ Experience..in.years., data = df), col = "red", lwd = 2)

plot(df$Employment..in.years., df$Salary,
     main = "Salary vs. Employment",
     xlab = "Employment (in years)",
     ylab = "Salary ($)",
     pch  = 16, col = "steelblue")
abline(lm(Salary ~ Employment..in.years., data = df), col = "red", lwd = 2)

par(mfrow = c(1, 1))

# Polynomial regression model
model_poly <- lm(Salary ~ poly(Employment..in.years., 2) +
                   poly(Experience..in.years., 2) +
                   poly(Education..in.years., 2),
                 data = df)
summary(model_poly)

cat("Polynomial R-squared:         ", round(summary(model_poly)$r.squared, 4), "\n")
cat("Polynomial Adjusted R-squared:", round(summary(model_poly)$adj.r.squared, 4), "\n")

rmse_poly <- sqrt(mean(residuals(model_poly)^2))
cat("Polynomial RMSE: $", round(rmse_poly, 2), "\n")

# Fitted values plot - polynomial
df$Fitted_poly <- fitted(model_poly)

plot(df$Fitted_poly, df$Salary,
     main = "Actual vs. Fitted (Polynomial)",
     xlab = "Fitted Values ($)",
     ylab = "Actual Salary ($)",
     pch  = 16, col = "steelblue")
abline(a = 0, b = 1, col = "red", lwd = 2, lty = 2)
legend("topleft", legend = "Perfect Fit Line", col = "red", lty = 2, lwd = 2)

# Diagnostic plots - polynomial
par(mfrow = c(2, 2))
plot(model_poly)
par(mfrow = c(1, 1))

# Log transformation model
# Experience + 1 to avoid log(0) since one observation has 0 years of experience
df$log_Employment <- log(df$Employment..in.years.)
df$log_Experience <- log(df$Experience..in.years. + 1)
df$log_Education  <- log(df$Education..in.years.)

model_log <- lm(Salary ~ log_Employment + log_Experience + log_Education,
                data = df)
summary(model_log)

cat("Log R-squared:         ", round(summary(model_log)$r.squared, 4), "\n")
cat("Log Adjusted R-squared:", round(summary(model_log)$adj.r.squared, 4), "\n")

rmse_log <- sqrt(mean(residuals(model_log)^2))
cat("Log RMSE: $", round(rmse_log, 2), "\n")

# Fitted values plot - log
df$Fitted_log <- fitted(model_log)

plot(df$Fitted_log, df$Salary,
     main = "Actual vs. Fitted (Log)",
     xlab = "Fitted Values ($)",
     ylab = "Actual Salary ($)",
     pch  = 16, col = "darkorange")
abline(a = 0, b = 1, col = "red", lwd = 2, lty = 2)
legend("topleft", legend = "Perfect Fit Line", col = "red", lty = 2, lwd = 2)

# Diagnostic plots - log
par(mfrow = c(2, 2))
plot(model_log)
par(mfrow = c(1, 1))

# Model comparison
cat("\nModel Comparison:\n")
cat("                   R-squared   Adj. R-squared   RMSE\n")
cat("Polynomial Model: ", round(summary(model_poly)$r.squared, 4), "      ",
    round(summary(model_poly)$adj.r.squared, 4), "         $",
    round(rmse_poly, 2), "\n")
cat("Log Model:        ", round(summary(model_log)$r.squared, 4), "      ",
    round(summary(model_log)$adj.r.squared, 4), "         $",
    round(rmse_log, 2), "\n")