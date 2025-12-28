/**********************************************************************
 * PROJECT: Predictors of Mortality in ICU
 * AUTHOR: Joyce Oh
 * DESCRIPTION: 
 * Logistic regression analysis to identify significant risk factors
 * (Age, CPR, Fracture) associated with patient mortality.
 **********************************************************************/

libname PROJ "C:\Path\To\Your\Data";

/* Step 1: Format Creation for Categorical Variables */
proc format;
    value yesno 1="Yes" 0="No";
run;

/* Step 2: Logistic Regression Model */
/* Goal: Model the probability of Death=1 (Yes) */
proc logistic data=PROJ.icu descending;
    /* Specifying Reference Groups: 'No' is the baseline for risk comparison */
    class fracture (param=ref ref="No") 
          cpr      (param=ref ref="No");
    
    /* Model Definition */
    model death = age fracture cpr / clodds=wald;
    
    /* Apply formats for readability */
    format death fracture cpr yesno.;
    
    title "Logistic Regression: Risk Factors for ICU Mortality";
run;
