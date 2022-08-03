-- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (______) _____,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- WHERE _______
-- ORDER BY _____, _____ DESC;
-- SELECT DISTINCT ON (employees.emp_no)employees.emp_no, employees.first_name, employees.lat_name, titles.title, titles.from_date, titles.to_date
-- INTO retirement_titles
-- -- FROM employees
-- INNER JOIN titles ON
-- titles.emp_no=employees.emp_no
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- ORDER BY emp_no;
SELECT * FROM employees;
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
FROM employees AS e
INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
;