/*
Question: What are the top paying Business Analyst and Data Analyst jobs?
- Identify the 10 highest-paying Data Analyst and Business Analyst
- Focuses on job postings with specified salaries (removes null)
- Why? Highlights the top-paying opportunities for Data Analyst and Business Analyst  
*/

(
SELECT 
    job_id,
    job_title,
    job_title_short,
    job_location,
    salary_year_avg

FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10

    )
UNION ALL
(
SELECT 
    job_id,
    job_title,
    job_title_short,
    job_location,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_title_short = 'Business Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
    )
ORDER BY
    job_title_short DESC,
    salary_year_avg DESC;
