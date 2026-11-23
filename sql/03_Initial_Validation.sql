-- Initial validation of integrated_raw before cleaning.

-- SECTION 2 : INTEGRATED DATA VALIDATION

SELECT
enrollment_pk,
COUNT(*) AS occurences
FROM integrated_raw
WHERE enrollment_pk IS NOT NULL
GROUP BY enrollment_pk
HAVING COUNT(*) > 1;

SELECT
COUNT(*) AS missing_learner_ids
FROM integrated_raw
WHERE learner_pk IS NULL;

SELECT
COUNT(*) AS missing_learner_fk
FROM integrated_raw 
WHERE learner_fk IS NULL;

SELECT 
COUNT(*) AS total_records,
COUNT(enrollment_pk) AS records_with_enrollment,
COUNT(learner_fk) AS records_with_learner_fk,
COUNT(*) FILTER (
WHERE enrollment_pk IS NOT NULL
AND learner_fk IS NULL)
AS missing_learner_fk
FROM integrated_raw;

SELECT COUNT(*) AS unmatched_learner_fk
FROM integrated_raw AS ir
LEFT JOIN "Learners_Demographics" AS ld
ON ir.learner_fk = ld.learner_pk
WHERE ir.enrollment_pk IS NOT NULL 
AND ld.learner_pk IS NULL;

SELECT 'learner_pk' AS column_name, COUNT(*) AS missing_values
FROM integrated_raw WHERE learner_pk IS NULL
UNION ALL
SELECT 'student_full_name', COUNT(*)
FROM integrated_raw WHERE student_full_name IS NULL
UNION ALL
SELECT 'age', COUNT(*)
FROM integrated_raw WHERE age IS NULL
UNION ALL
SELECT 'gender', COUNT(*) 
FROM integrated_raw WHERE gender IS NULL
UNION ALL
SELECT 'home_country', COUNT(*) 
FROM integrated_raw WHERE home_country IS NULL
UNION ALL
SELECT 'base_institution', COUNT(*)
FROM integrated_raw WHERE base_institution IS NULL
UNION ALL
SELECT "Ex_college_faculty", COUNT(*)
FROM integrated_raw WHERE "Ex_college_faculty" IS NULL
UNION ALL
SELECT 'academic_major', COUNT(*)
FROM integrated_raw WHERE academic_major IS NULL
UNION ALL
SELECT 'degree_level', COUNT(*)
FROM integrated_raw WHERE degree_level IS NULL
UNION ALL
SELECT 'enrollment_pk', COUNT(*)
FROM integrated_raw WHERE enrollment_pk IS NULL
UNION ALL
SELECT 'learner_fk', COUNT(*)
FROM integrated_raw WHERE learner_fk IS NULL
UNION ALL
SELECT 'program_fk', COUNT(*)
FROM integrated_raw WHERE program_fk IS NULL
UNION ALL
SELECT 'signup_date', COUNT(*)
FROM integrated_raw WHERE signup_date IS NULL
UNION ALL
SELECT 'application_date', COUNT(*)
FROM integrated_raw WHERE application_date IS NULL
UNION ALL
SELECT 'lead_time_days', COUNT(*)
FROM integrated_raw WHERE lead_time_days IS NULL
UNION ALL
SELECT 'application_status', COUNT(*)
FROM integrated_raw WHERE application_status IS NULL
UNION ALL
SELECT 'match_confidence', COUNT(*)
FROM integrated_raw WHERE match_confidence IS NULL
UNION ALL
SELECT 'completion_status', COUNT(*)
FROM integrated_raw WHERE completion_status IS NULL
UNION ALL
SELECT 'program_pk', COUNT(*)
FROM integrated_raw WHERE program_pk IS NULL
UNION ALL
SELECT 'program_name', COUNT(*)
FROM integrated_raw WHERE program_name IS NULL
UNION ALL
SELECT 'program_category', COUNT(*)
FROM integrated_raw WHERE program_category IS NULL
UNION ALL
SELECT 'managing_organization', COUNT(*)
FROM integrated_raw WHERE managing_organization IS NULL
UNION ALL
SELECT 'host_country', COUNT(*)
FROM integrated_raw WHERE host_country IS NULL
UNION ALL
SELECT 'duration', COUNT(*)
FROM integrated_raw WHERE duration IS NULL
UNION ALL
SELECT 'funding_category', COUNT(*)
FROM integrated_raw WHERE funding_category IS NULL;
