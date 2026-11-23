-- Exploratory data analysis of integrated_raw.
-- SECTION 3 : EXPLORATORY DATA ANALYSIS

SELECT
COUNT(*) AS total_learners,
COUNT(age) AS availabe_ages,
COUNT(*) FILTER(WHERE age IS NULL) AS missing_ages,
MIN(age) AS minimum_age,
MAX(age) AS maximum_age,
ROUND(AVG(age), 2) AS average_age
FROM integrated_raw;

SELECT 
COUNT(*) AS total_records,
COUNT(age) AS available_ages,
COUNT(*) - COUNT(age) AS calculated_missing_ages,
COUNT(*) FILTER(WHERE age IS NULL) AS actual_missing_ages,
COUNT(*) FILTER(WHERE age = -4) AS age_minus_4,
COUNT(*) FILTER(WHERE age < 0) AS negative_ages
FROM integrated_raw;

SELECT
COUNT(*) AS total_records,
COUNT(student_full_name) AS available_names,
COUNT(*) FILTER(WHERE student_full_name IS NULL)
AS missing_names,
COUNT (*) FILTER(WHERE TRIM(student_full_name)='') AS blank_names
FROM integrated_raw;

SELECT
COUNT(*) AS total_records,
COUNT(*) FILTER(WHERE student_full_name<> TRIM(student_full_name)) 
AS names_with_extra_spaces
FROM integrated_raw;

SELECT
student_full_name
FROM integrated_raw
WHERE student_full_name <> INITCAP(student_full_name)
LIMIT 20;

SELECT 
COUNT(*) AS total_records,
COUNT(*) FILTER(WHERE student_full_name = UPPER(student_full_name)) AS uppercase_names,
COUNT(*) FILTER (WHERE student_full_name = LOWER(student_full_name)) AS lowercase_names,
COUNT(*) FILTER (WHERE student_full_name = INITCAP(student_full_name)) AS title_case_names
FROM integrated_raw;

SELECT
student_full_name,
COUNT (*) AS occurence_count
FROM integrated_raw
GROUP BY student_full_name
HAVING COUNT(*) > 1
ORDER BY occurence_count DESC
LIMIT 20;

SELECT 
student_full_name,
COUNT(DISTINCT learner_pk) AS unique_learners,
COUNT(*) AS total_occurrences
FROM integrated_raw
GROUP BY student_full_name
HAVING COUNT(*) > 1
ORDER BY total_occurrences DESC;

WITH repeated_names AS(
SELECT 
student_full_name,
COUNT(DISTINCT learner_pk)AS distinct_learners,
COUNT(*)AS total_occurrences
FROM integrated_raw
GROUP BY student_full_name
HAVING COUNT(*) > 1)
SELECT
COUNT(*) AS repeated_name_groups,
SUM (total_occurrences) AS recordds_with_repeated_names,
SUM(CASE WHEN distinct_learners = 1 THEN 1 ELSE 0 END)
AS names_linked_to_one_learner,
SUM(CASE WHEN distinct_learners > 1 THEN 1 ELSE 0 END)
AS names_shared_by_multiple_learners
FROM repeated_names;

SELECT
COUNT(*) AS total_records,
COUNT(gender) AS available_gender,
COUNT(*) FILTER (WHERE gender IS NULL)
AS missing_gender,
COUNT(*) FILTER (WHERE BTRIM(gender) = '')
AS blank_gender
FROM integrated_raw;

SELECT
gender,
COUNT(*) AS occurrence_count
FROM integrated_raw
GROUP BY gender
ORDER BY occurrence_count DESC;

SELECT
COUNT(*) AS totaal_records,
COUNT(home_country) AS available_values,
COUNT(*) FILTER(WHERE home_country IS NULL)
AS missing_values,
COUNT(*) FILTER(WHERE BTRIM(home_country) = '')
AS blank_values
FROM integrated_raw;

SELECT
home_country,
COUNT(*) AS occurrence_count
FROM integrated_raw
GROUP BY home_country
ORDER BY occurrence_count DESC;

SELECT
COUNT(*) AS total_records,
COUNT(*) FILTER (WHERE home_country <> BTRIM(home_country)) AS records_with_extra_spaces
FROM integrated_raw;

