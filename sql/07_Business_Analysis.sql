-- Business Analysis: four questions and their supplied PostgreSQL queries.

-- BUSINESS QUESTION 1:
-- What is the distribution of application and completion outcomes?

WITH total_enrolments AS (
SELECT COUNT(DISTINCT enrollment_pk) AS total
FROM integrated_cleaned
WHERE enrollment_pk IS NOT NULL
),
application_outcomes AS (
SELECT
'Application Status' AS outcome_type,
COALESCE(application_status, 'Missing / Not recorded') AS outcome,
COUNT(DISTINCT enrollment_pk) AS enrolment_count
FROM integrated_cleaned
WHERE enrollment_pk IS NOT NULL
GROUP BY application_status
),
completion_outcomes AS (
SELECT
'Completion Status' AS outcome_type,
COALESCE(completion_status, 'Missing / Not recorded') AS outcome,
COUNT(DISTINCT enrollment_pk) AS enrolment_count
FROM integrated_cleaned
WHERE enrollment_pk IS NOT NULL
GROUP BY completion_status
),
combined_outcomes AS (
SELECT * FROM application_outcomes
UNION ALL
SELECT * FROM completion_outcomes
)
SELECT
outcome_type,
outcome,
enrolment_count,
ROUND(
enrolment_count * 100.0 /
NULLIF(total_enrolments.total, 0),
2
) AS percentage
FROM combined_outcomes
CROSS JOIN total_enrolments
ORDER BY outcome_type, enrolment_count DESC;


-- BUSINESS QUESTION 2:
-- How do application statuses relate to completion outcomes?

SELECT
COALESCE(application_status, 'Missing / Not recorded') AS application_status,
COALESCE(completion_status, 'Missing / Not recorded') AS completion_status,
COUNT(DISTINCT enrollment_pk) AS enrolment_count,
ROUND(
COUNT(DISTINCT enrollment_pk) * 100.0 /
NULLIF(
SUM(COUNT(DISTINCT enrollment_pk)) OVER (
PARTITION BY application_status
),
0
),
 2
) AS percentage_within_application_status
FROM integrated_cleaned
WHERE enrollment_pk IS NOT NULL
GROUP BY
application_status,
completion_status
ORDER BY
application_status,
enrolment_count DESC;


-- BUSINESS QUESTION 3:
-- Which programmes attract the highest number of unique enrolments?

SELECT
program_pk,
program_name,
program_category,
COUNT(DISTINCT enrollment_pk) AS unique_enrolments
FROM integrated_cleaned
WHERE enrollment_pk IS NOT NULL
AND program_pk IS NOT NULL
GROUP BY
program_pk,
program_name,
program_category
ORDER BY
unique_enrolments DESC
LIMIT 10;


-- BUSINESS QUESTION 4:
-- Which programme categories attract the highest number of unique enrolments?

WITH category_enrolments AS (
SELECT
COALESCE(program_category, 'Not recorded') AS program_category,
COUNT(DISTINCT enrollment_pk) AS unique_enrolments
FROM integrated_cleaned
WHERE enrollment_pk IS NOT NULL
GROUP BY program_category
),
total_enrolments AS (
SELECT COUNT(DISTINCT enrollment_pk) AS total
FROM integrated_cleaned
WHERE enrollment_pk IS NOT NULL
)
SELECT
ce.program_category,
ce.unique_enrolments,
ROUND(
ce.unique_enrolments * 100.0 /
NULLIF(te.total, 0),
2
) AS percentage_of_enrolments
FROM category_enrolments ce
CROSS JOIN total_enrolments te
ORDER BY unique_enrolments DESC;
