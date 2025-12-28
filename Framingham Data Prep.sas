/**********************************************************************
 * PROJECT: Longitudinal Data Management (Framingham Heart Study)
 * AUTHOR: Joyce Oh
 * DESCRIPTION: 
 * This script imports raw longitudinal health data, merges two
 * time periods, cleans missing values, and calculates key 
 * hemodynamic indicators (BP changes, Cholesterol flags).
 **********************************************************************/

/* Step 1: Library Assignment (Update path for your local machine) */
libname PROJ "C:\Path\To\Your\Data";

/* Step 2: Ingest and Rename Variables for Merge */
/* Preparing Period 2 Data */
data fram2new;
    set PROJ.fram2 (rename=(totchol=tchol2 sysbp=sysbp2 diabp=diabp2 
                           date1=visit subjid=subjid_new));
    /* Standardizing ID length for merge stability */
    drop subjid; 
run;

/* Preparing Period 1 Data */
data fram1new;
    set PROJ.fram1 (rename=(randid=subjid_new totchol=tchol1 sysbp=sysbp1 
                           diabp=diabp1 date1=bdate));
run;

/* Step 3: Sort and Merge Longitudinal Data */
proc sort data=fram1new; by subjid_new; run;
proc sort data=fram2new; by subjid_new; run;

data fram_combo;
    merge fram1new fram2new;
    by subjid_new;
run;

/* Step 4: Data Cleaning & Feature Engineering */
data fram_final;
    set fram_combo;
    
    /* EXCLUSION CRITERIA: Remove records with missing critical vitals */
    if sysbp1 = . or sysbp2 = . or visit = . or bdate = . then delete;

    /* CALCULATE AGE: Round to nearest integer */
    age = round((visit - bdate)/365.25, 1);

    /* DERIVED VARIABLE: Change in Systolic BP */
    diff_sbp = sysbp2 - sysbp1;

    /* CATEGORICAL GROUPING: BP Trends */
    length diff_sbp_cat $10;
    if diff_sbp > 0 then diff_sbp_cat = "Higher";
    else if diff_sbp = 0 then diff_sbp_cat = "Same";
    else diff_sbp_cat = "Lower";

    /* RISK FLAG: High Cholesterol in Both Periods (>200) */
    /* Note: Careful handling of missing values to prevent false negatives */
    if tchol1 = . or tchol2 = . then both_chol = .;
    else if tchol1 > 200 and tchol2 > 200 then both_chol = 1;
    else both_chol = 0;

    /* FORMATTING */
    format bdate visit mmddyy10.;
    label diff_sbp = "Change in SBP (Period 2 - Period 1)";
run;

/* Step 5: Validation Check */
proc print data=fram_final(obs=10);
    title "Validation of Derived Variables";
run;
