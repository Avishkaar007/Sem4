	/* Employee Department */

/* DDL COMMANDS */
create database EMP_DEPT;
use EMP_DEPT;

create table Department(
Dno enum('10','20','30','40','50') NOT NULL PRIMARY KEY,
DName varchar(50) DEFAULT NULL,
Location varchar(50) Default "New Delhi"
);
/*Foreign key references Employee(Eno)*/
create table Employee (
Eno char(3) NOT NULL primary key,
Ename Varchar(50) not null,
Job_Type varchar(50) not null,
Manager char(3) ,
Hire_Date date Not Null,
Commission Decimal(10,2),
Salary Decimal(7,2) Not Null,
Check (5000>Salary and Salary>1000),
Dno enum('10','20','30','40','50'),
foreign key (Dno) references Department(Dno)
);



/* Question 1
Query to display Employee Name, Job, Hire Date, Employee Number;
for each employee with the Employee Number appearing first
*/

Select Eno, Ename,Job_Type,Hire_Date from employee;

/* Question 2
 Query to display Unique Jobs from the Employee Table. 
 */
 select distinct job_type from employee;
 
 /* Question 3
 Query to display the Employee Name concatenated by a Job separated by a comma.
 */
 select concat_ws(",",ename,job_type) from employee;
 
 /* Question 4
 Query to display all the data from the Employee Table. Separate each Column by a comma and name 
the said column as THE_OUTPUT.
*/
select concat_ws(" , ", eno, ename,job_type , manager, hire_date, commission,salary,dno) THE_OUTPUT  from employee;

/* Question 5
Query to display the Employee Name & Salary of all the employees earning more than $2850.
*/
select ename,salary from employee where salary>2850;

/*Question 6 
 Query to display Employee Name & Department Number for the Employee No= 790
 */
 select ename,dno from employee where eno=790;
 
/*Question 7
Query to display Employee Name & Salary for all employees whose salary is not in
the range of $1500 and $2850. 
*/
select ename,salary from employee where salary not between 1500 and 2850;

/*Question 8
Query to display Employee Name, Job, and Hire Date of all the employees hired between Feb 20, 
1981 and May 1, 1981. Order the query in ascending order of Start Date.
*/
select ename,job_type,hire_date from employee where hire_date between "1981-02-20" and "1981-05-01" order by hire_date;

/* Question 9
Query to display Employee Name & Department No. of all the employees in Dept 10 and Dept 30 in 
the alphabetical order by name. 
*/
select ename,dno from employee where dno in ('10','30') order by ename;

/* Question 10
 Query to display Employee Name & Salary of employees who earned more than $1500 and are in 
Department 10 or 30.
*/
select ename,salary from employee where dno in ('10','30') and salary>1500;

/* Question 11
Query to display Name & Hire Date of every Employee who was hired after 1981. 
*/
select ename,hire_date from employee where year(hire_date)>1981;


/* Question 12
Query to display Name & Job of all employees who don’t have a current Manager.
*/
select * from employee where Manager is NULL;

/* Question 13
Query to display the Name, Salary & Commission for all the employees who earn commission. Sort 
the data in descending order of Salary and Commission.
*/
select ename,salary,commission from employee where commission!=0 order by salary desc,commission desc;

/* Question 14
 Query to display Name of all the employees where the third letter of their name is ‘A’ and job type is 
manager.
*/
select ename from employee where ename like "__A%" and job_type="Manager";

/* Question 15
Query to display Name of all employees either have two ‘R’s or have two ‘A’s in their name & are 
either in Dept No = 30 or their Manger’s Employee No = 778.
*/
select ename from employee where ename like "%a%a%" or ename like "%r%r%" and dno="30" and Manager=778;

/* Question 16
Query to display Name, Job and Salary of all employees whose Job is Clerical or Analyst & their 
salaries are not equal to 1000, 3000, or 5000.
*/
select ename,job_type,salary from employee where job_type="Clerical" or job_type="Analyst" and salary not in (1000,3000,5000);

