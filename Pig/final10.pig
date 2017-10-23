register /usr/local/hive/lib/hive-exec-1.2.1.jar;
register /usr/local/hive/lib/hive-common-1.2.1.jar;
table = LOAD 'hdfs://localhost:54310/user/hive/warehouse/h1b_final' USING PigStorage('\t') as (s_no:int,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage:int,year:chararray,worksite:chararray,longitude,latitude);

noheader= filter table by $0>=1;
cleansed= filter noheader by $1 is not null and $1!='NA';
temp= group cleansed by $4;
total= foreach temp generate group,COUNT(cleansed.$1);


certified= filter noheader by $1 == 'CERTIFIED';
temp1= group certified by $4;
totalcertified= foreach temp1 generate group,COUNT(certified.$1);

certified= filter noheader by $1 == 'CERTIFIED-WITHDRAWN';
temp2= group certified by $4;
totalcertifiedwithdrawn= foreach temp2 generate group,COUNT(certified.$1);

joined= join totalcertified by $0,totalcertifiedwithdrawn by $0,total by $0;
joined= foreach joined generate $0,$1,$3,$5;
intermediateoutput= foreach joined generate $0,(float)($1+$2)*100/($3),$3;
intermediateoutput2= filter intermediateoutput by $1>70 and $2>1000;
finaloutput= order intermediateoutput2 by $1 DESC;

store finaloutput into '/home/hduser/niit/pig/question10' using PigStorage('\t');

