# advanced SQL queries for AI-job-market analysis

# -- Top 5 highest-paid jobs in each country --
SELECT *
FROM
(SELECT job_title, company_name, company_location, salary_usd, ROW_NUMBER() over (PARTITION BY company_location ORDER BY salary_usd DESC) 
AS rank_in_country
FROM ai_job_dataset) AS ranked
WHERE rank_in_country<=5;

# -- Average benefits score per company per location (with ranking)
SELECT company_location, company_name, round(AVG(benefits_score),2) AS avg_benefit, RANK() over (PARTITION BY company_location ORDER BY avg(benefits_score) DESC) AS benefit_rank
FROM ai_job_dataset
GROUP BY company_location, company_name
ORDER BY company_location, benefit_rank;

# -- Industry having the highest salary per experience level --
SELECT experience_level, industry, round(AVG(salary_usd),2) AS avg_salary
FROM ai_job_dataset
GROUP BY experience_level, industry
ORDER BY experience_level, avg_salary DESC;

