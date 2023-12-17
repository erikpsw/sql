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

-- ALTER TRIGGER TC ON course
-- FOR INSERT,UPDATE
-- AS
-- BEGIN
    
-- IF EXISTS (
--     SELECT *
--     FROM inserted
--     WHERE textbook NOT LIKE '%高等教育出版社'
--        AND textbook NOT LIKE '%同济大学出版社'
--        AND textbook NOT LIKE '%复旦大学出版社'
--        AND textbook NOT LIKE '%清华大学出版社'
   
-- )
--     BEGIN
--         PRINT '不是指定出版社，不能订购!'
--         ROLLBACK
--     END
-- ELSE
--     PRINT '订购成功!'
-- END

-- UPDATE course SET textbook='《VB.NET程序设计》,北京大学出版社' WHERE cnum='c135'

-- UPDATE course SET textbook='《VB.NET程序设计》,同济大学出版社' WHERE cnum='c135'


-- ALTER TRIGGER TD ON sc
-- FOR INSERT,UPDATE
-- AS
-- BEGIN
--     DECLARE @_snum CHAR(4),@_inserted_course CHAR(4),@cnum CHAR(4)
--     set @_snum=(select snum from inserted)
--     DECLARE @_course TABLE(cnum CHAR(4))
--     SELECT @_inserted_course=cnum FROM sections,inserted WHERE sections.secnum=inserted.secnum 
--     PRINT @_inserted_course
--     INSERT INTO @_course (cnum)
--     SELECT cnum FROM sections, sc WHERE sections.secnum = sc.secnum and sc.snum=@_snum
--     DECLARE course_cursor CURSOR FOR
--     SELECT cnum FROM @_course;

--     OPEN course_cursor;

--     FETCH NEXT FROM course_cursor INTO @cnum;

--     WHILE @@FETCH_STATUS = 0
--     BEGIN
--         PRINT ' - '+ @cnum;
--         FETCH NEXT FROM course_cursor INTO @cnum;
--     END
--     CLOSE course_cursor;
--     DEALLOCATE course_cursor;

--     IF exists (SELECT cnum, COUNT(*) AS count
-- FROM @_course
-- GROUP BY cnum
-- HAVING COUNT(*) > 1)
--     BEGIN
--         PRINT '选课冲突'
--         ROLLBACK
--     END
--     ELSE
--         PRINT '选课成功!'
-- END

-- SELECT * FROM sc

-- UPDATE sc SET secnum='11601' WHERE snum='s007' and secnum='13201'

-- INSERT into sc (snum,secnum) VALUES ('s007','11601')

CREATE CLUSTERED INDEX secnum_idx ON sc(snum) 
