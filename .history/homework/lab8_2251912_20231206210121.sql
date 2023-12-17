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

-- CREATE PROCEDURE ProcB
-- @_year VARCHAR(4)
-- as
-- SELECT * FROM student WHERE YEAR(birthday)=@_year

-- EXEC ProcB '1994'

select AVG(sc.score) AS 平均成绩,
from sc,sections,student
where sc.secnum=sections.secnum and sc.snum=student.snum and student.snum='s001'