SELECT
COUNT(DISTINCT home_country) AS original_distinct_values,
COUNT(DISTINCT LOWER (BTRIM (home_country))) AS normalized_distinct_values
FROM integrated_raw;

SELECT
LOWER(BTRIM(home_country)) AS normalized_country,
COUNT(DISTINCT home_country) AS original_variations
FROM integrated_raw
GROUP BY LOWER(BTRIM(home_country))
HAVING COUNT(DISTINCT home_country) > 1
ORDER BY original_variations DESC;

SELECT
COUNT(*) AS total_records,
COUNT(base_institution) AS available_values,
COUNT(*) FILTER (WHERE base_institution IS NULL) AS missing_values,
COUNT(*) FILTER(WHERE BTRIM(base_institution) = '') AS blank_values
FROM integrated_raw;

SELECT 
base_institution,
COUNT(*) AS occurrence_count
FROM integrated_raw
GROUP BY base_institution
ORDER BY occurrence_count DESC;

SELECT 
COUNT (*) AS total_records,
COUNT("Ex_college_faculty") AS available_values,
COUNT(*) FILTER (WHERE "Ex_college_faculty" IS NULL) AS missing_values,
COUNT(*) FILTER (WHERE BTRIM("Ex_college_faculty") = '') AS blank_values
FROM integrated_raw;

SELECT
"Ex_college_faculty",
COUNT(*) AS occurrence_count
FROM integrated_raw  
GROUP BY "Ex_college_faculty"
ORDER BY occurrence_count DESC;

SELECT
"Ex_college_faculty",
LENGTH("Ex_college_faculty") AS name_length,
COUNT(*) AS total
FROM integrated_raw
GROUP BY "Ex_college_faculty" 
ORDER BY"Ex_college_faculty";

SELECT 
COUNT(*) AS total_records,
COUNT(*) FILTER (WHERE LENGTH("Ex_college_faculty") >
LENGTH (BTRIM("Ex_college_faculty"))) 
AS records_with_extra_spaces
FROM integrated_raw;

SELECT 
COUNT(*) AS total_records,
COUNT(academic_major) AS available_values,
COUNT(*) FILTER (WHERE academic_major IS NULL)
AS missing_values,
COUNT(*) FILTER (WHERE BTRIM(academic_major) = '') AS blank_values
FROM integrated_raw;

SELECT
academic_major,
COUNT(*) AS total
FROM integrated_raw
GROUP BY academic_major
ORDER BY total DESC;

SELECT
COUNT(DISTINCT academic_major) AS distinct_majors
FROM integrated_raw;

SELECT COUNT(*)
FROM integrated_raw
WHERE academic_major <> BTRIM(academic_major);

SELECT
COUNT(*) AS total_records,
COUNT(degree_level) AS available_values,
COUNT(*) FILTER (WHERE degree_level IS NULL) AS missing_values,
COUNT(*) FILTER (WHERE BTRIM(degree_level) = '') AS blank_values
FROM integrated_raw;

SELECT 
degree_level,
COUNT(*) total
FROM integrated_raw
GROUP BY degree_level
ORDER BY degree_level;

SELECT COUNT(*)
FROM integrated_raw
WHERE degree_level <> BTRIM(degree_level);

SELECT 
COUNT(*) AS total_records,
COUNT(application_status) AS available_values,
COUNT(*) - COUNT(application_status) AS missing_values,
COUNT(*) FILTER (WHERE BTRIM(application_status) = '') AS blank_values
FROM integrated_raw;

SELECT 
application_status,
COUNT(*) AS occurrence_count
FROM integrated_raw
GROUP BY application_status
ORDER BY occurrence_count DESC;

SELECT COUNT(*)
FROM integrated_raw
WHERE application_status IS NOT NULL
AND application_status <> BTRIM(application_status);

SELECT
COUNT(*) AS total_records,
COUNT(match_confidence) AS available_values,
COUNT(*) - COUNT(match_confidence) AS missing_values,
COUNT(*) FILTER (WHERE BTRIM(match_confidence::TEXT) = '') AS blank_values
FROM integrated_raw;

