# Data Dictionary

This dictionary describes the integrated fields recorded during the project. Confirm exact SQL data types and business definitions against the final database schema before publication.

## Learner fields

| Field | Description |
|---|---|
| `learner_pk` | Learner primary identifier |
| `student_full_name` | Recorded learner name |
| `age` | Learner age |
| `gender` | Recorded gender category |
| `home_country` | Learner home country |
| `base_institution` | Learner base institution |
| `Ex_college_faculty` | Faculty field as named in source schema; confirm intended definition |
| `academic_major` | Recorded academic major |
| `degree_level` | Recorded degree level |

## Enrolment fields

| Field | Description |
|---|---|
| `enrollment_pk` | Enrolment primary identifier |
| `learner_fk` | Foreign key linking enrolment to learner |
| `program_fk` | Foreign key linking enrolment to programme |
| `signup_date` | Recorded sign-up date |
| `application_date` | Recorded application date |
| `lead_time_days` | Lead time in days, as represented in the integrated dataset |
| `application_status` | Recorded application status |
| `match_confidence` | Match-confidence value; cleaned to numeric percentage scale 0–100 |
| `completion_status` | Recorded completion status |

## Programme fields

| Field | Description |
|---|---|
| `program_pk` | Programme primary identifier |
| `program_name` | Programme name |
| `program_category` | Programme category; may be unrecorded |
| `managing_organization` | Managing organisation |
| `host_country` | Programme host country |
| `duration` | Recorded programme duration |
| `funding_category` | Recorded funding category |

## Notes
- `_pk` and `_fk` indicate primary-key and foreign-key naming conventions in this project.
- NULL means an absent or unknown value. It is not equivalent to zero or a substantive category.
- Confirm definitions against original source documentation where available.
