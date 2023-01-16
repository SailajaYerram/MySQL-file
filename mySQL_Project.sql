CREATE Database Leisure_Centre;

Use Leisure_Centre;

Create table Course(courseID int NOT NULL PRIMARY KEY, level varchar(30), sessions varchar(30),  

instructorName varchar(30), startDate date, lessontime time);

show tables;

CREATE table Members(memberID int NOT NULL PRIMARY KEY, firstName varchar(30), surname varchar(30),  
DOB date, address varchar(50), city varchar(20)); 

Create table Lessons(lessonID int PRIMARY KEY, courseID int, memberID Int);

drop table Members;
Insert INTO Course(courseID, level, sessions, instructorName, startDate, lessontime) values 
(1, "level3", "swimming", "Andy Dan", '2023-01-16', '11:30:00'), (2, "level4", "swimming", "Danny", '2023-01-16', '13:00:00'), 
(3, "level5", "gymnastics", "Clair Fox", '2023-01-18', '16:00:00'), (4, "level2", "Gymnastics", "MaX", '2023-01-18','15:30:00');
drop table Course;
Insert into Members(memberID, firstName, surname, DOB, address, city) values
(2001, "Sophia", "Dan", '2009-05-14', "4 WickenbyDrive","Manchester"), (2002, "Mark", "Donald", '2010-06-12', "2 BrooklandsRoad","Brooklands"),
(2003, "Danny", "Angle", '2016-12-15', "4 CromerRoad", "SaleMoor"), (2004, "Jenny", "Thomas", '2014-11-10', "5 Cumberland","Timperly") ;
drop table Lessons;
Insert INTO Lessons(lessonID, courseID, memberID) values 
(3001,1,2001),(3002,2,2002), (3003,3,2003), (3004,4,2004);

 ALTER TABLE Lessons
  ADD FOREIGN KEY (courseID) REFERENCES Course (courseID),
  ADD FOREIGN KEY (memberID) REFERENCES Members (memberID);
  
  -- A.1.Where courseID is equals to a number below 5 and the first name of any of the instructors---  
    select * from Course where (courseID<=5) AND (instructorName="Andy Dan");
  -- A.2.Where courseID is equals to a number above 5 and the lesson time is in the morning or afternoon. ----
   select * from Course where (courseID>=5) AND (lessontime>'12:00:00'OR lessontime<'12:00:00');
   
   -- B.1.startDate in “course” table ----
   select * from Course ORDER BY startDate;
   -- B.2.MemberID in “members” table ----
   select * from Members ORDER BY memberID;
   
   -- c.1.Members table, change the addresses of any three members.UPDATE------
   UPDATE Members set address="2 BrooklandsRoad" where address="10 Broad Road";
     UPDATE Members set address= "5 cumberland" where address="15 Hope Road";
        UPDATE Members set address="4 CromerRoad" where address="12 Baxter Road";
    
   SET sql_safe_updates=0;
   
   -- c.2.Course table, change the startDate and lesson time for three of the sessions. -----
   UPDATE  Course set startDate='2023-01-16' where startDate='2023-02-18';
	UPDATE  Course set startDate='2023-01-18' where startDate='2023-02-25';
	UPDATE  Course set startDate='2023-01-18' where startDate='2023-02-20';
    
-- d.1. Of the LessonID column in the “lesson” table MIN(),MAX()---------
select MIN(lessonID),Max(lessonID) from Lessons;
-- d.2.Of the membersID column in the “members” table  ---------
select MIN(memberID),Max(memberID) from Members;

-- e.1.Count the total number of members in the “members” table  COUNT (), AVG () and SUM ()-----
select Count(memberID)  from Members;
-- e.2.Count the total number of sessions in the “course” table ---------
select Count(courseID) from Course;
-- e.3.Find the average session time for all sessions in the “course” table --------------
select AVG(lessontime), sessions from Course group by sessions;

-- f.1.Find all the people from the “members” table whose last name starts with A.--WILDCARD queries (like operator)  -----
select * from members where surname LIKE 'a%';
-- Find all the people from the “members” table whose last name ends with A. 
select * from members where surname LIKE '_%a';
-- Find all the people from the “members” table that have "ab" in any position in the last name. 
select * from members where surname LIKE '%ab%';
-- Find all the people from the “members” table that that have "b" in the second position in their first name. 
select * from members where firstName LIKE '_b%';
-- Find all the people from the “members” table whose last name starts with "a" and are at least 3 characters in length: 
select * from members where surname LIKE 'a%___';
-- Find all the people from the “members” table whose last name starts with "a" and ends with "y" 
select * from members where surname LIKE 'a%y';
-- Find all the people from the “members” table whose last name does not starts with "a" and ends with "y" 
select * from members where surname NOT LIKE 'a%' AND surname LIKE '%y';

-- What do you understand by LEFT and RIGHT join? Explain with an example.
-- LEFT JOIN: Return all records from the left table and the matched records from the right 

Select members.firstName , members.surname , members.memberid from 
members left Join lessons on 
members.memberID=lessons.memberID;
-- RIGHT JOIN: Return all the records from the right table and the matched records from the left table 
Select lessons.courseid , lessons.lessonid from 
members Right Join lessons on 
members.memberID=lessons.memberID;











