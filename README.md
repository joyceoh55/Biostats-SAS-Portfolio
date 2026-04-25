# Biostatistics & SAS Programming Portfolio

**Joyce Oh, MPH (Biostatistics)**  
**SAS Certified Specialist: Base Programming SAS 9.4**

This repository contains SAS-based portfolio projects focused on healthcare and public health data analysis. The projects demonstrate data cleaning, variable derivation, quality checks, regression modeling, and plain-language interpretation of results.

## Portfolio Focus

This portfolio is designed to highlight skills relevant to:

- **SAS Programmer / Statistical Programmer** roles: data management, QC, derivations, reproducible workflows
- **Biostatistician / Research Data Analyst** roles: modeling, inference, interpretation, and communication of findings

## Skills Demonstrated

- Data cleaning and derivation of analysis-ready datasets
- DATA step merges and longitudinal data preparation
- Missing data handling and variable recoding
- `PROC SQL`
- `PROC FREQ` and `PROC MEANS` for QC and summary review
- Logistic regression using `PROC LOGISTIC`
- Odds ratio and 95% confidence interval interpretation

## Projects

### 1. Framingham Data Preparation
**File:** `framingham_data_prep_portfolio.sas`  
**Role:** SAS Programmer / Data Analyst  
**Tools:** SAS Base, DATA Step, PROC SQL

**Objective**  
Prepare a derived analytic dataset from Framingham-style longitudinal cardiovascular data by merging repeated-measures records and calculating key hemodynamic indicators.

**Methods**
- Imported and organized source datasets
- Sorted and merged longitudinal records by subject ID
- Derived variables including age and change in systolic blood pressure
- Created categorical indicators for blood pressure change and cholesterol status
- Applied cleaning rules for missing or invalid values
- Performed QC review using summary procedures

**Skills shown**
- longitudinal data management
- merge logic
- feature engineering
- data cleaning
- analytic dataset preparation

---

### 2. ICU Mortality Model
**File:** `icu_mortality_model_portfolio.sas`  
**Role:** Biostatistics / Statistical Analysis  
**Tools:** SAS Base, `PROC LOGISTIC`

**Objective**  
Evaluate whether age, fracture status, and CPR administration are associated with ICU mortality.

**Methods**
- Conducted descriptive review of key variables
- Fit a multivariable logistic regression model
- Used Wald confidence intervals for odds ratios
- Interpreted adjusted associations in plain language

**Results**
- Age and CPR status were significant predictors of mortality
- Patients who received CPR had substantially higher odds of mortality
- Increasing age was associated with higher odds of mortality

**Skills shown**
- binary outcome modeling
- logistic regression
- odds ratio interpretation
- clinical outcome analysis



### The Visuals

<img width="806" height="250" alt="image" src="https://github.com/user-attachments/assets/9e9cc061-5315-4511-acc7-8ab13b06bf91" />


