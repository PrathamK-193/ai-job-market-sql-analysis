# intermediate_queries for AI-job-analysis

# -- Average salary by job title --
SELECT job_title, round(avg(salary_usd),2)
FROM ai_job_dataset
GROUP BY job_title;

# -- Most common job title by country --
SELECT company_location, job_title, count(*) as count
FROM ai_job_dataset
GROUP BY company_location, job_title
ORDER BY company_location, count DESC;

# -- Jobs with above-average benefits score --
SELECT job_title, company_name, benefits_score
FROM ai_job_dataset
WHERE benefits_score > (SELECT AVG(benefits_score) FROM ai_jobs);

# -- Count of jobs per industry with max, min and average salary --
SELECT industry, count(*) as job_count, max(salary_usd) AS max_sal, min(salary_usd) AS min_sal, round(AVG(salary_usd),2) AS avg_sal
FROM ai_job_dataset
GROUP BY industry;

# -- Number of remote, hybrid, and on-site jobs --
SELECT 
CASE WHEN remote_ratio = 100 THEN 'Remote' 
WHEN remote_ratio = 50 THEN 'Hybrid' 
ELSE 'on-site' 
END AS 'work_mode', count(*) AS job_count
FROM ai_job_dataset
GROUP BY work_mode;

# -- Job titles offering above-average salaries in each company --
-- Jobs with above-average salary in their own company
SELECT a.company_name, a.job_title, a.salary_usd, round(b.avg_company_salary,2) AS avg_company_salary
FROM ai_job_dataset a
JOIN (
SELECT company_name, AVG(salary_usd) AS avg_company_salary
FROM ai_job_dataset
GROUP BY company_name) b
ON a.company_name = b.company_name
WHERE a.salary_usd > b.avg_company_salary
ORDER BY a.company_name, a.salary_usd DESC;



