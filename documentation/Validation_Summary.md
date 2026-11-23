# Data Validation Summary

## Objective
Assess whether the integrated and cleaned dataset was sufficiently consistent for exploratory and business-focused analysis.

## Validation areas confirmed as completed
1. Duplicate records and key uniqueness.
2. Missing values and NULL handling.
3. Matching between learner, enrolment and programme keys.
4. Application and completion status values.
5. Categorical standardisation.
6. Numeric and data-type consistency.
7. Final cleaned-table review.

## Recorded outcomes
- The integration workflow included checks of duplicate and key relationships.
- Gender standardisation produced 32,601 records, including 4,093 NULL values.
- The `Self_Funded` to `Self-funded` correction was checked; the corrected category count was reported as 483.
- `match_confidence` was converted from percentage text to numeric 0–100 scale.
- Invalid age value `-4` was converted to NULL.
- Application and completion status values were reviewed and retained as recorded categories.

## Evidence to include
| Evidence | What it should show |
|---|---|
| Key uniqueness | Actual key tested and duplicate/unique result |
| Join matching | Matched and unmatched relationship counts |
| Missing values | NULL counts by relevant field |
| Category validation | Final standardised values and counts |
| Numeric validation | Data types and valid ranges |
| Final table | Row count and structure of `integrated_cleaned` |

## Validation Reproducibility
The validation process covered record counts, duplicate checks, missing values, key integrity, referential matching and data consistency. The corresponding PostgreSQL queries are provided in the `sql` folder to support review and reproducibility. Supporting query-output screenshots should be added to the `screenshots` folder.

