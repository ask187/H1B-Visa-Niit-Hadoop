--5) Find the most popular top 10 job positions for H1B visa applications for each year?

select job_title,year,count(case_status) as count_job from h1b_final where year = 2011 group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where year = 2012 group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where year = 2013 group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where year = 2014 group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where year = 2015 group by job_title order by count_job desc limit 10;
select job_title,year,count(case_status) as count_job from h1b_final where year = 2016 group by job_title order by count_job desc limit 10;
