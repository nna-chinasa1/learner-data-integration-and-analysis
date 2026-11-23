-- Exploratory data analysis and profiling of the three source tables.

SELECT
table_schema,
table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE'
ORDER BY table_name;

SELECT * 
FROM "Learners_Demographics"
LIMIT 10 ;

SELECT
COUNT(*) AS total_records,
COUNT(learner_pk) AS non_null_learner_pk,
COUNT(DISTINCT learner_pk) AS unique_learner_pk,
COUNT(*) - COUNT(DISTINCT learner_pk) AS duplicate_learner_pk
FROM "Learners_Demographics";

SELECT
COUNT(*) AS total_records,
COUNT(*) - COUNT(learner_pk) AS missing_learner_pk,
COUNT(*) - COUNT(student_full_name) AS missing_atudent_full_name,
COUNT(*) - COUNT(age) AS missing_age,
COUNT(*) - COUNT(gender) AS missing_gender,
COUNT(*) - COUNT(home_country) AS missing_home_country,
COUNT(*) - COUNT(base_institution) AS missing_home_institutio n,
COUNT(*) - COUNT("Ex_college_faculty") AS missing_ex_college_faculty,
COUNT(*) - COUNT(academic_major) AS missing_academic_major,
COUNT(*) - COUNT(degree_level) AS missing_degree_level
FROM "Learners_Demographics";

SELECT
COUNT(age) AS valid_age_records,
MIN(age) AS minimum_age,
MAX(age) AS maximum_age,
ROUND(avg(age), 2) AS average_age,
PERCENTILE_CONT(0.5) 
WITHIN GROUP (ORDER BY age) AS median_age,
MODE() WITHIN GROUP (ORDER BY age) AS most_common_age
FROM "Learners_Demographics";

SELECT 
age,
COUNT(*) AS number_of_learnera
FROM "Learners_Demographics"
WHERE age < 0
GROUP BY age
ORDER BY age;

SELECT 
age,
COUNT(*) AS number_of_learners,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(age) 
FROM "Learners_Demographics"), 2
) AS percentage
FROM "Learners_Demographics"
WHERE age IS NOT NULL
GROUP BY age
ORDER BY age;

SELECT
gender,
COUNT(*) AS number_of_learners
FROM "Learners_Demographics"
GROUP BY gender
ORDER BY number_of_learners DESC;

SELECT
home_country,
COUNT(*) AS number_of_learners,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*)
FROM "Learners_Demographics"), 2)
AS percentage 
FROM "Learners_Demographics"
GROUP BY home_country
ORDER BY number_of_learners DESC;

SELECT
base_institution,
COUNT(*) AS number_of_learners,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*) 
FROM "Learners_Demographics"), 2) AS percentage
FROM "Learners_Demographics"
GROUP BY base_institution
ORDER BY number_of_learners DESC;

SELECT 
base_institution,
COUNT(*) AS number_of_learners
FROM "Learners_Demographics"
GROUP BY base_institution;

SELECT
"Ex_college_faculty",
COUNT(*) AS number_of_learners,
ROUND(
COUNT(*) * 100.0 / 
(SELECT COUNT(*) 
FROM "Learners_Demographics"), 2) AS percentage
FROM "Learners_Demographics"
GROUP BY "Ex_college_faculty"
ORDER BY number_of_learners DESC;

SELECT
"Ex_college_faculty",
LENGTH("Ex_college_faculty") AS name_leagth,
COUNT(*) AS learner_count
FROM "Learners_Demographics"
GROUP BY 1, 2
ORDER BY 1;

SELECT
LENGTH("Ex_college_faculty") AS name_length,
COUNT(*) AS learner_count
FROM "Learners_Demographics"
GROUP BY LENGTH("Ex_college_faculty")
ORDER BY name_length;

SELECT
academic_major,
COUNT(*) AS number_of_learners,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*)
FROM "Learners_Demographics"), 2) AS percentage
FROM "Learners_Demographics"
GROUP BY academic_major
ORDER BY number_of_learners DESC;

SELECT
degree_level,
COUNT(*) AS number_of_learners,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*)
FROM "Learners_Demographics"), 2) AS percentage
FROM "Learners_Demographics"
GROUP BY degree_level
ORDER BY number_of_learners DESC;

SELECT
COUNT(*) AS total_records,
COUNT(degree_level) AS non_null_records,
COUNT(*) - COUNT(degree_level) AS null_records,
COUNT(*) FILTER(
WHERE TRIM(degree_level) = '') AS blank_records
FROM "Learners_Demographics";

