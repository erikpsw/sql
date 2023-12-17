create view 学生成绩
as 
select sc.snum,sections.cnum,course.cname,sc.score
from sc,sections,course
where sc.secnum=sections.secnum and sections.cnum=course.cnum
