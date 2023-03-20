-- Assignment 1 

/*
Question 13
Find Name of Societies where any student in enrolled
*/
select DISTINCT SName from society S,enrollment E where S.SID=E.SID ;

/* Question 14
 Find names of all students enrolled in any society and society names in 
which any student is enrolled
*/
select distinct name "Student Enrolled in any society" from student S where S.rollno in (select rollno from enrollment); 

select DISTINCT SName "society names in which any student is enrolled" from society S,enrollment E where S.SID=E.SID ;
/* Question 15
Find names of students who are enrolled in all three societies "Dhun","Hackers"and"Nark"
*/
select name from (select name,S.rollno from student S, Enrollment E where S.rollno=E.rollno and sid in (select sid from society where sname in ("Dhun","Hackers","Nark"))) as X group by X.rollno having count(*)=3 ;
/*
Question 16
Find society names that has ‘Mr X’ as mentor or ‘Ameer’ as the name of enrolled 
student.
*/
SELECT DISTINCT
    Sname
FROM
    Society,
    student,
    enrollment
WHERE
    (student.rollno = enrollment.rollno
        AND society.sid = enrollment.sid)
        AND (society.mentor = 'Mr X'
        OR student.name = 'Ameer');

/* Question 17
Find society names whose mentor name is same as that of any enrolled student in it.
*/
select distinct Sname from Society,student,enrollment where (student.rollno=enrollment.rollno and society.sid=enrollment.sid) and (society.mentor=student.name);

/* Question 18 - 
 Find the society names in which number of enrolled students are less than its capacity */
/* Question 19
Display the vacant seats for each society.
*/
create view vacant as
select E.sname,TotalSeats,enrolled from society S , enroll_count E where S.sname=E.sname;
select sname from vacant where totalseats>enrolled;

/* Question 20 - 
Find society names in which more than one students have enrolled in the given year
	*/
set @year:=#year;
select sname from society S where sid in (select sid from (select sid from enrollment where year(DateOfEnrollment)=@year ) as E group by sid having count(*)>3 );

/* Question 21
 Add enrolment fees paid (‘yes’/’No’) field in the enrollment table
*/
Alter table enrollment add column Enrollment_Fees Enum("Yes","No");

/* Question 22
Update date of enrolment of society s1 to ‘2018-01-15’, s2 to current date 
and s3 to ‘2018-01-02’.
*/
	update enrollment set dateofenrollment="2018-01-15" where sid="Soc001";
	update enrollment set dateofenrollment=curdate() where sid="Soc002";
	update enrollment set dateofenrollment="2018-01-02" where sid="Soc003";  

/* Question 23
Find society names whose enrolment is over
*/
create view vacant as
select E.sname,TotalSeats,enrolled from society S , enroll_count E where S.sname=E.sname;select totalseats-enrolled as vacant from vacant;
select sname from vacant where totalseats-enrolled=0;

/* Question 24
 Find common societies of students of courses ‘cs(h)’ and ‘cs’
*/
select sname from society where sid in (select sid from enrollment E where E.rollno in (select rollno from Student St where (St.course like "cs(h)"))) INTERSECT
select sname from society where sid in (select sid from enrollment E where E.rollno in (select rollno from Student St where (St.course like "cs")));

/* Question 25
 Create a view to keep track of society names with total number of students 
enrolled in it.
*/
create view enroll_count as
select sname,count(rollno) from society S left join enrollment E on S.sid=E.sid group by S.sid;
/* Question 26
Find student names enrolled in all societies.
*/
set @maxSociety:=(select count(*) from society);
select name from student where rollno in (select rollno from enrollment group by rollno having count(*)=@maxSociety);
