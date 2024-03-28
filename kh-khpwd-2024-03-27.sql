select emp_name, emp_no, case when substr(emp_no,1,1) = '6' then '60년대생'
WHEN substr(emp_no,1,1) ='7' then '70년대생'
else '잘모르겠어요'
end "출생년도" FROM employee;

select emp_name,decode(substr(emp_no,1,1),'6','60년대생','잘모르겠어요') s1
    ,decode(substr(emp_no,1,1),'6','60년대생','7','70년대셍','잘모르겠어요') s2
    
    ,emp_no
from employee;

select sum(salary) ,job_code
    from employee
    GROUP by job_code
;

select distinct dept_code, job_code
from employee
;


select count(*)
from employee;


select * from employee
    order by dept_code, salary desc 
;


select emp_name,dept_code,job_code,salary,(salary + (salary * nvl(bonus,0) )) * 12 a1
from employee
where dept_code is not null
    and (salary + (salary * nvl(bonus,0) )) * 12>300000
order by a1 desc
;

select dept_code,floor(avg(salary)) 평균
from employee
where dept_code is not null
group by dept_code
having floor(avg(salary)) >=2000000
order by dept_code;


select dept_code,floor(avg(salary)) 평균
from employee
group by dept_code
having dept_code is not null
order by dept_code;

select dept_code 부서코드, sum(salary) 합계, floor(avg(salary)) 평균, count(*) 인원수
from employee
group by dept_code
order by dept_code asc
;

select dept_code, job_code,floor(avg(salary))
from employee
group by rollup(dept_code,job_code)
order by 1

;


SELECT DEPT_CODE, JOB_CODE, SUM(SALARY),
CASE WHEN GROUPING(DEPT_CODE) = 0 AND GROUPING(JOB_CODE) = 1 THEN '부서별 합계'
WHEN GROUPING(DEPT_CODE) = 1 AND GROUPING(JOB_CODE) = 0 THEN '직급별 합계'
WHEN GROUPING(DEPT_CODE) = 1 AND GROUPING(JOB_CODE) = 1 THEN '총 합계'
ELSE '그룹별 합계'END AS 구분
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY 1;

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
UNION
SELECT 'a', JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
ORDER BY 1;