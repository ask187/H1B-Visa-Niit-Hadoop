-- b)for only certified 
select job_title,year,count(case_status) as count_job from h1b_final where case_status =”CERTIFIED” and year = "2011" group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where case_status =”CERTIFIED” and year = "2012" group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where case_status =”CERTIFIED” and year = "2013" group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where case_status =”CERTIFIED” and year = "2014" group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where case_status =”CERTIFIED” and year = "2015" group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where case_status =”CERTIFIED” and year = "2016" group by job_title order by count_job desc limit 10;
