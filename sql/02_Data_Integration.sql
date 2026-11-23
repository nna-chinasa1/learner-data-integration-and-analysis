-- Data integration: supplied PostgreSQL statements.

-- SECTION 1 : TABLE JOINS AND DATA INTEGRATION
SELECT *
FROM "Learners_Demographics" AS ld
LEFT JOIN "Registration_Enrollments" AS re
ON ld.learner_pk = re.learner_fk
LEFT JOIN "Organization_Programs" AS op
ON re.program_fk = op.program_pk;

SELECT *
FROM integrated_raw; 
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_name = 'integrated_raw';

CREATE TABLE integrated_raw AS 
SELECT 
ld.learner_pk,
ld.student_full_name,
ld.age,
ld.gender,
ld.home_country,
ld.base_institution,
ld."Ex_college_faculty",
ld.academic_major,
ld.degree_level,

re.enrollment_pk,
re.learner_fk,
re.program_fk,
re.signup_date,
re.application_date,
re.lead_time_days,
re.application_status,
re.match_confidence,
re.completion_status,

op.program_pk,
op.program_name, 
op.program_category,
op.managing_organization,
op.host_country,
op.duration,
op.funding_category
FROM "Learners_Demographics" AS ld
LEFT JOIN "Registration_Enrollments" AS re
ON ld.learner_pk = re.learner_fk
LEFT JOIN "Organization_Programs" AS op
ON re.program_fk = op.program_pk;

SELECT COUNT(*) AS total_columns
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name = 'integrated_raw';

SELECT COUNT(*) AS total_records
FROM integrated_raw;
