-- write your queries to insert data here
INSERT INTO client(first_name, last_name, email) VALUES("Sara", "Smith", "smiths@hello.com");
INSERT INTO client(first_name, last_name, email) VALUES("Miguel", "Cabrera", "mc@hello.com");
INSERT INTO client(first_name, last_name, email) VALUES("Bo", "Chan'g", "bochang@hello.com");

INSERT INTO employee(first_name, last_name, start_date, email) VALUES("Ananya", "Jaiswal", "2008-4-10", "ajaiswal@hello.com");
INSERT INTO employee(first_name, last_name, start_date, email) VALUES("Michael", "Fern", "2015-7-19", "michaelf@hello.com");
INSERT INTO employee(first_name, last_name, start_date, email) VALUES("Abdul", "Rehman", "2018-2-27", "rehman@hello.com");

INSERT INTO project(cid, title, comments) VALUES((SELECT id from client where first_name = "Sara" and last_name = "Smith"),
"Diamond", "Should be done by Jan 2019");
INSERT INTO project(cid, title, comments) VALUES((SELECT id from client where first_name = "Bo" and last_name = "Chan'g"),
"Chan'g", "Ongoing maintenance");
INSERT INTO project(cid, title) VALUES((SELECT id from client where first_name = "Miguel" and last_name = "Cabrera"),
"The Robinson Project");

INSERT INTO works_on(eid, pid, due_date) VALUES((SELECT id from employee where first_name = "Ananya" and last_name = "Jaiswal"),
(SELECT id from project where title = "Chan'g"), "2020-11-19");
INSERT INTO works_on(eid, pid, due_date) VALUES((SELECT id from employee where first_name = "Michael" and last_name = "Fern"),
(SELECT id from project where title = "The Robinson Project"), "2020-12-05");
INSERT INTO works_on(eid, pid, due_date) VALUES((SELECT id from employee where first_name = "Abdul" and last_name = "Rehman"),
(SELECT id from project where title = "Diamond"), "2021-1-01");
-- Leave the queries below untouched. These are to test your submission correctly.
select * from project;
select * from client;
select * from employee;
select * from works_on;