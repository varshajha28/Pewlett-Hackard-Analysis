-- Number of Titles retiring.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	s.salary
INTO retiree_titles
FROM employees as e
INNER JOIN titles as t ON (e.emp_no = t.emp_no)
INNER JOIN salaries as s ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');
	 
-- Most Recent Title and retiree employee count for those titles
SELECT x.title, count(*) as employee_count
INTO retiree_titles_count
FROM
(SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	s.salary
FROM employees as e
INNER JOIN titles as t ON (e.emp_no = t.emp_no)
INNER JOIN salaries as s ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01')
	 AND (t.to_date = '9999-01-01')) as x 
GROUP BY 1
ORDER BY 2 DESC;
	 
-- Mentor Ready List.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	de.from_date,
	de.to_date
INTO mentor_info
FROM employees as e
INNER JOIN titles as t ON (e.emp_no = t.emp_no)
INNER JOIN dept_emp as de ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	 AND (de.to_date = '9999-01-01')
	 AND (t.to_date = '9999-01-01');
