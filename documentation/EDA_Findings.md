# Exploratory Data Analysis Findings

## Purpose
EDA was used to understand the learner, enrolment and programme data, identify data-quality concerns and establish context for the business questions. The project workflow records EDA on the original tables and the integrated dataset.

## Areas explored
- Learner demographic attributes.
- Enrolment and application information.
- Completion status.
- Programme attributes and categories.
- Missing values and NULL patterns.
- Categorical consistency and numeric field quality.

## Confirmed data-quality observations
The cleaning workflow addressed inconsistent categorical representations, a text-based percentage field and an invalid negative age value. `match_confidence` was converted to a numeric percentage scale from 0 to 100; age value `-4` was changed to NULL.

## Findings available for reporting
The final business-analysis outputs provide distributions for application status, completion status, their cross-tabulation and programme category coverage. These are documented in [Business Analysis Findings](Business_Analysis_Findings.md).

## EDA Reporting and Data Accuracy
This report presents findings supported by the exploratory data analysis performed on the integrated learner dataset. All reported statistics and observations are based on actual query results. Placeholder figures and unverified methodological claims have been excluded to maintain accuracy and transparency. Detailed statistical measures are included only where the corresponding results have been calculated and verified.

## Reproducibility
**Reproducibility:** The supplied exploratory SQL queries are provided in `sql/01_Source_Data_Profiling.sql and 06_Integrated_Data_EDA.sql`. Additional exploratory queries from the integrated workflow are preserved in `sql/Excelerate_Project_Original.sql`. Genuine query-output screenshots should be placed in `screenshots/`.
