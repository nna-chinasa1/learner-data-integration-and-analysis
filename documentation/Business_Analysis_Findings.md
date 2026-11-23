# Business Analysis Findings

## Objective
Use SQL queries on `integrated_cleaned` to examine application outcomes, completion outcomes and programme participation.

## Question 1: What is the distribution of application and completion outcomes?

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

Enrolled and Accepted were the two largest application-status groups in the reported output.

### Completion status

| Status | Enrolments | Share |
|---|---:|---:|
| N/A | 5,013 | 55.05% |
| Completed | 1,660 | 18.23% |
| In Progress | 1,641 | 18.02% |
| Dropped Out | 792 | 8.70% |

N/A is a distinct recorded category. It must not be interpreted as dropout or failed completion.

## Question 2: How do application statuses relate to completion outcomes?

| Application status | Completion status | Enrolments | Share within application status |
|---|---|---:|---:|
| Accepted | In Progress | 811 | 40.01% |
| Accepted | Completed | 802 | 39.57% |
| Accepted | Dropped Out | 414 | 20.42% |
| Applied | N/A | 1,023 | 100.00% |
| Completed | N/A | 1,023 | 100.00% |
| Enrolled | Completed | 858 | 41.53% |
| Enrolled | In Progress | 830 | 40.17% |
| Enrolled | Dropped Out | 378 | 18.30% |
| Pending | N/A | 994 | 100.00% |
| Rejected | N/A | 977 | 100.00% |
| Withdrawn | N/A | 996 | 100.00% |

Completion outcomes were recorded for Accepted and Enrolled in this output. Other application-status groups shown had N/A completion status. This is descriptive association, not causation.

## Question 3: Which programmes attract the highest number of unique enrolments?

The ten programmes returned by the programme-level query were tied at two unique enrolments each.

| Programme | Category | Unique enrolments |
|---|---|---:|
| Natural Language Processing & Generative AI | Data & AI | 2 |
| Applied Machine Learning & MLOps | Data & AI | 2 |
| Digital Marketing & Growth Immersion | Marketing | 2 |
| Mobile App Engineering & Architecture | Technology | 2 |
| Big Data Architecture & Engineering | Data & AI | 2 |
| International Business & Trade Analytics | Business | 2 |
| Network Defense & Forensics Academy | Security | 2 |
| Sustainable Energy Systems & Infrastructure | Environmental & Sustainability | 2 |
| Biomedical Innovation & Exchange | Health Sciences | 2 |
| Climate Change Policy & Transition Studies | Environmental & Sustainability | 2 |

The returned programmes were tied; the available output does not support a unique leading programme.

## Question 4: Which programme categories attract the highest number of unique enrolments?

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

Not recorded is a data-coverage label, not a programme category. Among named categories, Health Sciences had the largest recorded count, followed by Data & AI and Security. The large unrecorded share limits comparisons.

## Overall observations
1. Application and completion statuses have distinct distributions and should be interpreted separately.
2. The high N/A completion-status share is an important interpretation limit.
3. The programme-level output shows a tie among the returned programmes.
4. The large Not recorded programme-category group limits category comparisons.
5. The findings are descriptive, not causal or predictive.

## Suggested next steps (not yet completed)
- Confirm the business meaning of N/A completion status.
- Investigate the high share of enrolments without a recorded programme category.
- Compare outcomes across programme categories only after assessing category coverage.
- Confirm whether the programme-level tie reflects the full dataset and query scope.

## Method and limitations
The analysis used unique enrolment counts and grouped summaries derived from the integrated dataset. The findings describe patterns and distributions within the available data. They do not establish causation or provide a direct assessment of programme quality, learner satisfaction or provider performance.
