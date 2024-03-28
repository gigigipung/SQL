SELECT  * FROM emp;

-- smith 로그인 -마이페이지를 들어감

select empno, ename,job, mgr ,hiredate,sal,emp.deptno,dept.deptno,dname,loc
from emp ,dept
where ename = 'SMITH' 
and emp.deptno > dept.deptno
;

select empno, ename,job, mgr ,hiredate,sal,emp.deptno,dept.deptno,dname,loc
from emp cross join dept
; -- 카테시안 조인

select empno, ename,job, mgr ,hiredate,sal,emp.deptno,dept.deptno,dname,loc
from emp join dept on emp.deptno > dept.deptno
where ename = 'SMITH'
;

select empno, ename,job, mgr ,hiredate,sal,deptno,dname,loc
    from emp join dept using(deptno) --deptno가 같은 값일것
    where ename = 'SMITH'
;


select * from emp join dept using(deptno);
select * from emp join dept on emp.deptno < dept.deptno;
select emp.*,dname,loc from emp join dept on emp.deptno>dept.deptno;
select emp.*,dept.*,ename re_ename,sal re_sal, loc re_loc  from emp join dept on emp.deptno>dept.deptno;

select * from emp join salgrade on emp.sal between 600 and 1200;

select * from emp join salgrade on emp.sal BETWEEN salgrade.losal and salgrade.hisal;

select * from emp e join salgrade s on e.sal BETWEEN s.losal and s.hisal;



select * from emp left outer join dept using (deptno);
select * from emp , dept where emp.deptno = dept.deptno(+);


select * from emp right outer join dept using (deptno);
select * from emp , dept where emp.deptno(+) = dept.deptno;

select * from emp join dept on emp.deptno= dept.deptno;






select * from dept left outer join emp using (deptno);
select * from dept join emp on emp.deptno > dept.deptno;

select * from emp;

select emp.*, d.dname, d.loc, s.salgrade
    from emp e
        join dept d on e.deptno = d.depteno
        join salgrade s on sal between s.losal and s.hisal
;