/* Question 17
 Query to display Name, Salary and Commission for all employees whose Commission Amount is 
greater than their Salary increased by 5 %
*/
select ename,salary,commission from employee where commission>(1.05)*salary;

/* Question 18
Query to display the Current Date and the last date on which any employee joined.
*/

select curdate , max(hire_Date) from employee;

/* Question 19
 Query to display Employee No., Name, Salary and the Salary increased by 15 % expressed as a 
absolute whole number.
*/
select eno,ename,salary , FORMAT((salary*1.15),0) "115% SALARY" from employee;

/* QUESTION 20
Query to display Name, Hire Date and Salary Review Date which is the 1st Monday after six months of 
employment. 
*/


/*Question 21
Query to display the employees that earns a salary that is higher than the salary of any of the clerks
along with the difference in salary. 
*/


/* Question 22
Query to display Name and calculate the number of months between today and the date each 
employee was hired. 
*/

select (year(curdate())-year(hire_date))*12+(month(curdate())-month(hire_date)) Month_Diff from employee;


/* Question 23
Query to display the following for each employee:- <E-Name> earns < Salary> monthly but wants < 3 
* Current Salary >. Label the Column as Dream Salary
*/

select concat(ename," earns ",salary," monthly but wants ",3*salary) "Dream Salary" from employee; 

/* Question 24
 Query to display Name and Salary for all employees. Format the salary to be 15 character long, left 
padded with $ sign. 
*/
select lpad(salary,15,"$") from employee;


/* Question 25
Query to display Name with the 1st letter capitalized and all other letter lower case & length of their 
name of all the employees whose name starts with ‘J’,’A’ and ‘M
*/
 select concat(left(ename,1),substring(ename,2)) as Name from employee where ename like "J%" or ename like "A%" or  ename like "M%" ;

/* Question 26
 Query to display Name, Hire Date and Day of the week on which the employee started his/her job
 */
 select ename , hire_date , dayofweek(hire_date) DayOfWeek from employee;
 
 /* Question 27
 Query to display Name and Commission Amount. If the employee does not earn commission then 
use default value ‘No Commission’.
*/
select ename,if(commission>0,commission,"No Commission") from employee;
    
/* Question 28
 Query to display Name, Department Name and Department No for all the employees.
 */
 select ename , dname ,dno from employee natural join department;
 
 /* Question 29
  Query to display Unique Listing of all Jobs that are in Department # 30
  */
  
  select distinct job_type from employee where dno="30";
  
  /* Question 30
  Query to display Name, Department Name and Location for all employees earning a commission
  */
  select ename,dname,location from employee natural join  department where commission>0;
  
/* Question 31
Query to display Name, Dept Name of all employees who have an ‘A’ in their name and works at 
user-specified location.
*/
set @location=#EnterLoc;
"chicago";
select ename,dname from employee natural join department where (ename like "%A%") and location=@location;

/* Question 32
 Query to display Name, Job, Department No. and Department Name for all the employees working 
at the Dallas location.
*/
select ename,job_type,dno,dname from employee natural join department where location="Dallas";

/* Question 33
Query to display Name and Employee No. along with their Manager’s Name and Manager’s 
employee no. */
select A.eno,A.ename,A.manager,B.ename "Manager's Name" from employee A , employee B where A.manager=B.eno;

/* Question 34
Query to display Name and Employee no. along with their Manger’s Name and the Manager’s 
employee no; along with the Employees’ Name who do not have a Manager
*/
select A.eno,A.ename,A.manager,B.ename "Manager's Name" from employee A left join employee B on A.manager=B.eno or A.manager=NULL;

/* Question 35
Query to display the Employee No, Name and Salary for all employees who earn than the average 
salary and who work in a Department with any employee with a ‘T’ in his/her name.
*/

select eno,ename,salary from employee where (salary >(select avg(salary) from employee)) and (dno =any(select dno from employee where ename like "%t%")); 

/* Question 36
Query to display Name, Dept No. & Salary of any employee whose department No. and salary 
matches both the department no. and the salary of any employee who earns a commission. 
*/
select A.ename,A.dno,A.salary from employee A,employee B where B.dno=A.dno and A.salary=B.salary and B.commission>0 and A.commission=0;

