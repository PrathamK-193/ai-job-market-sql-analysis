# basic SQL queries for AI-job-market analysis

# -- Top 5 highest-paying AI job titles --
SELECT job_title, salary_usd
FROM ai_job_dataset
ORDER BY salary_usd DESC
LIMIT 5;

# -- Show top 5 job titles by number of listings --
SELECT job_title, COUNT(*) AS job_count
FROM ai_job_dataset
GROUP BY job_title
ORDER BY job_count DESC
LIMIT 5;

# -- Count of jobs per experience level --

SELECT experience_level, COUNT(*) AS job_count
FROM ai_job_dataset
GROUP BY experience_level;

# -- List jobs offering 100% remote work --
SELECT job_title, company_name, remote_ratio
FROM ai_job_dataset
WHERE remote_ratio = 100;

# -- Find jobs posted after 1st January, 2025 --
SELECT *
FROM ai_job_dataset
WHERE posting_date > '2025-01-01';

