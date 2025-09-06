create table employees(employee_id integer not null primary key, name varchar(15), job_name varchar(15), manager_id integer, hire_date date, salary decimal(10,2), department_id integer);
create table departments(department_id integer not null primary key, department_name varchar(15), department_location varchar(15));
create table trainings(training_id integer not null primary key, training_name varchar(30), training_type varchar(20));
create table employee_trainings(employee_id integer references employees(employee_id), training_id integer references trainings(training_id), completion_date date, primary key(employee_id, training_id));

insert into departments(department_id, department_name, department_location) values (1001, 'Development', 'Floor 1');
insert into departments(department_id, department_name, department_location) values (1002, 'Administration', 'Floor 2');
insert into departments(department_id, department_name, department_location) values (1003, 'Support', 'Floor 1');

insert into trainings(training_id, training_name, training_type) values (1, 'Leadership Skills', 'Management');
insert into trainings(training_id, training_name, training_type) values (2, 'Advanced Programming', 'Technical');
insert into trainings(training_id, training_name, training_type) values (3, 'Customer Service', 'Soft Skills');
insert into trainings(training_id, training_name, training_type) values (4, 'Project Management', 'Management');
insert into trainings(training_id, training_name, training_type) values (5, 'Data Analysis', 'Technical');

insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (1, 'John Doe', 'Manager', null, '2021-01-01', 50000, 1001);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (2, 'Jane Smith', 'Developer', 1, '2021-02-01', 40000, 1001);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (3, 'Jim Beam', 'Developer', 2, '2021-03-01', 40000, 1001);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (4, 'Jill Johnson', 'Developer', 2, '2021-04-01', 40000, 1001);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (5, 'Jack Johnson', 'Developer', 2, '2021-05-01', 40000, 1001);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (6, 'Jill Johnson', 'Developer', 2, '2021-06-01', 40000, 1001);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (7, 'Sarah Wilson', 'Admin', 1, '2021-07-01', 45000, 1002);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (8, 'Mike Brown', 'Admin Asst', 7, '2021-08-01', 38000, 1002);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (9, 'Lisa Davis', 'HR Admin', 7, '2021-09-01', 42000, 1002);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (10, 'Tom Wilson', 'IT Admin', 7, '2021-10-01', 43000, 1002);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (11, 'Emma Clark', 'Office Admin', 7, '2021-11-01', 39000, 1002);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (12, 'David Lee', 'Admin Coord', 7, '2021-12-01', 40000, 1002);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (13, 'Robert Chen', 'Support Mgr', 1, '2022-01-01', 48000, 1003);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (14, 'Maria Garcia', 'Support Spec', 13, '2022-02-01', 41000, 1003);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (15, 'James Wilson', 'Support Spec', 13, '2022-03-01', 41000, 1003);
insert into employees(employee_id, name, job_name, manager_id, hire_date, salary, department_id) values (16, 'Sophie Martin', 'Support Spec', 13, '2022-04-01', 41000, 1003);

-- Assign one training per employee based on their role
insert into employee_trainings(employee_id, training_id, completion_date) values (1, 1, '2022-01-15');  -- John Doe - Leadership
insert into employee_trainings(employee_id, training_id, completion_date) values (2, 2, '2022-02-15');  -- Jane Smith - Advanced Programming
insert into employee_trainings(employee_id, training_id, completion_date) values (2, 1, '2022-04-15');
insert into employee_trainings(employee_id, training_id, completion_date) values (3, 2, '2022-03-15');  -- Jim Beam - Advanced Programming
insert into employee_trainings(employee_id, training_id, completion_date) values (4, 2, '2022-04-15');  -- Jill Johnson - Advanced Programming
insert into employee_trainings(employee_id, training_id, completion_date) values (5, 2, '2022-05-15');  -- Jack Johnson - Advanced Programming
insert into employee_trainings(employee_id, training_id, completion_date) values (6, 2, '2022-06-15');  -- Jill Johnson - Advanced Programming
insert into employee_trainings(employee_id, training_id, completion_date) values (7, 4, '2022-07-15');  -- Sarah Wilson - Project Management
insert into employee_trainings(employee_id, training_id, completion_date) values (8, 3, '2022-08-15');  -- Mike Brown - Customer Service
insert into employee_trainings(employee_id, training_id, completion_date) values (9, 3, '2022-09-15');  -- Lisa Davis - Customer Service
insert into employee_trainings(employee_id, training_id, completion_date) values (10, 5, '2022-10-15');  -- Tom Wilson - Data Analysis
insert into employee_trainings(employee_id, training_id, completion_date) values (11, 3, '2022-11-15');  -- Emma Clark - Customer Service
insert into employee_trainings(employee_id, training_id, completion_date) values (11, 2, '2022-11-15');  -- Emma Clark - Customer Service
insert into employee_trainings(employee_id, training_id, completion_date) values (12, 3, '2022-12-15');  -- David Lee - Customer Service
insert into employee_trainings(employee_id, training_id, completion_date) values (13, 5, '2023-01-15');  -- Robert Chen - Leadership
insert into employee_trainings(employee_id, training_id, completion_date) values (14, 3, '2023-02-15');  -- Maria Garcia - Customer Service
insert into employee_trainings(employee_id, training_id, completion_date) values (15, 3, '2023-03-15');  -- James Wilson - Customer Service
insert into employee_trainings(employee_id, training_id, completion_date) values (16, 3, '2023-04-15');  -- Sophie Martin - Customer Service 