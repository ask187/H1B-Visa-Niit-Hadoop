register /usr/local/hive/lib/hive-exec-1.2.1.jar;
register /usr/local/hive/lib/hive-common-1.2.1.jar;
table = LOAD 'hdfs://localhost:54310/user/hive/warehouse/h1b_final' USING PigStorage('\t') as (s_no:int,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage:int,year:chararray,worksite:chararray,longitude,latitude);

filtered1= filter noheader by job_title=='DATA ENGINEER' and year== '2011';
grouploc1= group filtered1 by $8;
count1= foreach grouploc generate $0,Count(noheader.$0);

list1 =order count1 by $1 DESC;
list10a = limit list1 1;

filtered2= filter noheader by job_title=='DATA ENGINEER' and year== '2012';
grouploc2= group filtered2 by $8;
count2= foreach grouploc2 generate $0,Count(filtered2.$0);

list2 =order count2 by $1 DESC;
list10b = limit list2 1;

filtered3= filter noheader by job_title=='DATA ENGINEER' and year== '2013';
grouploc3= group filtered3 by $8;
count3= foreach grouploc3 generate $0,Count(filtered3.$0);

list3 =order count3 by $1 DESC;
list10c = limit list3 1;

filtered4= filter noheader by job_title=='DATA ENGINEER' and year== '2014';
grouploc4= group filtered4 by $8;
count4= foreach grouploc4 generate $0,Count(filtered4.$0);

list4 =order count4 by $1 DESC;
list10d = limit list4 1;


filtered5= filter noheader by job_title=='DATA ENGINEER' and year== '2015';
grouploc5= group filtered5 by $8;
count5= foreach grouploc5 generate $0,Count(filtered5.$0);

list5 =order count5 by $1 DESC;
list10e = limit list5 1;


filtered6= filter noheader by job_title=='DATA ENGINEER' and year== '2016';
grouploc6= group filtered6 by $8;
count6= foreach grouploc6 generate $0,Count(filtered6.$0);

list6 =order count6 by $1 DESC;
list10f = limit list6 1;

a1=foreach list10a generate '2011',$0,$1;
a2=foreach list10b generate '2012',$0,$1;
a3=foreach list10c generate '2013',$0,$1;
a4=foreach list10d generate '2014',$0,$1;
a5=foreach list10e generate '2015',$0,$1;
a6=foreach list10f generate '2016',$0,$1;

dump a1;
dump a2;
dump a3;
dump a4;
dump a5;
dump a6;






