
create database cyclesheet;
use cyclesheet;


create table employee(
    first_name varchar(15),
    mid_name char(2),
    last_name varchar(15),
    ssn char(9),
    dob date,
    address varchar(50),
    sex char(1),
    salary int,
    sup_ssn char(9),
    dept_no int
);

 

create table department(
    dept_name varchar(15),
    dept_no int,
    manager_ssn char(9),
    manager_start_date date
);

 

create table project(
    project_name varchar(15),
    project_no int,
    project_location varchar(15),
    dept_no int
);

 

describe employee;
describe department;
describe project;
INSERT INTO Project (project_name,project_no ,project_location,dept_no)
VALUES
('ProjectA', 3388, 'Houston', 1),
('ProjectB', 1945, 'Salt Lake City', 3),
('ProjectC', 6688, 'Houston', 5),
('ProjectD', 2423, 'Bellaire', 4),
('ProjectE', 7745, 'Sugarland', 5),
('ProjectF', 1566, 'Salt Lake City', 3),
('ProjectG', 1234, 'New York', 2),
('ProjectH', 3467, 'Stafford', 4),
('ProjectI', 4345, 'Chicago', 1),
('ProjectJ', 2212, 'San Francisco', 2);

 

select * from project;

 

insert into employee(first_name ,mid_name ,last_name ,ssn ,dob,address,sex ,salary ,sup_ssn ,dept_no )
VALUES
('Doug', 'E', 'Gilbert', '554433221', '1960-06-09', '11 S 59 E, Salt Lake City, UT', 'M', 80000, NULL, 3),
('Joyce',NULL ,'PAN', '543216789', '1978-02-07', '35 S 18 E, Salt Lake City, UT', 'F', 70000, NULL, 2),
('Frankin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000, '554433221', 5),
('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '554433221', 4),
('John', 'B', 'Smith', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', '975 Fire Oak, Humble, TX', 'M' ,38000 ,333445555 ,5),
('Joyce' ,'A' ,'English' ,'453453453' ,'1962-07-31' ,'5631 Rice,Houston,TX' ,'F' ,25000 ,333445555 ,5),
('James' ,'E' ,'Borg' ,'888665555' ,'1927-11-10' ,'450 Stone,Houston,TX' ,'M' ,55000 ,543216789 ,1),
('Alicia' ,'J' ,'Zelaya' ,'999887777' ,'1958-07-19' ,'3321 Castle,Spring,TX' ,'F' ,25000 ,987654321 ,4),
('Ahmad' ,'V' ,'Jabbar' ,'987987987' ,'1959-03-29' ,'980 Dallas,Houston,TX','M','25000','987654321','4');

 

select * from employee;

 

insert into department (dept_name ,dept_no,manager_ssn,manager_start_date)
VALUES
('Manufacture', 1, '888665555', '1971-06-19'),
('Administration', 2, '543216789', '1999-01-04'),
('Headquarter', 3, '554433221', '1955-09-22'),
('Finance', 4, '987654321', '1985-01-01'),
('Research', 5, '333445555', '1978-05-22');

 

 

select * from department;

 

 


alter table employee
add constraint pk_emp primary key(ssn);

 

alter table employee
modify first_name varchar(15) not null;

 

alter table employee
modify last_name varchar(15) not null;

 

alter table employee
add constraint employee_check_gender check(sex='M' or sex='m' or sex='F' or sex='f');

 

alter table employee
add constraint employee_fk_department
foreign key (dept_no) references department(dept_no)
on delete cascade;

 

alter table department
add constraint department_pk
primary key (dept_no);

 

alter table department
modify dept_name varchar(15) not null;

 

alter table department
add constraint department_fk_employeessn
foreign key (manager_ssn) references employee(ssn)
on delete set null;

 

alter table project
modify project_name varchar(15) not null;

 

alter table project
add constraint project_pk
primary key(project_no);

 

alter table project
add constraint project_department_fk_dnum
foreign key (dept_no) references department(dept_no)
on delete set null;

 

create table dept_locations(
    dept_no int ,
    dept_location varchar(15) not null,
    constraint dept_locations_department_fk foreign key(dept_no) references department(dept_no)

);

 

create table works_on(
    emp_ssn char(9),
    project_no int,
    hours decimal(3,1),
    constraint works_on_fk_ssn foreign key(emp_ssn) references employee (ssn) on delete cascade,
    constraint works_on_proj_ssn foreign key(project_no) references project(project_no) on delete cascade
);

 

alter table works_on
add constraint works_on_pk primary key (emp_ssn,project_no)
;

 

create table dependent(
    emp_ssn char(9),
    dependent_name varchar(15),
    sex char(1) check(sex='m' or sex='M' or sex='f' or sex='F'),
    birthday date,

    relationship varchar(15),

    constraint dependent_pk primary key (emp_ssn,dependent_name),

    constraint dependent_fk_emp_ssn foreign key(emp_ssn) references employee(ssn)

    on delete cascade

);

 

describe dept_locations;

describe dependent;

describe works_on;

 

INSERT INTO dept_locations (dept_no, dept_location)

VALUES
(1, 'Houston'),
(1, 'Chicago'),
(2, 'New York'),
(2, 'San Francisco'),
(3, 'Salt Lake City'),
(4, 'Stafford'),
(4, 'Bellaire'),
(5, 'Sugarland'),

(5, 'Houston');

 

select * from dept_locations;

select * from works_on;

select * from dependent;

 

 

INSERT INTO works_on (emp_ssn, project_no, hours)

VALUES

('123456789', 3388, 32.5),

('123456789', 1945, 7.5),

('666884444', 3388, 40.0),

('453453453', 77, 20.0),

('453453453', 22, 20.0),

('333445555', 77, 10.0),

('333445555', 6688, 10.0),

('333445555', 43, 35.0),

('333445555', 22, 28.5),

('999887777', 1, 11.5),

('999887777', 12, 13.0),

('543216789', 22, 17.0),

('554433221', 1945, 21.5);

 

INSERT INTO dependent (emp_ssn, dependent_name, sex, birthday, relationship)

VALUES

('333445555', 'Alice', 'F', '1976-04-05', 'Daughter'),

('333445555', 'Theodore', 'M', '1973-10-25', 'Son'),

('333445555', 'Joy', 'F', '1948-05-03', 'Spouse'),

('987654321', 'Abner', 'M', '1932-02-29', 'Spouse'),

('123456789', 'Alice', 'F', '1978-12-31', 'Daughter'),

('123456789', 'Elizabeth', 'F', '1957-05-05', 'Spouse');

 

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('123456789', 3388, 32.5);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('123456789', 1945, 7.5);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('666884444', 3388, 40.0);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('453453453', 77, 20.0);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('453453453', 22, 20.0);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('333445555', 77, 10.0);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('333445555', 6688, 10.0);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('333445555', 43, 35.0);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('333445555', 22, 28.5);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('999887777', 1, 11.5);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('999887777', 12, 13.0);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('543216789', 22, 17.0);

INSERT INTO Works_On (emp_ssn, project_no, hours) VALUES ('554433221', 1945, 21.5);

 

select * from employee;

select * from project;

select * from works_on;

 

insert into employee

values('Robert','F','Scott','943775543','1942-06-21','2365 Newcastle Rd, Bellaire, TX','M',58000,'888665555',1);

 

-- constraint violation


insert into works_on

values('677678989',null,'40.0');

 

-- cyclesheet 3

 

select * from works_on;

delete from works_on where emp_ssn='333445555';

 

-- selec

 

describe employee;

select first_name,mid_name,last_name from employee where salary>=25000;

select first_name,mid_name,last_name from employee where salary>=30000 and salary<=70000;

select first_name,mid_name,last_name from employee where salary>=70000;

 

select * from employee;

 

select first_name,mid_name,last_name from employee where sup_ssn is null;

 

-- change date format -> for reference ,visit dev.mysql.com

-- function used date_format()

 

select first_name, mid_name, last_name , date_format(dob,'%D %M %Y') 

from employee;

 

select first_name, mid_name, last_name , date_format(dob,'%D %M %Y') 

from employee

where year(dob)<='1978';

 

select * from employee

where address regexp 'Salt Lake';

 

select * from department 

where dept_name regexp '^M';

 

select * from department 

where dept_name regexp '^E';

 

select * from employee 

where sup_ssn="554433221" or sup_ssn='333445555';

 

select upper(dept_name) from department;

select lower(dept_name) from department;

 

select ltrim(dept_name) from department;

select rtrim(dept_name) from department;

 

select left(dept_name,4) from department;

select right(dept_name,4) from department;

 

select substring(address,5,11) from employee;

 

-- q13

 

select * from employee;

select dept_name, adddate(manager_start_date, interval 6 month) as "Manager start date" from department;

-- cyclesheet 4

describe employee;

 

 

-- q1 Note: distinct returns no of distinct values in a record and count counts it

select count(distinct dept_no) as departments from employee;

 

 

-- q2

 

-- q3

 

-- q4

 