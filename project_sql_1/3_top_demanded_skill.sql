/*
What are the most in-demand skills for Data Analysis and Business Analyst.
- Join job postings to inner join table similar to query 2.
- Identify the top 5 in-demand skills for a Data Analyst and Business Analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers.
*/

(
SELECT
    job_title_short,
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    skills,
    job_postings_fact.job_title_short
ORDER BY
    demand_count DESC
LIMIT 5
)
UNION ALL
(
SELECT
    job_title_short,
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
GROUP BY 
    skills,
    job_postings_fact.job_title_short
ORDER BY
    demand_count DESC
LIMIT 5
)