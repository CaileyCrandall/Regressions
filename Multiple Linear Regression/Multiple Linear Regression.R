df <- read.csv("C:/Users/Cailey/OneDrive - University of South Florida/USF/Spring 26/Stats 2/Regressions/Multiple Linear Regression/Data/Salary.csv")


head(df)

library(corrplot)

correlation <- cor(df)
corrplot(correlation)

plot(df$Employment..in.years., df$Salary)
plot(df$Experience..in.years., df$Salary)
plot(df$Education..in.years., df$Salary)

model <- lm(Salary ~ Employment..in.years. + Experience..in.years. + Education..in.years. , data = df)

summary(model)