SELECT 
COUNT(*) AS total_records,
COUNT(gender) AS non_null_gender_records,
COUNT(*) - COUNT(gender) AS null_gender_records,
COUNT(DISTINCT gender) AS distinct_gender_values
FROM "Learners_Demographics";

SELECT
column_name,
data_type,
is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name = 'Organization_Programs'
ORDER BY ordinal_position;

SELECT *
FROM "Organization_Programs"
LIMIT 10;

SELECT
COUNT(*) AS total_program_records,
COUNT(program_pk) AS non_null_program_pk,
COUNT(DISTINCT program_pk) AS unique_program_pk,
COUNT(*) - COUNT(DISTINCT program_pk) AS duplicate_program_pk
FROM "Organization_Programs";

SELECT
COUNT(*) AS total_records,
COUNT(*) - COUNT(program_pk) AS missing_program_pk,
COUNT(*) - COUNT(program_name) AS missing_program_name,
COUNT(*) - COUNT(program_category) AS missing_program_category,
COUNT(*) - COUNT(managing_organization) AS missing_managing_organization,
COUNT(*) - COUNT(host_country) AS missing_host_country,
COUNT(*) - COUNT(duration) AS missing_duration,
COUNT(*) - COUNT(funding_category) AS missing_funding_category
FROM "Organization_Programs";

SELECT 
COUNT(duration) AS valid_duration_records,
MIN(duration) AS minimum_duration,
MAX(duration) AS maximum_duration,
ROUND(AVG(duration), 2) AS average_duration,
PERCENTILE_CONT (0.5)
WITHIN GROUP (ORDER BY duration) AS median_duration,
MODE() WITHIN GROUP (ORDER BY duration) AS most_common_duration
FROM "Organization_Programs";

SELECT
duration,
COUNT(*) AS number_of_programs,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*)
FROM "Organization_Programs"), 2) AS percentage
FROM "Organization_Programs"
GROUP BY duration
ORDER BY duration;

SELECT
program_category,
COUNT(*) AS number_of_programs,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*)
FROM "Organization_Programs"), 2) AS percentage
FROM "Organization_Programs"
GROUP BY program_category
ORDER BY number_of_programs DESC;

SELECT
funding_category,
COUNT(*) AS number_of_programs,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*)
FROM "Organization_Programs"), 2) AS percentage
FROM "Organization_Programs"
GROUP BY funding_category
ORDER BY number_of_programs DESC;

SELECT
host_country,
COUNT(*) AS number_of_programs,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*)
FROM "Organization_Programs"), 2) AS percentage
FROM "Organization_Programs"
GROUP BY host_country
ORDER BY number_of_programs DESC;

SELECT
managing_organization,
COUNT(*) AS number_of_programs,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*)
FROM "Organization_Programs"), 2) AS percentage
FROM "Organization_Programs"
GROUP BY managing_organization
ORDER BY number_of_programs DESC;

SELECT 
program_name,
COUNT(*) AS number_of_records
FROM "Organization_Programs"
GROUP BY program_name
HAVING COUNT(*) > 1
ORDER BY number_of_records DESC, program_name;

SELECT
program_name,
COUNT(*) AS number_of_records,
COUNT(DISTINCT program_category) AS distinct_categories,
COUNT(DISTINCT managing_organization) AS distinct_organization,
COUNT(DISTINCT host_country) AS distinct_host_countries,
COUNT(DISTINCT duration) AS distinct_duration,
COUNT(DISTINCT funding_category) AS distinct_funding_category
FROM "Organization_Programs"
GROUP BY program_name
HAVING COUNT(*) > 1
ORDER BY number_of_records DESC;

SELECT
COUNT(DISTINCT managing_organization) AStotal_distinct_organizations
FROM "Organization_Programs";

