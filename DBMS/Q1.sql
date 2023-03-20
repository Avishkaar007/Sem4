use studentsociety;
-- Assignment 1

/* Q1
Retrive students name enrolled in any society
*/
SELECT DISTINCT
    Name
FROM
    student
WHERE
    rollno IN (SELECT 
            rollno
        FROM
            enrollment);

-- Q2
-- Retrive all society names
SELECT 
    sname
FROM
	society;

/* Q3
Retrive Student Name whose name starts with letter "A"
*/
SELECT 
    Name
FROM
    Student
WHERE
    Name LIKE 'A%';

/* Q4
Retrieve Students studying in course CS(H) or LS
*/
SELECT 
    *
FROM
    student
WHERE
    Course IN ('CS(H)' , 'LS');

/* Q5
Retrive Students whose roll no starts with letter "C" or "A" 
*/
SELECT 
    *
FROM
    student
WHERE
    rollno LIKE 'A%' OR rollno LIKE 'C%';

/* Q6 
Retrive Society whose capacity is more than 15
*/

SELECT 
    sname
FROM
    society
WHERE
    TotalSeats > 15;

/* Q7
Update Society Table for mentor name for a specific society
*/
update society
	set Mentor = "Mr Manoj Ghai " 
where SName like "Tark";


/* Q8
Remove details for a student who is not enrolled in any society
*/


DELETE FROM student 
WHERE
    rollno NOT IN (SELECT
        rollno
    FROM
        enrollment);


/* Q9
Increment Capacity of society by 10%
*/
UPDATE society 
SET 
    TotalSeats = TotalSeats * 1.0;
SELECT
    *
FROM
    society;

/* Q10
Find the students name who are not enrolled in any society
*/
SELECT DISTINCT
    Name
FROM
    student
        RIGHT JOIN
    enrollment ON student.rollno = enrollment.rollno;

/* Q11
Find total number of Students whose age is greater than 19
*/
select count(*) from student where ( (datediff(curdate(),dob))/365 >19);

/* Q12
Find Student Name enrolled in atleast 2 societies 
*/
Select name from student natural join enrollment group by rollno having count(*)>1;

/*


