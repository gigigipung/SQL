--1
select student_no, student_name, entrance_date from tb_student where department_no='002' order by 3;

--2
select professor_name ,professor_ssn
from tb_professor
where 0=decode(lengthb(professor_name),'9',1,0);

--3

(select sysdate-TO_DATE(20230402,'YYYYMMDD') from dual);
select  professor_name,FLOOR((sysdate-TO_DATE(19000000+SUBSTR(professor_ssn
,1,6),'YYYYMMDD'))/365) AS 나이
--, (sysdate-TO_DATE(19000000+SUBSTR(professor_ssn,1,6),'YYYYMMDD')) 
--,professor_ssn
from tb_professor
ORDER BY 2
;

--4
SELECT REPLACE(professor_name,SUBSTR(professor_name,1,1)) FROM TB_PROFESSOR;

--5 문제가 이게 맞나?
SELECT  STUDENT_NO, STUDENT_NAME FROM TB_STUDENT WHERE
FLOOR((entrance_date-TO_DATE(SUBSTR(student_ssn,1,6)))/365)=19
--AND student_name='박경애'
;

--6
SELECT TO_CHAR(TO_DATE(20201225),'DAY') FROM DUAL;

--7

SELECT TO_CHAR(TO_DATE('99/10/11'),'YYYY/MM/DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('49/10/11'),'YYYY/MM/DD') FROM DUAL;

SELECT TO_CHAR(TO_DATE('99/10/11'),'RRRR/MM/DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('49/10/11'),'RRRR/MM/DD') FROM DUAL;

--8
SELECT STUDENT_NO,STUDENT_NAME
FROM TB_STUDENT
WHERE DECODE(SUBSTR(STUDENT_NO,1,1),'A',1,0)=0
;

--9
SELECT ROUND((AVG(POINT)),1) AS 평점 FROM TB_GRADE WHERE STUDENT_NO='A517178';

--10
SELECT department_no,COUNT(department_no) FROM TB_STUDENT GROUP BY  department_no ORDER BY 1;

--11

SELECT COUNT(*)   FROM TB_STUDENT 
WHERE coach_professor_no IS NULL;

--12

SELECT 
SUBSTR(term_no,1,4) AS "년도"
,ROUND(AVG(POINT),1) AS "년도 별 평점" 
FROM TB_GRADE 
WHERE student_no='A112113' 
GROUP BY SUBSTR(term_no,1,4)
;

--13


--14
SELECT * FROM
(SELECT DISTINCT student_name,COUNT(student_name) AS "동명인 수" FROM TB_STUDENT 
GROUP BY student_name)
WHERE DECODE("동명인 수",1,1,0)=0 ORDER BY 1
;

--15
