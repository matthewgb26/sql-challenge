CREATE TABLE title(
title_id varchar NOT NULL PRIMARY KEY,
	title varchar(32)
);

CREATE TABLE employees(
Emp_no int NOT NULL PRIMARY KEY,
	Emp_title_id varchar(32) NOT NULL,
	Birth_date date,
	First_name varchar(32),
	Last_name varchar(32),
	Sex varchar(1),
	Hire_date date Not null,
	FOREIGN KEY (Emp_title_id) REFERENCES title(title_id)
);

CREATE TABLE salaries(
Emp_no int NOT NULL PRIMARY KEY,
	Salary int,
	FOREIGN KEY (Emp_no) REFERENCES employees(Emp_no)
);

CREATE TABLE departments(
Dept_no varchar NOT NULL PRIMARY KEY,
	Dept_name varchar(32)
);

CREATE TABLE dept_manager(
	Dept_no varchar(6),
	Emp_no int,
	PRIMARY KEY (Dept_no, Emp_no),
	FOREIGN KEY (Dept_no) REFERENCES departments(Dept_no),
	FOREIGN KEY (Emp_no) REFERENCES employees(Emp_no)
);

CREATE TABLE dept_emp(
Emp_no int,
	Dept_no varchar(6),
	PRIMARY KEY (Emp_no, Dept_no),
	FOREIGN KEY (Emp_no) REFERENCES employees(Emp_no),
	FOREIGN KEY (Dept_no) REFERENCES departments(Dept_no)
);