create tablespace COURSES datafile
'C:\oraclexe\app\oracle\oradata\XE\courses1.dbf' size 50M,
'C:\oraclexe\app\oracle\oradata\XE\courses2.dbf' size 50M
autoextend on next 500k maxsize 400M
extent management local
segment space management auto
online;


create profile admin limit
idle_time 15
FAILED_LOGIN_ATTEMPTS 5
SESSIONS_PER_USER 2;

create user sebastians27
identified by admin
default tablespace COURSES
quota unlimited on COURSES
profile admin;

grant dba,create session,create table to  sebastians27;

create sequence answer_sequence start with 100 increment by 2;

create table courses (id int,name varchar2(255),code varchar2(255),date_start date, date_end date,
                     constraint pk_id primary key(id),
                     constraint name_check check (name IN ('Business and Computing', 'Computer Science', 'Chemistry', 'History', 'Zoology')));

create table students(id int,first_name varchar2(255),last_name varchar2(255),date_of_birth date,city varchar2(255),address varchar2(255),
                      constraint pk_students_id primary key(id));

create table attendance(id int, student_id int,course_id int,attendance_date date,
                        constraint pk_attendance_id primary key(id),
                        constraint fk_student_id foreign key(student_id)references students(ID),
                        constraint fk_course_id foreign key(course_id)references courses(ID));

create table answers (id int , number_of_question varchar2(255), answer varchar2(255),
                    constraint pk_answers_id primary key(id),
                    constraint number_question_check check (number_of_question IN ('Question 1', 'Question 2', 'Question 3', 'Question 4', 'Question 5')));
 
 
insert into answers VALUES(answer_sequence.NEXTVAL,'Question 1','57');
insert into answers VALUES(answer_sequence.NEXTVAL,'Question 2','Computer Science'); 
insert into answers VALUES(answer_sequence.NEXTVAL,'Question 3','15/05/2017');
insert into answers VALUES(answer_sequence.NEXTVAL,'Question 4','History'); 
insert into answers VALUES(answer_sequence.NEXTVAL,'Question 5','Meetkerke');