SELECT
COUNT(*) FILTER (
WHERE program_pk = ''
) AS blank_program_pk,
COUNT(*) FILTER (
WHERE program_name = ''
) AS blank_program_name,
COUNT(*) FILTER (
WHERE program_category = ''
) AS blank_program_category,
COUNT(*) FILTER (
WHERE managing_organization = ''
) AS blank_managing_organization,
COUNT(*) FILTER (
WHERE host_country = ''
) AS blank_host_country,
COUNT(*) FILTER (
WHERE funding_category = ''
) AS blank_funding_category,
COUNT(*) FILTER (
WHERE program_pk <> '' AND BTRIM(program_pk) = ''
) AS whitespace_program_pk,
COUNT(*) FILTER (
WHERE program_name <> '' AND BTRIM(program_name) = ''
) AS whitespace_program_name,
COUNT(*) FILTER (
WHERE program_category <> '' AND BTRIM(program_category) = ''
) AS whitespace_program_category,
COUNT(*) FILTER (
WHERE managing_organization <> '' AND BTRIM(managing_organization) = ''
) AS whitespace_managing_organization,
COUNT(*) FILTER (
WHERE host_country <> '' AND BTRIM(host_country) = ''
) AS whitespace_host_country,
COUNT(*) FILTER (
WHERE funding_category <> '' AND BTRIM(funding_category) = ''
) AS whitespace_funding_category
FROM "Organization_Programs";

SELECT
program_category,
funding_category,
COUNT(*) AS number_of_programs,
ROUND(
COUNT(*) * 100.0 /
SUM(COUNT(*)) OVER (
PARTITION BY program_category), 2)
AS percentage_within_category
FROM "Organization_Programs"
GROUP BY 
program_category,
funding_category
ORDER BY
program_category,
number_of_programs DESC;

SELECT
program_category,
funding_category,
COUNT(*) AS number_of_programs
FROM "Organization_Programs"
WHERE program_category IN ('Marketing', 'Security')
GROUP BY 
program_category,
funding_category
ORDER BY
program_category,
funding_category;

SELECT *
FROM "Registration_Enrollments"
LIMIT 10;

SELECT
COUNT(*) AS total_records,
COUNT(enrollment_pk) AS non_null_enrollment_pk,
COUNT(DISTINCT enrollment_pk) AS unique_enrollment_pk
FROM "Registration_Enrollments"

SELECT
COUNT(*) - COUNT(enrollment_pk) AS missing_enrollment_pk,
COUNT(*) - COUNT(learner_fk) AS missing_learner_fk,
COUNT(*) - COUNT(program_fk) AS missing_program_fk,
COUNT(*) - COUNT(signup_date) AS missing_signup_date,
COUNT(*) - COUNT(application_date) AS missing_application_date,
COUNT(*) - COUNT(lead_time_days) AS missing_lead_time_days,
COUNT(*) - COUNT(application_status) AS missing_application_status,
COUNT(*) - COUNT(match_confidence) AS missing_match_confidence,
COUNT(*) - COUNT(completion_status) AS missing_completion_status
FROM "Registration_Enrollments";

SELECT
COUNT(*) AS total_records,
COUNT(*) FILTER (
WHERE lead_time_days =
application_date - signup_date) AS matching_records,
COUNT(*) FILTER (
WHERE lead_time_days <>
application_date - signup_date)
AS mismatched_records
FROM "Registration_Enrollments";

SELECT
application_status,
COUNT(*) AS number_of_records,
ROUND(
COUNT(*) * 100.0 /
SUM(COUNT(*)) OVER (), 2) AS percentage
FROM "Registration_Enrollments"
GROUP BY application_status
ORDER BY number_of_records DESC;

SELECT
completion_status,
COUNT(*) AS number_of_records,
ROUND(
COUNT(*) * 100.0 /
SUM(COUNT(*)) OVER (), 2) AS percentage
FROM "Registration_Enrollments"
GROUP BY completion_status
ORDER BY number_of_records DESC;

SELECT
match_confidence,
COUNT(*) AS number_of_records,
ROUND(
COUNT(*) * 100.0 /
SUM(COUNT(*)) OVER (), 2) AS percentage
FROM "Registration_Enrollments"
GROUP BY match_confidence
ORDER BY number_of_records DESC;

SELECT COUNT(*) FROM "Registration_Enrollments"
WHERE match_confidence IS NULL;

SELECT COUNT(*)
FROM "Registration_Enrollments"
WHERE match_confidence LIKE '%\%5' ESCAPE '/';

SELECT match_confidence
FROM "Registration_Enrollments"
WHERE match_confidence IS NOT NULL
LIMIT 10;

SELECT DISTINCT match_confidence
FROM "Registration_Enrollments"
WHERE match_confidence IS NOT NULL
ORDER BY match_confidence;

SELECT COUNT(*)
FROM "Registration_Enrollments"
WHERE match_confidence LIKE '%\%%';

SELECT 
MIN(match_confidence),
MAX(match_confidence)
FROM "Registration_Enrollments"
WHERE match_confidence IS NOT NULL;
