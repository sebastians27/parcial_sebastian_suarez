--------------------------------------------------------
-- Archivo creado  - viernes-octubre-13-2017   
--------------------------------------------------------
DROP TABLE "ANSWERS" cascade constraints;
DROP TABLE "ATTENDANCE" cascade constraints;
DROP TABLE "COURSES" cascade constraints;
DROP TABLE "STUDENTS" cascade constraints;
DROP SEQUENCE "ANSWER_SEQUENCE";
--------------------------------------------------------
--  DDL for Table ANSWERS
--------------------------------------------------------

  CREATE TABLE "ANSWERS" 
   (	"ID" NUMBER(*,0), 
	"NUMBER_OF_QUESTION" VARCHAR2(255), 
	"ANSWER" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table ATTENDANCE
--------------------------------------------------------

  CREATE TABLE "ATTENDANCE" 
   (	"ID" NUMBER(*,0), 
	"STUDENT_ID" NUMBER(*,0), 
	"COURSE_ID" NUMBER(*,0), 
	"ATTENDANCE_DATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table COURSES
--------------------------------------------------------

  CREATE TABLE "COURSES" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"CODE" VARCHAR2(255), 
	"DATE_START" DATE, 
	"DATE_END" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table STUDENTS
--------------------------------------------------------

  CREATE TABLE "STUDENTS" 
   (	"ID" NUMBER(*,0), 
	"FIRST_NAME" VARCHAR2(255), 
	"LAST_NAME" VARCHAR2(255), 
	"DATE_OF_BIRTH" DATE, 
	"CITY" VARCHAR2(255), 
	"ADDRESS" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Sequence ANSWER_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "ANSWER_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 2 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into ANSWERS
SET DEFINE OFF;
Insert into ANSWERS (ID,NUMBER_OF_QUESTION,ANSWER) values ('100','Question 1','57');
Insert into ANSWERS (ID,NUMBER_OF_QUESTION,ANSWER) values ('102','Question 2','Computer Science');
Insert into ANSWERS (ID,NUMBER_OF_QUESTION,ANSWER) values ('104','Question 3','15/05/2017');
Insert into ANSWERS (ID,NUMBER_OF_QUESTION,ANSWER) values ('106','Question 4','History');
Insert into ANSWERS (ID,NUMBER_OF_QUESTION,ANSWER) values ('108','Question 5','Meetkerke');
REM INSERTING into ATTENDANCE
SET DEFINE OFF;
REM INSERTING into COURSES
SET DEFINE OFF;
REM INSERTING into STUDENTS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_ANSWERS_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ANSWERS_ID" ON "ANSWERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ATTENDANCE_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ATTENDANCE_ID" ON "ATTENDANCE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ID" ON "COURSES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STUDENTS_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STUDENTS_ID" ON "STUDENTS" ("ID") 
  ;
--------------------------------------------------------
--  Constraints for Table ANSWERS
--------------------------------------------------------

  ALTER TABLE "ANSWERS" ADD CONSTRAINT "PK_ANSWERS_ID" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "ANSWERS" ADD CONSTRAINT "NUMBER_QUESTION_CHECK" CHECK (number_of_question IN ('Question 1', 'Question 2', 'Question 3', 'Question 4', 'Question 5')) ENABLE;
--------------------------------------------------------
--  Constraints for Table ATTENDANCE
--------------------------------------------------------

  ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "PK_ATTENDANCE_ID" PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table COURSES
--------------------------------------------------------

  ALTER TABLE "COURSES" ADD CONSTRAINT "PK_ID" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "COURSES" ADD CONSTRAINT "NAME_CHECK" CHECK (name IN ('Business and Computing', 'Computer Science', 'Chemistry', 'History', 'Zoology')) ENABLE;
--------------------------------------------------------
--  Constraints for Table STUDENTS
--------------------------------------------------------

  ALTER TABLE "STUDENTS" ADD CONSTRAINT "PK_STUDENTS_ID" PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ATTENDANCE
--------------------------------------------------------

  ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "FK_COURSE_ID" FOREIGN KEY ("COURSE_ID")
	  REFERENCES "COURSES" ("ID") ENABLE;
  ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "FK_STUDENT_ID" FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "STUDENTS" ("ID") ENABLE;
