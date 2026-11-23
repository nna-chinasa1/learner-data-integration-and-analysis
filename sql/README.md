# SQL Scripts and Execution Order

All scripts use PostgreSQL and are intended to be run through pgAdmin 4. Run them in the order below, checking each result before moving to the next stage.

| Order | File | Purpose |
|---:|---|---|
| 1 | `01_Source_Data_Profiling.sql` | EDA/profiling of the three original source tables individually. |
| 2 | `02_Data_Integration.sql` | Three-table LEFT JOIN and creation of `integrated_raw`. |
| 3 | `03_Initial_Validation.sql` | Validate keys, duplicates, missing values and relationships in `integrated_raw`. |
| 4 | `04_Data_Cleaning.sql` | Create `integrated_cleaned` and apply the supplied cleaning/standardisation statements. |
| 5 | `05_Post_Cleaning_Validation.sql` | Check row counts, data types and selected cleaned fields. |
| 6 | `06_Integrated_Data_EDA.sql` | EDA of the integrated dataset, `integrated_raw`. |
| 7 | `07_Business_Analysis.sql` | Four business questions using `integrated_cleaned`. |
| Reference | `Excelerate_Project_Original.sql` | Original complete SQL workflow, preserved separately. |

## How ETL fits this project

ETL means Extract, Transform and Load. It is the overall data workflow, not necessarily a separate SQL file. In this project, source-table profiling documents the extracted source data; the integration script joins and loads the records into `integrated_raw`; and the cleaning script applies transformations to create `integrated_cleaned`. The validation, EDA and business-analysis scripts follow those stages.

## Execution Notes

The SQL scripts are organised in numerical order to present the project workflow clearly, from initial source-table profiling through data integration, validation, cleaning, exploratory data analysis and business analysis.

The workflow follows these stages:

1. **Source Data Profiling:** Examine the three original tables and understand their structure and contents.
2. **Data Integration:** Combine learner demographics, registration and enrolment records, and programme information using SQL joins to create `integrated_raw`.
3. **Initial Validation:** Examine the integrated dataset for duplicates, missing values, key relationships and data-quality issues.
4. **Data Cleaning:** Apply the required cleaning and standardisation steps to produce `integrated_cleaned`.
5. **Post-Cleaning Validation:** Review the cleaned dataset to assess the results of the cleaning process.
6. **Integrated Data EDA:** Explore patterns and distributions in the integrated dataset.
7. **Business Analysis:** Use SQL queries to investigate learner enrolment, application and programme-related questions.

The `Excelerate_Project_Original.sql` file is also retained as a reference to the original SQL workflow. Supporting documentation and screenshots are provided in their respective folders.
## Screenshot appendix

See [`documentation/Appendix_Screenshot_Evidence.md`](../documentation/Appendix_Screenshot_Evidence.md) for the screenshot checklist, suggested filenames and instructions for uploading genuine pgAdmin 4 screenshots into the repository's `screenshots/` folder.
