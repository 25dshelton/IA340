--q2.1
insert into student(s_email,s_name,major)
values ('sl@jmu.edu','s1','IA'),
		('s2@jmu.edu','s2','IA'),
		('s3@jmu.edu','s3','ISAT'),
		('s4@jmu.edu','s4','ISAT')
--q2.2
insert into professor(p_email,p_name,office)
values ('pl@jmu.edu','p1','o1'),
	   ('p2@jmu.edu','p2','o2')
--q2.3
insert into course(c_number,c_name,room,p_email)
values ('c1','postgresql','r1','pl@jmu.edu'),
	   ('c2','mongodb','r2','p2@jmu.edu'),
	   ('c3','twitter','r1','pl@jmu.edu')
--q2.4
insert into enroll(s_email,c_number)
values ('s1@jmu.edu','c1'),
	   ('s2@jmu.edu','c1'),
	   ('s3@jmu.edu','c1'),
	   ('s4@jmu.edu','c2'),
	   ('s2@jmu.edu','c3'),
	   ('s3@jmu.edu','c3')
--q2.5
insert into professor(p_email,p_name,office)
values ('p3@jmu.edu','p3','o3') ;

insert into course(c_number,c_name,room,p_email)
values ('c4','facebook','r1','p3@jmu.edu')
--have to change professor table first because you're adding a new email (person) assigned to a course

--q2.6
update course
set p_email = 'p3@jmu.edu'
where p_email = 'p1@jmu.edu' ;

delete from professor
where p_email = 'p1@jmu.edu'
--you have to modify the course table first or else it won't work

--q2.7
select * from public.enroll

--q2.8
select c_number, count(*) as num_student
from enroll
group by c_number
order by num_student desc
limit 1;

--q2.9
select professor.p_name,
       course.c_name
from professor
inner join course
on professor.p_email = course.p_email

--q2.10
select p_name, count(*) as num_course
from course
join professor on course.p_email = professor.p_email
group by p_name
order by num_course desc
limit 1;
