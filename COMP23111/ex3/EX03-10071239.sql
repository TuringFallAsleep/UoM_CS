start /opt/info/courses/COMP23111/create-University-tables.sql;
start /opt/info/courses/COMP23111/populate-University-tables.sql;
start /opt/info/courses/COMP23111/create-Accident-tables.sql
start /opt/info/courses/COMP23111/populate-Accident-tables.sql
SET ECHO ON
SPOOL university
/* Task1 (a i.) */
 select distinct name 
 from student 
 where id in (select id from takes
 	where course_id like '%CS%');

/* Task1 (a ii.) */
select id,name from student where id not in (select id from takes where year<2009);

/* Task1 (a iii.) */
select dept_name, max(salary) as max_salary from instructor
group by dept_name;

/* Task1 (a iv.) */
select min(max_salary) from (
select dept_name as max_dept, max(salary) as max_salary from instructor
group by dept_name);


/* Task1 (b i.) */
insert into course values ('CS-001', 'Weekly Seminar', 'Comp. Sci.', '10');

/* Task1 (b ii.) */
-- insert into course values ('CS-002', 'Monthly Seminar', 'Comp. Sci.', '0');
/* Task1 (b iii.) */
-- The error is based on the declaration of create table course() which requires the credit is larger than 0

/* Task1 (b iv.) */
insert into section values ('CS-001', '1', 'Fall', '2009', 'Painter', '514', 'C');
/* Task1 (b v.) */
-- The columns assumed regarding missing are: building is Painter, room_number is 514, time_slot_id is C.

/* Task1 (b vi.) */
insert into takes select distinct id ,'CS-001', '1', 'Fall', '2009', 'C'
	from student where dept_name = 'Comp. Sci.';

/* Task1 (b vii.) */
delete from takes where id = (select id from student where name like '%Zhang%')
 and course_id = (select course_id from section where course_id = 'CS-001');

/* Task1 (b viii.) */
delete from takes where 
course_id = (select course_id from course where upper(title) like upper('%database%'));

/* Task1 (b ix.) */
delete from course where course_id = 'CS-001';

SPOOL OFF
/* Task1 (b x.) */
-- In order to ensure the previous statement to run without error,
-- First, we should understand what kind of values we could insert, which is based on the declaration of the entity;
-- Second, we should match the number of values we are going to insert with the declaration requires.


/* Task2 */
SET ECHO ON
SPOOL accident 

/* Task2 (a i.) */
select count(report_number) from participated where driver_id = 
(select driver_id from person where name = 'Jane Rowling');

/* Task2 (a ii.) */
update participated set damage_amount = 2500
where license = 'KUY 629' and report_number = 7897423;

/* Task2 (a iii.) */
select name from person where driver_id in
    (select driver_id from
    (select driver_id, sum(damage_amount) from participated
    group by driver_id
    having sum(damage_amount)>3000));

/* Task2 (a iv.) */
create or replace view average_damage_per_location as
    select distinct accident.location, avg(participated.damage_amount) as avg_location_damage
    from accident, participated
    where accident.report_number = participated.report_number
    group by accident.location;

/* Task2 (a v.) */
select location as higest_dam_location from average_damage_per_location where avg_location_damage = 
(select max(avg_location_damage) from average_damage_per_location);

start /opt/info/courses/COMP23111/drop-University-tables.sql;
 start /opt/info/courses/COMP23111/drop-Accident-tables.sql;
SPOOL OFF
