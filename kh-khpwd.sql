select * from employee;
select * from department;
select * from location;
select * from national;

select *
from employee
-- where 속성명 = '속성값'
where dept_code ='D5';

select emp_id,emp_name,job_code,hire_date
from employee
-- where 속성명 = '속성값'
where dept_code ='D5';

select *
from employee
-- where 속성명 = '속성값'
where emp_id ='200';

select emp_name,salary * 12,(salary + (salary*bonus))*12
from employee;

select emp_name as name,salary * 12 "연봉(원)",(salary + (salary*bonus))*12  as "총 소득(원)"
from employee ;

select emp_id,salary,'원' as 단위 
from employee;

select distinct job_code
from employee;

select emp_name,dept_code
from employee
where dept_code='D9';

select emp_name, salary
from employee
where salary > 4000000;

select emp_name,dept_code,salary
from employee
where dept_code = 'D6' or salary > 2000000;

select emp_id || emp_name ||salary
from employee;

select emp_name ||'의 월급은' || salary || '원 입니다.'
from employee;


SELECT emp_name,salary
from employee
where salary >= 3500000 and salary <=6000000;

SELECT emp_name,salary
from employee
where salary between 3500000 and 6000000;

select emp_name,salary
from employee
where emp_name like '전%';

select emp_name,phone
from employee
where phone like '___7%';

select emp_name,email
from employee
where email like'___#_%' escape '#';

select emp_id,emp_name,email
from employee
where emp_name not like '이%';

select emp_id,emp_name,email
from employee
where not emp_name like '이%';

select emp_name, manager_id, dept_code
from employee
where manager_id is null and dept_code is null;


select emp_name, bonus, dept_code
from employee
where dept_code is null and bonus is not null;

select emp_name,dept_code,salary
from employee
where dept_code in ('D6','D8');

select emp_name,dept_code,salary
from employee
where dept_code = 'D6'or dept_code='D8';


select emp_name,salary,job_code
from employee
where job_code = 'J7' or job_code ='J2'
and salary > 2000000;


select emp_name,salary,job_code
from employee
where (job_code = 'J7' or job_code ='J2')
and salary > 2000000;









select emp_name,salary || '원' as ex1
from employee;

select distinct job_code, dept_code
from employee;


select emp_name,salary
from employee
where salary >400000;


select emp_name, dept_code, salary
from employee
where dept_code='D6';