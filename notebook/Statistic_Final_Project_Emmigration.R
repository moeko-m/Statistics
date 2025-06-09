# Required Libraries
library(ggplot2)
library(car)
library(dplyr)
library(lmtest)
library(tidyr)
library(plm)
library(gplots)

# Import Dataset
panel <- read.csv("C:/Users/Elcano/Documents/NOVA IMS/1º semestre/Estatistica para ciência de dados/Projecto Final/Statistic_panel_data.csv")

# Check the Structure of the Dataset
str(panel)

# Preliminary Data Exploration
summary(panel)

# Visualizing Relationships
pairs(panel[, c("Emigration", "Immigration", "Unemployment", "GDP_per_Capita", "Housing_Prices")],
      main = "Scatterplot Matrix of Key Variables",
      col = "blue")

# Multicollinearity Check
vif_model <- lm(Emigration ~ Immigration + Unemployment + GDP_per_Capita + Housing_Prices, data = panel)
vif_values <- vif(vif_model)
print("VIF Values:")
print(vif_values)

# Homoskedasticity Check
bp_test <- bptest(Emigration ~ Immigration + Unemployment + GDP_per_Capita + Housing_Prices, data = panel)
print("Breusch-Pagan Test for Homoskedasticity:")
print(bp_test)
# null hypothesis H0: The variance of residuals is constant (homoskedasticity).
# We fail to reject the null hypothesis at the 5% significance level. This suggests no strong evidence of heteroskedasticity in the model

# Serial Correlation Check
dw_test <- dwtest(vif_model)
print("Durbin-Watson Test for Serial Correlation:")
print(dw_test)
#Null Hypothesis Ho: No autocorrelation exists in the residuals.
#The p-value (0.7116) is much greater than 0.05, so we fail to reject the null hypothesis. This suggests that autocorrelation is not a concern in the residuals.

# Data Transformations
panel <- panel %>% 
  mutate(Housing_Prices = (Housing_Prices - 100) / 100, 
         LogGDP = log(GDP_per_Capita),
         LogImmigration = log(Immigration + 1),
         LogEmigration = log(Emigration + 1))

# Fixed Effects Model
fe_model <- plm(LogEmigration ~ LogImmigration + Unemployment + LogGDP + Housing_Prices, 
                data = panel, model = "within")
print("Fixed Effects Model Summary:")
print(summary(fe_model))

# Random Effects Model
re_model <- plm(LogEmigration ~ LogImmigration + Unemployment + LogGDP + Housing_Prices, 
                data = panel, model = "random")
print("Random Effects Model Summary:")
print(summary(re_model))

# Hausman Test
hausman_test <- phtest(fe_model, re_model)
print("Hausman Test:")
print(hausman_test)

# Visualization of Results
coeffs <- summary(fe_model)$coefficients
barplot(coeffs[, "Estimate"], 
        main = "Fixed Effects Model Coefficients",
        col = "lightblue",
        names.arg = rownames(coeffs),
        las = 2)

# Conclusion and Next Steps
cat("\nConclusions:\n")
cat("1. The Hausman test suggests Random Effects is the preferred model (p-value > 0.05).\n")
cat("2. Significant variables include LogImmigration and Housing_Prices in the Fixed Effects Model.\n")
cat("3. Future research should consider additional variables such as regional characteristics and policy factors.\n")
