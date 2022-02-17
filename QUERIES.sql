-------CREATE DATABASE-----------
create database demodb;
----------CREATE TABLES---------------
Departments
create TABLE Departments(dep_id int primary key AUTO_INCREMENT,
                       dep_name varchar(20),
                       dep_location varchar(15));
Employees
create TABLE Employees(emp_id int primary key AUTO_INCREMENT,
                       emp_name varchar(15),
                       job_name varchar(10),
                       manager_id int ,
                      hire_date date,
                      salary decimal(10,2),
                      commission decimal(7,2),
                      dep_id int REFERENCES departments(dep_id) on delete set null);

Salary_grade
create TABLE Salary_grade(grade int ,
                       min_salary int,
                       max_salary int
                       )


-----------------------INSERT DATA---------------------
departments
insert into Departments(dep_id,dep_name,dep_location) values (1001,'FINANCE','SYDNEY');
insert into Departments(dep_id,dep_name,dep_location) values (2001,'AUDIT','MELBOURNE');
insert into Departments(dep_id,dep_name,dep_location) values (3001,'MARKETING','PERTH');
insert into Departments(dep_id,dep_name,dep_location) values (4001,'PRODUCTION','BRISBANE');


Employees
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (68319,'KAYLING','PRESIDENT',null,'1991-11-18',6000,null,1001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (66928,'BLAZE','MANAGER',68319,'1991-05-01',2750,null,3001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (67832,'CLARE','MANAGER',68319,'1991-06-09',2550,null,1001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (65646,'JONAS','MANAGER',68319,'1991-04-02',2957,null,2001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (67858,'SCARLET','ANALYST',65646,'1997-04-19',3100,null,2001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (69062,'FRANK','ANALYST',65646,'1991-12-03',3100,null,2001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (63679,'SANDRINE','CLERK',69062,'1990-12-18',900,null,2001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (64989,'ADELYN','SALESMAN',66928,'1991-02-20',1700,400,3001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (65271,'WADE','SALESMAN',66928,'1991-02-22',1350,600,3001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350,1500,3001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600,0,3001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (68736,'ADNRES','CLERK',67858,'1997-05-23',1200,null,2001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (69000,'JULIUS','CLERK',66928,'1991-12-03',1050,null,3001);
insert into Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (69324,'MARKER','CLERK',67832,'1992-01-23',1400,null,1001);

Salary_grade
insert into Salary_grade values (1,800,1300), (2 ,1301,1500),(3,1501,2100), (4,2101,3100), ( 5,3101,9999);







--------------------SOLUTIONS-----------------------
1. From the above table return complete information about the employees.

SELECT * FROM Employees;

2.From the table, write a SQL query to find the salaries of all employees. Return salary.

SELECT salary FROM  Employees;

3. From the table, write a SQL query to find the unique designations of the employees. Return job name.

SELECT DISTINCT job_name FROM Employees;

4. From the following table, write a SQL query to list the employees’ names, increase their salary by 15%, and express the number of Dollars.

SELECT emp_name,salary as CURRENT_SALARY,concat('$',' ',format(salary+(salary*15/100),0)) as INCREMENTED_SALARY FROM Employees;

5. From the following table, write a SQL query to list the employee''s name and job name as a format of "Employee & Job".

select concat(emp_name,'   ',job_name) as "Employee & Job" FROM Employees;

6. From the following table, write a SQL query to find those employees with a hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.

select emp_id,emp_name,salary,hire_date,DATE_FORMAT(hire_date, "%M %d,%Y") as to_char FROM Employees;

7. From the following table, write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.

SELECT emp_name,length(trim(emp_name)) as length FROM employees;

8. From the following table, write a SQL query to find the employee ID, salary, and commission of all the employees.

SELECT emp_id,salary,COALESCE(commission,'',commission) from Employees;

9. From the following table, write a SQL query to find the unique department with jobs. Return department ID, Job name.

SELECT DISTINCT dep_id, job_name FROM employees;

10. From the following table, write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees. (Using NOT IN)

SELECT * from Employees where dep_id not in(2001);

11. From the following table, write a SQL query to find those employees who joined before 1991. Return complete information about the employees.

SELECT * FROM employees WHERE hire_date<('1991-01-01');

12. From the following table, write a SQL query to compute the average salary of those employees who work as ‘ANALYST’. Return average salary.

SELECT avg(salary) as avg FROM employees WHERE job_name='ANALYST';

13. From the following table, write a SQL query to find the details of the employee ‘BLAZE’.

SELECT * FROM employees WHERE emp_name='BLAZE';

14. From the following table, write a SQL query to find those employees whose salary exceeds 3000 after giving a 25% increment. Return complete information about the employees. 

SELECT emp_id, emp_name , job_name , manager_id , hire_date , salary ,round(salary+salary*25/100) "Revised Salary", commission , dep_id FROM Employees WHERE round(salary+salary*25/100)>3000;

15. From the following table, write a SQL query to find those employees who joined in the month January. Return complete information about the employees.

SELECT * FROM employees WHERE extract(month from hire_date)='01';

16. From the following table, write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary.

SELECT emp_id, emp_name , hire_date , salary FROM Employees WHERE hire_date<'1991-04-01';

17. From the following table, write a SQL query to find the name and salary of the employee FRANK. Salary should be equal to the maximum salary within his or her salary group.(Using Between)

SELECT e.emp_name, e.salary FROM employees e , salary_grade sg WHERE e.emp_name = 'FRANK'  AND e.salary BETWEEN sg.min_salary AND sg.max_salary
AND e.salary = sg.max_salary;

18. From the following table, write a SQL query to list all the employees except PRESIDENT and MANAGER in ascending order of salaries. Return complete information about the employees.  (Using Order By)

select * from employees where job_name not in('PRESIDENT','MANAGER') order by salary ASC;

19. From the following table, write a SQL query to find the highest salary. Return the highest salary.

select max(salary) from employees;

20. From the table, write a SQL query to find the average salary and average total remuneration (salary and commission) for each type of job. Return name, average salary and average total remuneration. (Using GROUP BY)

SELECT job_name, avg(salary), COALESCE(avg(salary+commission),'') FROM employees GROUP BY job_name;

21. From the following table, write a SQL query to find those employees who work in the department ID 1001 or 2001. Return employee ID, employee name, department ID, department location, and department name.(Using IN clause)

SELECT emp_id,emp_name,e.dep_id,d.dep_location,d.dep_name FROM employees e join Departments d on (e.dep_id=d.dep_id) WHERE e.dep_id in(1001,2001);

22. From the table, write a SQL query to list the managers and number of employees work under them. Sort the result set in ascending order on manager. Return manager ID and number of employees under them.(Using GROUP BY & ORDER BY)

SELECT e.manager_id,count(e.emp_id) FROM employees e join Employees m on (m.emp_id=e.manager_id) GROUP by m.emp_id ORDER by m.emp_id;

23. From the table, write a SQL query to find those departments where at least two employees work. Return department id, number of employees.

SELECT dep_id,count(emp_id) as count FROM employees GROUP by dep_id HAVING count(emp_id)>2;

24. From the table, write a SQL query to find those employees whose names contain the character set 'AR' together. Return complete information about the employees. (using ‘like’)

SELECT * FROM employees where emp_name like'%AR%';

25. Add a column for “Gender” in the employee table and update each row accordingly. 

alter TABLE employees add gender varchar(10);
update Employees set gender='MALE' where emp_name not in('SANDRINE','CLARE','SCARLET','KAYLING');
update Employees set gender='FEMALE' where emp_name in('SANDRINE','CLARE','SCARLET','KAYLING');














