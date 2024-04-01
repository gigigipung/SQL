
--1
select * from emp where comm is not null;


--2
select * from emp where comm ='0' OR comm is null;

--3
select * from emp WHERE mgr is null;

--4
select * from emp   ORDER by sal desc;


--5


--6
select empno, ename,job,hiredate from  emp;

--7
select empno, ename from emp order by 1 desc;

--8


--9
select sysdate from dual;

--10
select empno, ename,TRUNC(sal,-2) from emp order by sal desc;

--11
select EMPNO,ename,job,hiredate,sal,comm,deptno from(
select DECode(mod(empno,2),'1','홀수' ) as aa,EMPNO,ename,job,hiredate,sal,comm,deptno from emp) 
where 1=1
and aa='홀수'
;

--12

select ename, to_char( hiredate,'yyyy'),to_char( hiredate,'mm') from emp;

--13


select * from emp where to_char( hiredate,'mm')='09' ;

--14

select * from emp where to_char( hiredate,'yy')='81' ;

--15

select * from emp where ename='  E' ;
select * from emp;