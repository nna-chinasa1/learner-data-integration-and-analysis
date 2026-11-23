# Data Cleaning Log

## Objective
Prepare the integrated learner dataset for reliable descriptive analysis while preserving the meaning of missing values and recorded categories.

## Cleaning actions recorded

| Field | Issue reviewed | Treatment recorded |
|---|---|---|
| `gender` | Inconsistent representations/casing | Standardised recorded categories |
| `degree_level` | Inconsistent casing | Standardised and checked category values |
| `funding_category` | Inconsistent label | Corrected `Self_Funded` to `Self-funded` |
| `academic_major` | Inconsistent category labels | Standardised category values |
| `match_confidence` | Percentage values stored as text | Converted to numeric 0–100 scale |
| `age` | Invalid negative value | Changed `-4` to `NULL` |
| `completion_status` | Includes N/A | Reviewed and retained recorded status categories |
| `application_status` | Application outcome categories | Reviewed and retained recorded values |

## Gender distribution after standardisation

| Value | Records |
|---|---:|
| NULL | 4,093 |
| Female | 12,313 |
| Male | 12,133 |
| Other | 4,062 |
| **Total** | **32,601** |

NULL is shown separately and is not reclassified as Other.

## Funding category
`Self_Funded` was standardised to `Self-funded`; the corrected category count was reported as 483.

## Age handling
The invalid value `-4` was changed to NULL. Do not describe this as imputation unless a separate documented imputation step was performed.

## Cleaning principles
- Standardise labels without changing meaning.
- Preserve meaningful status categories.
- Keep missing values distinct from zero and substantive categories.
- Document corrections and avoid unsupported imputation.

## Reproducibility
**Reproducibility:** The PostgreSQL statements used to create and clean `integrated_cleaned` are provided in `sql/04_Data_Cleaning.sql`. The complete original workflow is also preserved in `sql/Excelerate_Project_Original.sql`. This log summarises the recorded actions; it does not replace executable SQL.