/* Question 37
 Query to display Name, Hire Date of any employee hired after the employee Blake was hired by the 
Company
Assuming there is only one Blake
*/
select ename,hire_date from employee where hire_date>(select hire_date from employee where ename="Blake");

/* Question 38
Query to display Name and Hire Dates of all Employees along with their Manager’s Name and Hire 
Date for all the employees who were hired before their managers
*/
select A.ename,A.hire_date,B.ename,B.hire_date from employee A, employee B where A.hire_date<B.hire_date and a.manager=b.eno;

/*Question 39
Query to display Name and Salaries represented by Asteristisks – “Each asterisks (*) signifying $100.
*/
select ename,repeat("*",salary/100) from employee;

/* Question 40
Query to display the Highest, Lowest, Sum and Average Salaries of all the employees
*/
select max(salary) Highest, min(salary) Lowest , sum(Salary) Sum , avg(salary) Average from employee;

/* Question 41
 Query to display Highest, Lowest, Sum and Average Salary for each unique Job Type
 */
 select job_type,max(salary) Highest, min(salary) Lowest , sum(Salary) Sum , avg(salary) Average from employee group by job_type;

/* Question 42
Query to display the number of employees performing the same Job type functions
*/

select count(*),job_type from employee group by job_type;

/* Question 43
Query to display the no. of managers without listing their names.
*/
select count(distinct manager) from employee;

/* Question 44
Query to display the Difference between the Highest and Lowest Salaries for each department
*/
select max(salary)-min(salary) from employee group by dno;

/* Question 45

Query to display the Manager’s No. & the Salary of the Lowest paid employee for that respective 
manager. Exclude anyone where the Manager ID is not known. Exclude any groups where the minimum 
salary is less than $1000. 
*/
select manager,min(salary) from employee group by manager having manager is not null and min(salary)>1000;


/* Question 46
Query to display the Department Name, Location Name, No. of Employees & the average salary for 
all employees in that department. 
*/
 select D.dno,location,count(eno),avg(salary) from employee E , department D where E.dno=D.dno group by D.dno;
 
 /* Question 47
 Query to display Name and Hire Date for all employees who work in the same dept. as Blake.
 */
 select ename, hire_date from employee where dno=(select dno from employee where ename="Blake");
 
 /* Question 48
 Query to display the Employee No. & Name for all employees who earn more than the average 
salary in their respective department
*/
select A.eno,A.ename,A.salary,B.salary from employee A, (select avg(salary) Salary,dno from employee group by dno ) B where A.salary>B.salary and a.dno=b.dno; 

/* Question 49
Query to display Employee Number & Name for all employees who work in a department with any 
employee whose name contains a ‘T’.
*/
select eno,ename from employee where dno in (select dno from employee where ename like "%t%");

/* Question 50
 Query to display the employee name and salary of all employees who report to King.
 */
 select ename , salary from employee where manager=(select eno from employee where ename="King");
 
 /* Question 51
Query to display the Department No, Name & Job for top-5 employees (as per salary earned) in the 
Sales Dept on descending order on name
*/
select dno ,ename,job_type,salary from employee where dno=(select dno from department where dname="Sales") order by salary desc LIMIT 5; 

/* Question 52
Select manager name getting salary greater than average salary of employees in his department.
*/
select distinct b.ename , b.salary , c.salary Avg_Salary  from employee A , employee B, (select avg(salary) salary,dno from employee group by dno ) C where a.manager=b.eno and b.dno=c.dno and b.salary>c.salary  ;


/* Question 53
Create a view to store following information:
Dname| Location |Average salary| Number of Employee|Date of joining of first employee
*/
create view Demp as
select Dname,Location,b.salary Average_Salary, b.count "Number of Employee",b.hire_date "Date of joining of first employee"
from (select avg(salary) salary,dno,min(hire_date) hire_date,count(*) count from employee group by dno) B,
Department D where b.dno=d.dno ;
