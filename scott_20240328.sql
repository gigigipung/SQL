--oracle의 쓸만한점
select * from user_constraints;
select * from user_tables;
select * from user_indexes;
select * from user_views;
select * from user_sequences;






select emp_id,emp_name,dept_title
    from employee
    natural join department
    order by 1
;



desc employee;

desc department;


SELECT E.EMP_ID, E.EMP_NAME 사원이름, E.DEPT_CODE, E.MANAGER_ID,M.EMP_NAME 관리자이름
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID;

select * from employee;


-- subquery
-- 단일행 1 group by 없이 그룹함수 사용
select count(comm) from emp;
select count(distinct comm) from emp;
-- 단일행 2 where PK컬럼명 = 값
select * from emp where empno = 7499;

--연산자

select empno, ename,sal from emp
where sal> any(select sal from emp where job='SALESMAN');


--사원들중 최고 급여보다 많은 급여를 받는 사람들이 조회된다.
select empno, ename,sal from emp
where sal> all(select sal from emp where job='SALESMAN');


--관리자로 등록되어 있는 사원들을 조회
select empno, ename,sal from emp e
where EXISTS (select empno from emp s where s.mgr =e.empno);

select sysdate from dual 
where sysdate > to_date('2024-03-28 10:36:24', 'yyyy-mm-dd hh24:mi:ss');

alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';


--rownum을 가장 많이 쓰는이유는 페이징 처리
select t1.*,rownum r2
from(
select ename,sal,rownum r1
from emp
order by sal desc) t1;


select t1.*,rownum r2
from(
select ename,sal,hiredate,rownum r1
from emp
order by hiredate desc) t1;

--문제
SELECT t2.*,rownum
from 
(select t1.*,rownum r2
from(
select ename,sal,hiredate,rownum r1
from emp
order by sal desc) t1) t2
where r2  between 6 and 10;


with t1 as ( select ename, sal, hiredate,rownum r1 from emp order by hiredate desc)
select * from t1
;


-- 분석 함수
--rank()
with t1 as(select ename, sal, hiredate
,rank() over(order by sal )r1
from emp)
select * from t1
    where r1 between 6 and 10
;


select ename,sal,sum(sal) over() a , sum(sal) over(partition by sal) b
from emp
;

select ename,deptno,sal,sum(sal) over(partition by sal) a
    ,rank() over(order by sal desc) b
    ,rank() over(partition by deptno order by sal desc) c
    from emp
    ORDER by deptno
;


-- LAG(조회할 범위, 이전위치, 기준 현재 위치)
select ename,deptno,sal
,lag(sal,1,0) over(order by sal) 이전값
,lag(sal,1,sal) over (order by sal) 조회
,lag(sal,1,sal) over (partition by deptno order by sal) 조회
from emp
;



 
SELECT EMPNO, DEPTNO, SAL
    , SUM(SAL) OVER (ORDER BY EMPNO ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) "win1"
        -- rows : 부분그룹인 윈도우의 크기를 물리적인 단위로 행집합을 지정
        -- unbounded preceding : 윈도우의 첫행
        -- unbounded following : 윈도우의 마지막행
        -- current row : 현재행
        -- 1 PRECEDING : 현재 행을 중심으로 N 이전행
        -- 1 FOLLOWING : 현재 행을 중심으로 N 다음행
--    , SUM(SAL) OVER (PARTITION BY DEPTNO ORDER BY EMPNO ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "win2"
        -- 윈도우의 시작행에서 현재 위치(current row) 까지의 합계를 구해서 win2에
--    , SUM(SAL) OVER (PARTITION BY DEPTNO ORDER BY EMPNO ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) "win3"
        -- 현재 위치에서 윈도우의 마지막행까지의 합계를 구해서 win3에
        
--    , SUM(SAL) OVER (PARTITION BY DEPTNO ORDER BY EMPNO ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) "win4" -- 1 preceding and 1 following 
        -- 현재 행을 중심으로 이전행과 다음행의 급여합계
    FROM EMP
--    WHERE DEPTNO = 30
    ;
    


SELECT EMPNO, ENAME, DEPTNO, HIREDATE
,(SELECT loc from dept where deptno=e.deptno) loc
FROM EMP E

ORDER BY(SELECT loc from dept where deptno=e.deptno) desc;

select * from dept order by dname;


--DDL
drop table t1;
create table t1(
birthday date,name varchar2(30));

drop table t1;
create table t1(
birthday date,name varchar2(30) not null);

drop table t1;
create table t1(
birthday date,name varchar2(30) unique);

comment on column t1.birthday is '생년월일';
select * from t1;
insert into t1 values (sysdate,null);
insert into t1 values (null,'홍길동');

drop table t1;
create table t1 (birthday date, name varchar2(30) unique
    ,gender char(1) check(gender in ('f' ,'m')));

insert into t1 values (null,'홍길동','a');

create table t1 (birthday date, name varchar2(30) PRIMARY key) ;
insert into t1 values (null,'홍길동');
select * from user_constraints where constraint_name='SYS_C008356';

create table t2 (gender char(1) check(gender in ('m','f'))
,name varchar2(30) REFERENCES t1(name));

insert into t2 values(null,'홍길동');
select * from t2;
create table t1 (birthday date, name varchar2(30) PRIMARY key) ;
drop table t1;
drop table t2;

create table t2 (gender char(1) check(gender in ('m','f'))
,name varchar2(30) REFERENCES t1(name) on delete cascade);

create table t2 (gender char(1) check(gender in ('m','f'))
,name varchar2(30) REFERENCES t1(name) on delete set null);

insert into t2 values(null,'홍길동2');
insert into t2 values(null,'홍길동');
select * from t2;
select * from t1;

--update t1 set name='홍길동3' where name ='홍길동2';
delete from t1 where name='홍길동2';

