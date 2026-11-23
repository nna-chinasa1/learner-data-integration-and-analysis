-- Data cleaning: supplied PostgreSQL statements.

-- SECTION 4 : DATA CLEANING

CREATE TABLE integrated_cleaned AS
SELECT *
FROM integrated_raw;

SELECT
COUNT(*) FILTER (
WHERE "Ex_college_faculty" <> BTRIM("Ex_college_faculty")) AS faculty_spaces,
COUNT(*) FILTER (
WHERE home_country <> BTRIM(home_country)) AS country_spaces,
COUNT(*) FILTER(
WHERE student_full_name <> BTRIM(student_full_name)) AS name_spaces,
COUNT(*) FILTER (
WHERE academic_major <> BTRIM(academic_major)) AS major_spaces,
COUNT(*) FILTER(
WHERE gender <> BTRIM(gender)) AS gender_spaces
FROM integrated_cleaned;

UPDATE integrated_cleaned
SET
"Ex_college_faculty" = BTRIM("Ex_college_faculty"),
home_country = BTRIM(home_country)
WHERE "Ex_college_faculty" <> BTRIM("Ex_college_faculty")
OR home_country <> BTRIM(home_country);

SELECT 
COUNT(*) FILTER (
WHERE "Ex_college_faculty" <> BTRIM("Ex_college_faculty")) AS remaining_faculty_spaces,
COUNT(*) FILTER (
WHERE home_country <> BTRIM(home_country)) AS remaining_faculty_spaces
FROM integrated_cleaned;

SELECT
COUNT(DISTINCT "Ex_college_faculty") AS disticnt_faculties
FROM integrated_cleaned;

SELECT 
home_country,
COUNT(*) AS record_count
FROM integrated_cleaned
GROUP BY home_country
ORDER BY home_country;

SELECT
home_country AS original_country,
CASE
WHEN UPPER(home_country) IN ('NIGERIA', 'NGA') THEN 'Nigeria'
WHEN UPPER(home_country) IN ('GHANA', 'GHA') THEN 'Ghana'
WHEN UPPER(home_country) IN ('KENYA', 'KEN') THEN 'Kenya'
WHEN UPPER(home_country) IN ('SOUTH AFRICA', 'ZAF') THEN 'South Africa'
WHEN UPPER(home_country) IN ('EGYPT', 'EGY') THEN 'Egypt'
WHEN UPPER(home_country) IN ('CANADA', 'CAN') THEN 'Canada'
WHEN UPPER(home_country) IN ('GERMANY', 'DEU') THEN 'Germany'
WHEN UPPER(home_country) IN ('RWANDA', 'RWA') THEN 'Rwanda'
WHEN UPPER(home_country) IN ('UNITED KINGDOM', 'UK') THEN 'United Kingdom'
WHEN UPPER(home_country) IN ('UNITED STATES', 'USA') THEN 'United States'
WHEN UPPER(home_country) IN ('INDIA', 'IND') THEN 'India'
ELSE home_country
END AS standardised_country
FROM integrated_cleaned
GROUP BY home_country
ORDER BY standardised_country;

SELECT 
COUNT(DISTINCT home_country) AS distinct_countries
FROM integrated_cleaned;

SELECT 
home_country,
COUNT(*) AS record_count
FROM integrated_cleaned
GROUP BY home_country
ORDER BY home_country;

UPDATE integrated_cleaned
SET home_country =
CASE
WHEN UPPER(home_country) IN ('NIGERIA', 'NGA') THEN 'Nigeria'
WHEN UPPER(home_country) IN ('GHANA', 'GHA') THEN 'Ghana'
WHEN UPPER(home_country) IN ('KENYA', 'KEN') THEN 'Kenya'
WHEN UPPER(home_country) IN ('SOUTH AFRICA', 'ZAF') THEN 'South Africa'
WHEN UPPER(home_country) IN ('EGYPT', 'EGY') THEN 'Egypt'
WHEN UPPER(home_country) IN ('CANADA', 'CAN') THEN 'Canada'
WHEN UPPER(home_country) IN ('GERMANY', 'DEU') THEN 'Germany'
WHEN UPPER(home_country) IN ('RWANDA', 'RWA') THEN 'Rwanda'
WHEN UPPER(home_country) IN ('UNITED KINGDOM', 'UK') THEN 'United Kingdom'
WHEN UPPER(home_country) IN ('UNITED STATES', 'USA') THEN 'United States'
WHEN UPPER(home_country) IN ('INDIA', 'IND') THEN 'India'
ELSE home_country
END;

SELECT 
COUNT(DISTINCT home_country) AS distinct_countries
FROM integrated_cleaned;

