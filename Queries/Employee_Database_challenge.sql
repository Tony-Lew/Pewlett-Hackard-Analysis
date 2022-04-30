-- Number of Retiring Employees by title
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retiree_title
FROM employees as e
INNER JOIN titles as t
on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retiree_title as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no , rt.title DESC;

--Get the employee count grouped by title
SELECT COUNT(rt.title), rt.title
INTO title_count
FROM retiree_title as rt
WHERE rt.to_date = ('9999-01-01')
GROUP BY rt.title
ORDER BY count DESC;
