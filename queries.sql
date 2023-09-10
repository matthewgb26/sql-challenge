--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT
    e.Emp_no AS EmployeeNumber,
    e.Last_name AS LastName,
    e.First_name AS FirstName,
    e.Sex AS Sex,
    s.Salary AS Salary
FROM
    employees AS e
INNER JOIN
    salaries AS s ON e.Emp_no = s.Emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

SELECT
    First_name AS FirstName,
    Last_name AS LastName,
    Hire_date AS HireDate
FROM
    employees
WHERE
    EXTRACT(YEAR FROM Hire_date) = 1986;

--List the manager of each department along with their department number,
--department name, employee number, last name, and first name (2 points)
SELECT
    dm.Dept_no AS DepartmentNumber,
    d.Dept_name AS DepartmentName,
    dm.Emp_no AS ManagerEmployeeNumber,
    e.Last_name AS ManagerLastName,
    e.First_name AS ManagerFirstName
FROM
    dept_manager AS dm
INNER JOIN
    departments AS d ON dm.Dept_no = d.Dept_no
INNER JOIN
    employees AS e ON dm.Emp_no = e.Emp_no;

--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name (2 points)
SELECT
    de.Dept_no AS DepartmentNumber,
    e.Emp_no AS EmployeeNumber,
    e.Last_name AS LastName,
    e.First_name AS FirstName,
    d.Dept_name AS DepartmentName
FROM
    dept_emp AS de
INNER JOIN
    employees AS e ON de.Emp_no = e.Emp_no
INNER JOIN
    departments AS d ON de.Dept_no = d.Dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name
--begins with the letter B (2 points)
SELECT
    First_name AS FirstName,
    Last_name AS LastName,
    Sex
FROM
    employees
WHERE
    First_name = 'Hercules' AND Last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT
    e.Emp_no AS EmployeeNumber,
    e.Last_name AS LastName,
    e.First_name AS FirstName
FROM
    employees AS e
INNER JOIN
    dept_emp AS de ON e.Emp_no = de.Emp_no
INNER JOIN
    departments AS d ON de.Dept_no = d.Dept_no
WHERE
    d.Dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name (4 points)
SELECT
    e.Emp_no AS EmployeeNumber,
    e.Last_name AS LastName,
    e.First_name AS FirstName,
    d.Dept_name AS DepartmentName
FROM
    employees AS e
INNER JOIN
    dept_emp AS de ON e.Emp_no = de.Emp_no
INNER JOIN
    departments AS d ON de.Dept_no = d.Dept_no
WHERE
    d.Dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name) (4 points)
SELECT
    Last_name AS LastName,
    COUNT(*) AS Frequency
FROM
    employees
GROUP BY
    Last_name
ORDER BY
    Frequency DESC, LastName;

