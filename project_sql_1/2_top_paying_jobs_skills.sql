/*
Question: What skills are required for top-paying Data Analyst and Business Analyst jobs?
- Use top 10 highest-paying Data Analyst and Business Analyst paying jobs from first query.
- Add specific skills required for these roles.
Why? It provides a detailed look at which high-paying jobs demand certain skills,
     helping job seekers to understand which skills to develop that align with salaries 
*/


WITH top_jobs
AS
(
(
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
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10

)
UNION ALL
(
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
))
 SELECT
    top_jobs.job_id,
    job_title,
    job_title_short,
    job_location,
    salary_year_avg,
    skills_dim.skills,
    skills_dim.type
FROM
    top_jobs
INNER JOIN 
    skills_dim
ON 
    top_jobs.skill_id = skills_dim.skill_id
ORDER BY
    job_title_short DESC,
    salary_year_avg DESC;



