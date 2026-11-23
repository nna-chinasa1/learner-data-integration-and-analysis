# Data Integration

## Objective
Combine learner demographics, enrolment records and programme details into one relational dataset for data-quality review, EDA and business-focused reporting.

## Source tables

| Table | Alias | Role |
|---|---|---|
| `Learners_Demographics` | `ld` | Learner profile attributes |
| `Registration_Enrollments` | `re` | Registration and enrolment attributes |
| `Organization_Programs` | `op` | Programme attributes |

## Approach
The workflow used left joins to connect learner records to enrolment records and enrolment records to programme records through their relationship keys. A left join retains rows from the left-side table even when a matching record is unavailable, allowing unmatched relationships to be reviewed rather than silently discarded.

## Output tables
- `integrated_raw`: integrated records before cleaning.
- `integrated_cleaned`: cleaned dataset used for analysis.

The integrated schema includes learner identifiers and demographics, enrolment identifiers and dates, application and completion statuses, match confidence, and programme attributes.

## Reproducibility
**Reproducibility:** The PostgreSQL statements used to integrate the three source tables are provided in `sql/02_Data_Integration.sql`. The complete original workflow is also preserved in `sql/Excelerate_Project_Original.sql`.
