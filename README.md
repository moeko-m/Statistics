# Statistical Analysis of Migration and Housing Prices in Portugal

This research investigates the relationship between **Immigration, Housing Prices, and Emigration** in Portugal using **Panel Data Econometric Models**. It explores whether rising immigration levels, GDP per capita, and housing prices influence emigration rates, reflecting on broader migration theory and economic pressures.

---

## Research Question
Does an increase in immigration, GDP per capita, and housing prices influence emigration rates in Portugal?

---

## Dataset

- Panel data from **6 countries** across **5 years** (2018–2022)  
- Total observations: **30**  
- Variables:  
  - Emigration rate (log-transformed)  
  - Immigration rate (log-transformed)  
  - GDP per capita (log-transformed)  
  - Unemployment rate  
  - Housing prices  

---

## Methodology

- **Econometric Models Used**:
  - Fixed Effects (Within Estimator)  
  - Random Effects Model  
- **Log transformation** applied to skewed variables (emigration, immigration, GDP)  
- **Diagnostics & Tests**:
  - No multicollinearity (VIF < 5)  
  - No serial correlation (Durbin-Watson = 2.38, p = 0.71)  
  - **Hausman Test** selected the Random Effects model (p = 0.94)

---

## Key Findings

1. **Immigration is positively associated** with emigration  
   → Suggests that perceived competition or social pressure may drive out-migration.  
   
2. **Housing prices have a negative relationship** with emigration  
   → Counterintuitive result, potentially due to confounding variables or reverse causality.  

3. **GDP per capita and unemployment** had **no significant direct effect**  
   → Indicates more complex, indirect mechanisms influencing migration behavior.

---

## Tools Used

- R
- Econometric techniques: Fixed Effects, Random Effects, Hausman Test  

---

## Developed By

- **Moeko Mitani** [LinkedIn](https://www.linkedin.com/in/moeko-mitani-437205163/)  
- Catarina Carneiro
- Elcano Gaspar
