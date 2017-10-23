--7) Create a bar graph to depict the number of applications for each year [All]

select year,count(*)  from h1b_final  where year !=null and year!='NA' group by  year order by year;
