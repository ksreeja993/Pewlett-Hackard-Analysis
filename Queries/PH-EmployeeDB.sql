-- SELECT * FROM employees;
CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE (dept_name)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender varchar not null,
    hire_date date not null,
    PRIMARY KEY (emp_no)

);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date date not null,
    to_date date not null,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no),
    primary key (emp_no, dept_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    from_date date not null,
    to_date date not null,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no),
    primary key (emp_no, dept_no)
)

CREATE TABLE salaries (
    emp_no INT not null,
    salary int not null,
    from_date date not null,
    to_date date not null,
    foreign key (emp_no) references employees (emp_no),
    primary key (emp_no, from_date)
);

CREATE TABLE titles (
    emp_no INT not null,
    title VARCHAR (50) not null,
    from_date date not null,
    to_date date not null,
    foreign key (emp_no) references employees (emp_no),
    primary key (emp_no, title, from_date)

);


-- CREATE VIEW retirement_titles AS 
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
-- filter on birthdate
WHERE (e.birth_date between ('1951-01-01') and ('1955-12-31'))
order by e.emp_no;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no,rt.to_date DESC;

SELECT count(ut.title),ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
order by count DESC;
