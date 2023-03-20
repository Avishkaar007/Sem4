/*Question 27
Count societies with student enrolled > 2
*/

select count(*) from (select sid,count(*) from enrollment group by sid having count(*)>2) as X;

/* Question 28
 add column contact in student with default value
*/
alter table student add column contact char(10) default '1234567890';


/* Question 29
Find the name of oldest and youngest student in class along with their age 
and DOB
*/
	set @maxdiff:= (select max(datediff(curdate(),dob)) from student);
    set @mindiff:= (select min(datediff(curdate(),dob)) from student);
	select name,datediff(curdate(),dob)/365 Age,dob  from student where datediff(curdate(),dob)=@maxdiff union select name,datediff(curdate(),dob)/365 Age,dob  from student where datediff(curdate(),dob)=@mindiff ;
	
/*Question 30 - Not done yet
	Find the most popular and least popular society name (on the basis of 
	enrolled students)
*/
set @maxCount:=(select max(x.count) from (select (count(rollno)) as Count from Society S left join Enrollment E on E.sid=S.sid group by S.sid) as X);
set @minCount=(select min(x.count) from (select (count(rollno)) as Count from Society S left join Enrollment E on E.sid=S.sid group by S.sid) as X);
select sname Society_Name,x.count as Frequency from (select sname,count(rollno) Count from society S left join enrollment E on E.sid=S.sid group by S.sid) as X where x.count=@maxCount
union
select sname,x.count from (select sname,count(rollno) Count from society S left join enrollment E on E.sid=S.sid group by S.sid) as X where x.count=@minCount;

/*Question 31
Find names of students born in year 2003 and enrolled in atleast one society
*/
Select  name from student,enrollment where student.rollno=enrollment.rollno and year(dob)='2003';

/*  Question 32
Remove default value of any field
*/
alter table student modify column contact char(10) ; 

/* Question 33
Find society names where students have enrolled in month Jan/Feb
*/
select distinct sname from society S natural join enrollment E where month(DateOfEnrollment)=2 or month(DateOfEnrollment)=1;

/* Question 34
Display all students details alongwith society name if they are enrolled in 
any society
*/
select S.rollno,name,course,dob,contact,sname from student S natural join enrollment natural join society;

/* Question 35
 Display society names in uppercase and padded with character * to get a 
length of 10 characters which are mentored by mentors whose names start with 
‘S’ and ends with ‘d’ and capacity is between 10 to 20.
*/
select lpad(upper(sname),10,"*") Society_Name from society where mentor like "S%d" and 10<totalSeats<20;