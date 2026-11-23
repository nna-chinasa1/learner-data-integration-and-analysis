# Appendix A: Screenshot Evidence

This appendix contains nine genuine pgAdmin 4 screenshots supplied for this portfolio project. They document selected outputs from source profiling, data integration, validation, cleaning, integrated-data exploration and business analysis.

## Evidence index

| Image | Evidence | What it demonstrates |
|---|---|---|
| `01_source_data_profiling.jpg` | Source-table profiling | Learner ID record count, non-null count, distinct count and duplicate count for `Learners_Demographics`. |
| `02_data_integration.jpg` | Data integration | The three-table LEFT JOIN and the integrated output row count. Sample learner-level values are redacted in this repository copy for privacy. |
| `03_initial_validation_duplicate_check.jpg` | Initial validation | No repeated non-NULL `enrollment_pk` values were returned by the duplicate check. |
| `04_initial_validation_missing_learner_fk.jpg` | Initial validation | The query returned 23,495 rows with a NULL `learner_fk`. This is a missing foreign-key value finding, not a count of missing `learner_pk` values. |
| `05_gender_standardisation.jpg` | Data cleaning | Gender values grouped into Female, Male, Other and NULL categories after standardisation. |
| `06_whitespace_quality_check.jpg` | Data cleaning / quality review | Leading/trailing whitespace checks for selected text columns in `integrated_cleaned`. |
| `07_post_cleaning_row_count_validation.jpg` | Post-cleaning validation | `integrated_raw` and `integrated_cleaned` both contain 32,601 rows. |
| `08_integrated_eda_gender_completeness.jpg` | Integrated-data EDA | Gender completeness in `integrated_raw`: 32,601 total, 28,508 available and 4,093 missing; zero blank strings. |
| `09_business_analysis_application_vs_completion.jpg` | Business analysis | Application-status and completion-status cross-tabulation, including enrolment counts and within-status percentages. |

## Notes on interpretation

- The duplicate-check screenshot shows column headings but no result rows, indicating that no duplicate non-NULL enrolment IDs were returned by that query.
- The missing `learner_fk` count is 23,495. It should not be conflated with missing `learner_pk`.
- The gender standardisation output retains NULL as a separate category; missing values have not been assigned an assumed gender.
- The whitespace screenshot identifies fields with whitespace at the time of the check. It is not, by itself, proof that those values were subsequently corrected.
- The row-count comparison confirms that the raw and cleaned tables each contain 32,601 rows. It does not, on its own, prove that every cleaning rule worked as intended.
- The application/completion cross-tab is descriptive. `N/A` is not automatically a dropout or unsuccessful outcome.
- An age-analysis screenshot was not supplied. Age-related EDA remains documented in the SQL and findings where supported, but this appendix does not claim to contain a visual for that analysis.

## Screenshot capture and privacy

The images were captured from pgAdmin 4. The integration screenshot included sample learner-level information, so the repository copy masks the sample output values while retaining the SQL and row-count context. Keep learner names, identifiers and other personal information out of public screenshots.

For future additions, save genuine query-output screenshots in this folder as PNG or JPG. Do not fabricate outputs or alter analytical values.
