-- create view 学生成绩
-- as 
-- select sc.snum,sections.cnum,course.cname,sc.score
-- from sc,sections,course
-- where sc.secnum=sections.secnum and sections.cnum=course.cnum

-- SELECT * FROM 学生成绩

-- CREATE PROCEDURE ProcA
-- as
-- SELECT * FROM student

-- EXEC ProcA

SELECT * FROM student WHERE birthday LIKE "[0-9][0-9][0-9][0-9]%"