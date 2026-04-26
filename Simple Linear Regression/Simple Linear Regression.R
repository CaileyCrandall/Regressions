# Step 1: Load the data (assign to df)
df <- read.csv("C:/Users/Cailey/OneDrive - University of South Florida/USF/Spring 26/Stats 2/Regressions/Simple Linear Regression/Data/salary.csv")

# Step 2: Confirm it loaded correctly
head(df)
names(df)

class(df$Salary)

plot(df$Employment..in.years., df$Salary)

# Step 3: Build the model
model <- lm(Salary ~ Employment..in.years., data = df)

# Step 4: View results
summary(model)

plot(df$Employment..in.years., df$Salary,
     main = "Employment vs Salary",
     xlab = "Employment (in years)",
     ylab = "Salary",
     pch = 16,
     col = "steelblue")

abline(model, col = "red", lwd = 2)

predict(model, newdata = data.frame(Employment..in.years. = 12))