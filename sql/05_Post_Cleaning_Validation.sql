-- Post-cleaning validation of integrated_cleaned.

-- SECTION 5 : POST CLEANING VALIDATION


SELECT
(SELECT COUNT(*) FROM integrated_raw) AS raw_rows,
(SELECT COUNT(*) FROM integrated_cleaned) AS cleaned_rows;

SELECT COUNT(*) total_columns
FROM information_schema.columns
WHERE table_schema  = 'public'
AND table_name = 'integrated_cleaned';

SELECT 
COUNT(*) FILTER (WHERE age < 0) AS negative_ages,
COUNT(*) FILTER (WHERE age IS NULL) AS missing_ages
FROM integrated_cleaned;

SELECT
column_name,
data_type
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name = 'integrated_cleaned'
AND column_name = 'match_confidence';

SELECT COUNT(DISTINCT home_country) AS distinct_countries
FROM integrated_cleaned;

SELECT
gender,
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

SELECT
completion_status,
COUNT(*) AS record_count
FROM integrated_cleaned
GROUP BY completion_status
ORDER BY completion_status;

SELECT
COUNT(DISTINCT academic_major) AS distinct_academic_majors,
COUNT(DISTINCT degree_level) AS distinct_degree_levels
FROM integrated_cleaned;

SELECT
funding_category,
COUNT(*) record_count 
FROM integrated_cleaned
GROUP BY funding_category
ORDER BY funding_category;

UPDATE integrated_cleaned
SET funding_category = 'Self-funded'
WHERE funding_category = 'Self_Funded';

SELECT DISTINCT academic_major 
FROM integrated_cleaned
ORDER BY academic_major;

SELECT DISTINCT degree_level
FROM integrated_cleaned
ORDER BY degree_level;
