CREATE TABLE employees (
    FirstName VARCHAR(15),
    MidName CHAR(2),
    LastName VARCHAR(15),
    SSNNumber CHAR(9),
    Birthday DATE,
    Address VARCHAR(50),
    Sex CHAR(1),
    Salary NUMBER (7),
    SupervisorSSN CHAR(9),
    DepartmentNumber NUMBER (5)
);
INSERT INTO employees (FirstName, MidName, LastName, SSNNumber, Birthday, Address, Sex, Salary, SupervisorSSN, DepartmentNumber)
VALUES
('Doug', 'E', 'Gilbert', '554433221', '1960-06-09', '11 S 59 E, Salt Lake City, UT', 'M', 80000, NULL, 3),
('Joyce', 'PAN', NULL, '543216789', '1978-02-07', '35 S 18 E, Salt Lake City, UT', 'F', 70000, NULL, 2),
('Frankin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000, '554433221', 5),
('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '554433221', 4),
('John', 'B', 'Smith', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', '975 Fire Oak, Humble, TX', 'M' ,38000 ,333445555 ,5),
('Joyce' ,'A' ,'English' ,'453453453' ,'1962-07-31' ,'5631 Rice,Houston,TX' ,'F' ,25000 ,333445555 ,5),
('James' ,'E' ,'Borg' ,'888665555' ,'1927-11-10' ,'450 Stone,Houston,TX' ,'M' ,55000 ,543216789 ,1),
('Alicia' ,'J' ,'Zelaya' ,'999887777' ,'1958-07-19' ,'3321 Castle,Spring,TX' ,'F' ,25000 ,987654321 ,4),
('Ahmad' ,'V' ,'Jabbar' ,'987987987' ,'1959-03-29' ,'980 Dallas,Houston,TX','M','25000','987654321','4');

CREATE TABLE Project (
    ProjectName VARCHAR(15),
    ProjectNumber NUMBER(5),
    ProjectLocation VARCHAR(15),
    DepartmentNumber NUMBER(5)
);

INSERT INTO Project (ProjectName, ProjectNumber, ProjectLocation, DepartmentNumber)
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

