SELECT DISTINCT ON (ti.title) e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

DROP TABLE retirement_titles

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT *
FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT *
FROM unique_titles

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

DROP TABLE retiring_titles

SELECT *
FROM retiring_titles


SELECT e.emp_no,
     e.first_name,
	 e.last_name,
	 e.birth_date,
	 de.from_date,
	 de.to_date,
	 ti.title
FROM employees as e 
INNER JOIN dep_employees as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no;


SELECT DISTINCT ON (e.emp_no) e.emp_no,
     e.first_name,
	 e.last_name,
	 e.birth_date,
	 de.from_date,
	 de.to_date,
	 ti.title
INTO mentorship_eligibility
FROM employees as e 
INNER JOIN dep_employees as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE de.to_date = ('9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

DROP TABLE mentorship_eligibility

SELECT *
FROM mentorship_eligibility