SELECT
match_confidence,
COUNT(*) AS occurrence_count
FROM integrated_raw
GROUP BY match_confidence
ORDER BY occurrence_count DESC;

SELECT 
column_name,
data_type
FROM information_schema.columns
WHERE table_name = 'integrated_raw'
AND column_name = 'match_confidence';

SELECT
COUNT(*) AS percentage_formatted_records
FROM integrated_raw
WHERE match_confidence LIKE '%\%%';

SELECT 
MIN(match_confidence::NUMERIC) AS minimum_value,
MAX(match_confidence::NUMERIC) AS maximum_value
FROM integrated_raw
WHERE match_confidence IS NOT NULL
AND match_confidence NOT LIKE '%\%%';

SELECT
MIN(REPLACE(match_confidence, '%', '')::NUMERIC) AS minimum_value,
MAX(REPLACE(match_confidence, '%', '')::NUMERIC) AS maximum_value
FROM integrated_raw
WHERE match_confidence LIKE '%\%%';

SELECT DISTINCT match_confidence
FROM integrated_raw
WHERE match_confidence IS NOT NULL 
ORDER BY match_confidence;

SELECT COUNT(*)
FROM integrated_raw
WHERE match_confidence <> TRIM(match_confidence);

SELECT
COUNT(*) AS total_records,
COUNT(completion_status) AS available_values,
COUNT(*) - COUNT(completion_status) AS missing_values,
COUNT(*) FILTER (WHERE TRIM(completion_status) = '') AS blank_values
FROM integrated_raw;

SELECT
completion_status,
COUNT(*) AS frequency
FROM integrated_raw
GROUP BY completion_status
ORDER BY frequency DESC;

SELECT
COUNT(*) AS total_records,
COUNT(program_name) AS availble_value,
COUNT(*) - COUNT(program_name) AS missing_values,
COUNT(*) FILTER (WHERE TRIM(program_name) = '') AS blank_values
FROM integrated_raw;

SELECT
program_name,
COUNT(*) AS frequency
FROM integrated_raw
GROUP BY program_name
ORDER BY frequency DESC;

SELECT
COUNT(*) AS total_records,
COUNT(program_category) AS available_values,
COUNT(*) - COUNT(program_category) AS missing_value,
COUNT(*) FILTER (WHERE TRIM(program_category) = '') AS blank_values
FROM integrated_raw;

SELECT 
program_category,
COUNT(*) AS record_count
FROM integrated_raw
GROUP BY program_category
ORDER BY record_count DESC;

SELECT
COUNT(*) AS total_records,
COUNT(managing_organization) AS available_value,
COUNT(*) - COUNT(managing_organization) AS missing_values,
COUNT(*) FILTER (WHERE TRIM(managing_organization) = '') AS blank_values
FROM integrated_raw;

SELECT
managing_organization,
COUNT(*) AS record_count
FROM integrated_raw
GROUP BY managing_organization
ORDER BY record_count DESC;

SELECT
COUNT(*) AS total_records,
COUNT(host_country) AS available_values,
COUNT(*) - COUNT(host_country) AS missing_values,
COUNT(*) FILTER(WHERE TRIM(host_country) = '') AS blank_values
FROM integrated_raw;

SELECT
host_country,
COUNT(*) AS record_count
FROM integrated_raw
GROUP BY host_country
ORDER BY record_count DESC;

SELECT
COUNT(*) AS total_records,
COUNT(duration) AS available_values,
COUNT(*) - COUNT(duration) AS missing_values
FROM integrated_raw;

SELECT
duration,
COUNT(*) AS record_count
FROM integrated_raw
GROUP BY duration
ORDER BY duration;

SELECT
COUNT(*) AS total_records,
COUNT(funding_category) AS available_values,
COUNT(*) - COUNT(funding_category) AS missing_value,
COUNT(*) FILTER (WHERE TRIM(funding_category) = '') AS blank_values
FROM integrated_raw;

SELECT
funding_category,
COUNT(*) AS record_count
FROM integrated_raw
GROUP BY funding_category
ORDER BY record_count DESC;

SELECT 
COUNT(*) AS total_records,
COUNT(learner_pk) AS available_values,
COUNT(*) - COUNT(learner_pk) AS missing_values
FROM integrated_raw;

SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT learner_pk) AS unique_learner_ids,
COUNT(*) - COUNT(DISTINCT learner_pk) AS repeated_rows
FROM integrated_raw;

SELECT
learner_pk,
COUNT (*) AS occurrence_count
FROM integrated_raw
GROUP BY learner_pk
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC
LIMIT 10;

SELECT
COUNT(*) AS repeated_learner_groups,
SUM(occurrence_count) AS rows_belonging_to_repeated_learners
FROM (
SELECT 
learner_pk,
COUNT(*) AS occurrence_count
FROM integrated_raw
GROUP BY learner_pk
HAVING COUNT(*) > 1) AS repeated_learners;

SELECT
COUNT(*) AS total_rows,
COUNT(enrollment_pk) AS available_enrollment,
COUNT(*) - COUNT(enrollment_pk) AS missing_values
FROM integrated_raw;

SELECT
COUNT(enrollment_pk) AS available_ids,
COUNT(DISTINCT enrollment_pk) AS unique_enrollment_ids,
COUNT(enrollment_pk) - COUNT(DISTINCT enrollment_pk) AS repeated_id_rows
FROM integrated_raw;

SELECT 
COUNT(*) AS total_records,
COUNT(learner_fk) AS available_learner_fk,
COUNT(*) - COUNT(learner_fk) AS missing_learner_fk
FROM integrated_raw;

SELECT
COUNT(DISTINCT learner_fk) AS unique_learner_fk
FROM integrated_raw;

SELECT
COUNT(DISTINCT learner_fk) AS unique_learner_fk,
COUNT(DISTINCT learner_pk) AS unique_learner_pk
FROM integrated_raw;

SELECT
COUNT(DISTINCT i.learner_fk) AS unmatched_learner_fk
FROM integrated_raw i
WHERE i.learner_fk IS NOT NULL
AND NOT EXISTS(
SELECT l
FROM integrated_raw l
WHERE l.learner_pk = i.learner_fk);

SELECT 
COUNT(*) AS total_rowa,
COUNT(program_fk) AS available_program_fk,
COUNT(*) - COUNT(program_fk) AS missing_program_fk
FROM integrated_raw;

SELECT
COUNT(program_fk) AS available_program_fk,
COUNT (DISTINCT program_fk) AS unique_program_fk,
COUNT(program_fk) - COUNT(DISTINCT program_fk) AS repeated_fk_rows
FROM integrated_raw;

SELECT
COUNT(DISTINCT i.program_fk) AS unmatched_program_fk
FROM integrated_raw i
WHERE i.program_fk IS NOT NULL
AND NOT EXISTS (
SELECT 1
FROM integrated_raw p
WHERE p.program_pk = i.program_fk);

SELECT
COUNT(program_pk) AS available_program_pk,
COUNT(DISTINCT program_pk) AS unique_program_pk
FROM integrated_raw;

SELECT
COUNT(*) AS total_rows,
COUNT(signup_date) AS available_dates,
COUNT(*) - COUNT(signup_date) AS missing_dates,
MIN(signup_date) AS earliest_signup_date,
MAX(signup_date) AS latest_signup_date
FROM integrated_raw;

SELECT
COUNT(*) total_rows,
COUNT(application_date) AS aavailable_dates,
COUNT(*) - COUNT(application_date) AS missing_dates,
MIN(application_date) AS earliest_application_dates,
MAX(application_date) AS latest_application_dates
FROM integrated_raw;

SELECT
COUNT(*) total_rows,
COUNT(lead_time_days) AS available_values,
COUNT(*) - COUNT(lead_time_days) AS missing_values,
COUNT(DISTINCT lead_time_days) AS distinct_values
FROM integrated_raw;

SELECT DISTINCT lead_time_days
FROM integrated_raw
WHERE lead_time_days IS NOT NULL
ORDER BY lead_time_days;

SELECT
program_pk,
COUNT(DISTINCT program_name) AS different_program_names
FROM integrated_raw
WHERE program_pk IS NOT NULL
GROUP BY program_pk
HAVING COUNT(DISTINCT program_name) > 1
ORDER BY different_program_names DESC;
