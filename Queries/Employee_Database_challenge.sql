-- Retrieve data from the Employee & Title tables.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
t.to_date
--Create a Table to Export the QUERY
INTO retirement_titles 
FROM employees AS e 
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
-- Filter the Data for employees born between 1952 and 1955
WHERE(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- Order the data by the employee number 
ORDER BY e.emp_no;

-- Retrieve the distinct employee number, first and last name, and title columns from the Retirement Titles table.	
-- For the DISTINCT ON function use the employee number. 
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
--Create a Table to Export the QUERY
INTO unique_titles 
FROM retirement_titles AS rt
WHERE rt.to_date = '9999-01-01'
-- Sort the Unique Titles table in ascending order by the employee number and descending order by the last date of the most recent title
ORDER BY rt.emp_no, rt.to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.title),
	ut.title
--Create a Table to Export the QUERY
INTO retiring_titles
FROM unique_titles AS ut
-- Group the table by title.
GROUP BY ut.title
-- Sort the count column in descending order.
ORDER BY COUNT DESC;

-- Query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--Create a Table to Export the QUERY
INTO mentorship_eligibilty
FROM employees AS e
-- Join the Employees and the Department Employee tables on the primary key.
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
-- Join the Employees and the Titles tables on the primary key.
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
-- Filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
-- Filter the data on the to_date column to all the current employees.
	AND (de.to_date = '9999-01-01')
-- Sort the Employees table in ascending order by the employee number and descending order by the last date of the most recent title
ORDER BY e.emp_no, de.to_date DESC;













