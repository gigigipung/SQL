--1
select  department_name, category from tb_department;

--2

select concat(concat(department_name,'의 정원은 '),concat(capacity,'명 입니다')) as "학과별 정원" from tb_department;

--3

select student_name from tb_student 
where department_no=(select department_no from tb_department where department_name='국어국문학과')
and 1 = DECODE(SUBSTR(student_ssn, 8, 1),'2','1')
and 'Y'= absence_yn
;

--4

select student_name from tb_student
where student_no = 'A513079' or student_no = 'A513090'or student_no = 'A513091'
or student_no = 'A513110'or student_no = 'A513119' 
ORDER by 1 desc;

--5
select department_name, category from tb_department
where capacity BETWEEN 20 and 30;

--6
select professor_name from tb_professor where 1=1
and department_no is null
;

--7 먼가 먼가 있음 
select * from tb_student where 1=1
--and department_no is null
;

--8
select class_no from tb_class where preattending_class_no is not null;

--9
SELECT DISTINCT category FROM tb_department ORDER by 1;


--10
select student_no,student_name,student_ssn from tb_student where 1=1
and substr(student_no,1,2)='A2'
and absence_yn='N'
and substr(student_address,1,2)='전주'
order by 2
;