SELECT 
gender,
COUNT(*) AS record_count
FROM integrated_cleaned
GROUP BY gender
ORDER BY gender;

UPDATE integrated_cleaned
SET gender = 
CASE 
WHEN UPPER(BTRIM(gender)) IN ('F', 'FEMALE') THEN 'Female'
WHEN UPPER(BTRIM(gender)) IN ('M', 'MALE') THEN 'Male'
WHEN UPPER(BTRIM(gender)) ='OTHER' THEN 'Other'
ELSE NULL
END;

SELECT
COALESCE(gender, '[NULL]') AS gender_category,
COUNT(*) AS record_count
FROM integrated_cleaned
GROUP BY gender
ORDER BY gender;

SELECT
application_status,
COUNT(*) AS record_count
FROM integrated_cleaned
GROUP BY application_status
ORDER BY application_status;

UPDATE integrated_cleaned
SET application_status =
CASE
WHEN UPPER(BTRIM(application_status)) = 'ACCEPTED' THEN 'Accepted'
WHEN UPPER(BTRIM(application_status)) = 'APPLIED' THEN 'Applied'
WHEN UPPER(BTRIM(application_status)) = 'COMPLETED' THEN 'Completed'
WHEN UPPER(BTRIM(application_status)) = 'ENROLLED' THEN 'Enrolled'
WHEN UPPER(BTRIM(application_status)) = 'PENDING' THEN 'Pending'
WHEN UPPER(BTRIM(application_status)) = 'REJECTED' THEN 'Rejected'
WHEN UPPER(BTRIM(application_status)) = 'WITHDRAWN' THEN 'Withdrawn'
ELSE NULL
END;

SELECT
application_status,
COUNT(*) AS record_count
FROM integrated_cleaned
GROUP BY application_status
ORDER BY application_status;

UPDATE integrated_cleaned
SET completion_status =
CASE
WHEN UPPER(BTRIM(completion_status)) = 'COMPLETED' THEN 'Completed'
WHEN UPPER(BTRIM(completion_status)) = 'IN PROGRESS' THEN 'In Progress'
WHEN UPPER(BTRIM(completion_status)) = 'DROPPED OUT' THEN 'Dropped Out'
WHEN UPPER(BTRIM(completion_status)) = 'N/A' THEN 'N/A'
ELSE NULL
END;

SELECT
completion_status,
COUNT(*) AS record_count
FROM integrated_cleaned
GROUP BY completion_status
ORDER BY completion_status;

ALTER TABLE
integrated_cleaned
ALTER COLUMN match_confidence TYPE NUMERIC
USING NULLIF(REPLACE(BTRIM(match_confidence), '%', ''),'')::NUMERIC;

UPDATE integrated_cleaned
SET academic_major =
CASE
WHEN UPPER(BTRIM(academic_major)) IN ('CS', 'COMP SCI', 'COMPUTER SCIENCE') THEN 'Computer Science'
WHEN UPPER(BTRIM(academic_major)) IN ('IT', 'INFORMATION TECHNOLOGY') THEN 'Information Technology'
WHEN UPPER(BTRIM(academic_major)) IN ('BUSINESS ADMIN', 'BUSINESS ADMINISTRATION') THEN 'Business Administration'
WHEN UPPER(BTRIM(academic_major)) = 'DATA ANALYTICS' THEN 'Data Analytics' 
ELSE BTRIM(academic_major)
END;

UPDATE integrated_cleaned
SET degree_level =
CASE
WHEN UPPER(BTRIM(degree_level)) ='UNDERGRADUATE' THEN 'Undergraduate'
WHEN UPPER(BTRIM(degree_level)) = 'MASTERS' THEN 'Masters'
WHEN UPPER(BTRIM(degree_level)) ='B.Sc.' THEN 'B.Sc.'
WHEN UPPER(BTRIM(degree_level)) = 'M.S.c' THEN 'M.Sc.' 
WHEN UPPER(BTRIM(degree_level)) = 'PHD' THEN 'PhD'
ELSE BTRIM(degree_level)
END;


UPDATE integrated_cleaned
SET funding_category =
CASE
WHEN UPPER(BTRIM(funding_category)) ='SELF-FUNDED' THEN 'Self-funded'
WHEN UPPER(BTRIM(funding_category)) = 'FULLY FUNDED' THEN 'Fully Funded'
WHEN UPPER(BTRIM(funding_category)) ='PARTIAL' THEN 'Partial'
WHEN UPPER(BTRIM(funding_category)) = 'PARTIAL SCHOLARSHIP' THEN 'Partial Scholarship' 
ELSE BTRIM(funding_category)
END;

UPDATE integrated_cleaned
SET age = NULL
WHERE age = -4;
