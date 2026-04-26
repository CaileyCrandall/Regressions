# Salary Regression Analysis

This project explores the relationship between employee salary and three predictors — employment tenure, work experience, and education level — using both multiple linear and multiple non-linear regression models in R.

## Dataset

**File:** `Salary.csv`  
**Observations:** 8  
**Variables:**

| Variable | Description |
|---|---|
| `Salary` | Employee salary in USD |
| `Employment..in.years.` | Years employed at current job |
| `Experience..in.years.` | Years of prior work experience |
| `Education..in.years.` | Years of education completed |

## Project Structure

```
├── Data/
│   └── Salary.csv
├── Multiple Linear Regression/
│   ├── Multiple Linear Regression.R
│   └── Multiple Linear Regression.Rmd
├── Multiple Non-Linear Regression/
│   ├── Multiple Non Linear Regression.R
│   └── Multiple Non Linear Regression.Rmd
└── README.md
```

## Analysis Overview

### Multiple Linear Regression
- Correlation matrix and visualization
- Scatter plots for each predictor vs. salary
- MLR model with employment, experience, and education as predictors
- Evaluation: R², adjusted R², RMSE, F-statistic
- Fitted values plot and diagnostic plots
- Model with interaction terms

### Multiple Non-Linear Regression
- Correlation matrix and scatter plots (same dataset)
- Polynomial (quadratic) regression model
- Log transformation regression model
- Model comparison by R², adjusted R², and RMSE

## Key Findings

- **Employment tenure** is the only statistically significant predictor of salary across all models (p < 0.05)
- The linear model achieved R² = 0.9438 and adjusted R² = 0.9017 with an RMSE of ~$659
- The polynomial model achieved a higher raw R² (0.9755) but was not statistically significant overall (p = 0.2888), likely due to overfitting with only 8 observations
- The log model was statistically significant (p = 0.01977) with R² = 0.8955 and is considered the more reliable non-linear model for this dataset

## Requirements

- R (version 4.0 or higher recommended)
- `corrplot` package

Install the required package with:

```r
install.packages("corrplot")
```

## Usage

1. Clone or download the repository
2. Update the file path in the R script or R Markdown file to match your local directory
3. Run the `.R` script directly in R or RStudio, or knit the `.Rmd` file to produce a Word document

## Course Info

**Course:** Statistics 2  
**University:** University of South Florida  
**Semester:** Spring 2026