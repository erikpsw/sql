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

-- CREATE PROCEDURE ProcC
-- @_snum CHAR(4)
-- as
-- select AVG(sc.score) AS 平均成绩,COUNT(sc.secnum) AS 选修课程门数,SUM(1-score/60) AS 不及格课程门数
-- from sc
-- where sc.snum=@_snum

-- EXEC ProcC 's001'

-- CREATE TRIGGER TA ON sc
-- FOR INSERT,UPDATE
-- AS
-- BEGIN
--     IF((select snum from inserted) not in (select snum from student))
--     BEGIN
--         PRINT '违反完整性约束'
--         ROLLBACK
--     END
-- END

-- insert into sc (snum,secnum,score) VALUES ('s009',12601,99) 

-- CREATE TRIGGER TB ON student
-- FOR INSERT,UPDATE
-- AS
-- BEGIN
--     DECLARE @_age int
--     SELECT @_age = DATEDIFF(DAY, inserted.birthday, GETDATE()) FROM inserted
--     IF (14 > ANY (SELECT @_age) OR 35 < ANY (SELECT @_age))
--     BEGIN
--         PRINT '年龄越界'
--         ROLLBACK
--     END
--     ELSE
--         PRINT '数据录入成功'
-- END

-- UPDATE student SET birthday='1965-06-21' WHERE snum='s001'

-- INSERT into student (snum,birthday,telephone) VALUES ('s009','1965-06-21','030-222222221')

CREATE TRIGGER TC ON course
FOR INSERT,UPDATE
AS
BEGIN
    
IF EXISTS (
    SELECT textbook
    FROM inserted
    WHERE textbook IN ('%高等教育出版社', '%同济大学出版社', '%复旦大学出版社', '%清华大学出版社')
)
    BEGIN
        PRINT '年龄越界'
        ROLLBACK
    END
    ELSE
        PRINT '数据录入成功'
END
