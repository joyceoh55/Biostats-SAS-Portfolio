# Biostatistics & SAS Programming Portfolio
**Joyce Oh** *MPH in Biostatistics | SAS Base Programming Specialist*

---

## Project 1: Longitudinal Data Management of Framingham Heart Study
**Role:** SAS Programmer / Data Analyst  
**Tools:** SAS Base, Data Step, SQL

### Objective
To prepare a derived analytical dataset from the Framingham Heart Study by merging longitudinal data (Period 1 and Period 2) and calculating critical hemodynamic indicators for cardiovascular analysis.

### Methodology
* **Data Ingestion:** Established permanent libraries to import raw `.sas7bdat` files.
* **Data Transformation:** Performed a one-to-one match merge on `SubjectID` to combine longitudinal datasets.
* **Feature Engineering:** Calculated derived variables including Age, Differential Systolic Blood Pressure (`diff_sbp`), and Categorical Cholesterol status.
* **Data Cleaning:** Implemented logic to handle missing values and exclude invalid records (missing birth dates or blood pressure readings).

### Key Code Snippet
*Demonstrating conditional logic and data merging:*

```sas
data fram_final;
    merge fram1new fram2new;
    by subjid_new;

    /* Calculate Age at Visit */
    age = round((visit - bdate)/365.25, 1);

    /* Calculate Change in Systolic BP */
    diff_sbp = sysbp2 - sysbp1;

    /* Create Categorical Change Variable */
    if diff_sbp > 0 then diff_sbp_cat = "Higher";
    else if diff_sbp = 0 then diff_sbp_cat = "Same";
    else diff_sbp_cat = "Lower";

    /* Flag High Cholesterol (Both Periods > 200) */
    /* Logic: Ensure missing values are not treated as < 200 */
    if tchol1 = . or tchol2 = . then both_chol = .;
    else if tchol1 > 200 and tchol2 > 200 then both_chol = 1;
    else both_chol = 0;
run;

```

## Project 2: Predictors of Mortality in ICU (Logistic Regression)
**Role:** Biostatistician
**Tools:** SAS (PROC LOGISTIC), Odds Ratios


### Objective
To identify significant risk factors associated with patient mortality in the ICU, focusing on Age, Fracture status, and CPR administration.

### Methodology
* **Statistical Modeling:** Developed a multivariable logistic regression model to predict the probability of death.
* **Hypothesis Testing:** Conducted Wald Chi-Square tests to assess the significance of individual predictors.
* **Interpretation:** Calculated and interpreted Odds Ratios (OR) and 95% Confidence Intervals to quantify risk.



