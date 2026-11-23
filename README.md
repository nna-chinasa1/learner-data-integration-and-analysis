# Learner Data Integration, Quality Review & Business Analysis

**Independent portfolio project | SQL | Data integration | Data quality | EDA | Business analysis**

## Overview
This project integrates learner demographics, enrolment records and programme information into a relational dataset for data-quality review, exploratory analysis and descriptive business reporting.

### Workflow
1. Explore the source tables.
2. Integrate the tables using their relationship keys.
3. Review the integrated output and validate key relationships.
4. Clean and standardise selected fields.
5. Conduct exploratory data analysis (EDA).
6. Answer four business questions with SQL.
7. Document methods, findings, limitations and evidence.

> **Project context:** This is an independent portfolio project using a learner-programme dataset. It is not presented as employer work or as a formal Excelerate assignment. Findings describe the dataset used for this portfolio exercise.

## Source tables

| Table | Alias | Purpose |
|---|---|---|
| `Learners_Demographics` | `ld` | Learner profile and demographic attributes |
| `Registration_Enrollments` | `re` | Registration, application and completion information |
| `Organization_Programs` | `op` | Programme details, categories and managing organisations |

Working output tables: `integrated_raw` (integrated data before cleaning) and `integrated_cleaned` (cleaned dataset used for analysis).

## Tools and methods
SQL joins, filtering, aggregation, distinct counts, grouping, data standardisation, missing-value review, validation, descriptive profiling and cross-tabulation.

**Database platform:** Enter the platform and version actually used for the final execution before publishing. Do not list multiple platforms unless the project was genuinely run on each.

## Repository structure

```text
learner-data-integration-and-analysis/
├── README.md
├── PUBLICATION_CHECKLIST.md
├── sql/
│   ├── README.md
│   ├── EDA_Scripts.sql
│   ├── Data_Integration.sql
│   ├── Data_Cleaning.sql
│   └── Business_Analysis.sql
├── documentation/
│   ├── Data_Integration.md
│   ├── Data_Cleaning_Log.md
│   ├── Validation_Summary.md
│   ├── EDA_Findings.md
│   ├── Business_Analysis_Findings.md
│   └── Data_Dictionary.md
└── screenshots/
    └── README.md
```

The SQL files must contain the actual executable queries. Markdown files explain the method and results. Do not upload empty or reconstructed scripts as if they were the original work.

## Key findings

### Application status

| Status | Enrolments | Share |
|---|---:|---:|
| Enrolled | 2,066 | 22.69% |
| Accepted | 2,027 | 22.26% |
| Completed | 1,023 | 11.23% |
| Applied | 1,023 | 11.23% |
| Withdrawn | 996 | 10.94% |
| Pending | 994 | 10.92% |
| Rejected | 977 | 10.73% |

### Completion status

| Status | Enrolments | Share |
|---|---:|---:|
| N/A | 5,013 | 55.05% |
| Completed | 1,660 | 18.23% |
| In Progress | 1,641 | 18.02% |
| Dropped Out | 792 | 8.70% |

`N/A` is a separate recorded category, not automatically a dropout or failed outcome.

### Application status and completion outcomes
For `Accepted`: 802 Completed (39.57%), 811 In Progress (40.01%), 414 Dropped Out (20.42%).  
For `Enrolled`: 858 Completed (41.53%), 830 In Progress (40.17%), 378 Dropped Out (18.30%).  
Other application-status groups in the reported cross-tabulation had N/A completion status. These are descriptive associations, not causal findings.

### Programme categories

| Category | Unique enrolments | Share |
|---|---:|---:|
| Not recorded | 6,867 | 75.41% |
| Health Sciences | 322 | 3.54% |
| Data & AI | 300 | 3.29% |
| Security | 293 | 3.22% |
| Marketing | 288 | 3.16% |
| Technology | 281 | 3.09% |
| Business | 257 | 2.82% |
| Social Sciences & Policy | 188 | 2.06% |
| Environmental & Sustainability | 161 | 1.77% |
| Design & User Experience | 149 | 1.64% |

`Not recorded` is a data-coverage label, not a programme category. Among named categories, Health Sciences had the highest recorded count, followed by Data & AI and Security. The large unrecorded share limits comparisons.

### Programme-level result
The ten programmes returned by the programme-level query were tied at two unique enrolments each. The available output does not establish a unique leading programme.

## Limitations
- N/A completion status is not automatically a negative outcome.
- Not recorded is not a substantive programme category.
- Programme-level results showed a tie in the returned output.
- The analysis is descriptive; it does not establish causation or predict future behaviour.
- Do not claim machine learning, predictive modelling or production deployment.

## Documentation
- [Data integration](documentation/Data_Integration.md)
- [Data cleaning log](documentation/Data_Cleaning_Log.md)
- [Validation summary](documentation/Validation_Summary.md)
- [EDA findings](documentation/EDA_Findings.md)
- [Business analysis findings](documentation/Business_Analysis_Findings.md)
- [Data dictionary](documentation/Data_Dictionary.md)
- [SQL script placement guide](sql/README.md)
- [Screenshot evidence guide](screenshots/README.md)

## Screenshot Evidence

Nine screenshots from pgAdmin 4 are included in the `screenshots/` folder. They provide visual evidence of selected stages of the project, including source data profiling, three-table integration, initial validation, data cleaning, post-cleaning validation, exploratory data analysis and business analysis.
The screenshots complement the SQL scripts and supporting documentation by showing selected queries and their corresponding outputs.
Personal information and sensitive credentials should not be included in published project materials.
