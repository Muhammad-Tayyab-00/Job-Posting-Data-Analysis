/*
Question: What are the top paying Business Analyst and Data Analyst jobs?
- Identify the 10 highest-paying Data Analyst and Business Analyst
- Focuses on job postinhs with specified salaries (removes null)
- Why? Highlights the top-payingn oppertunities for Data Analyst and Business Analyst  
*/


SELECT 
    job_id,
    job_title,
    job_title_short,
    job_location,
    salary_year_avg

FROM
    job_postings_fact
WHERE
    job_title_short in  ('Data Analyst','Business Analyst') AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY job_title_short,salary_year_avg DESC
LIMIT 20



SELECT 
    job_postings_fact.job_id,
    
    job_title,
    job_title_short,
    job_location,
    salary_year_avg,
    skills_job_dim.skill_id
FROM
    job_postings_fact
LEFT JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE
    job_title_short = 'Business Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10

  