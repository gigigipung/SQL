
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
select * from emp where empno/2=0;

