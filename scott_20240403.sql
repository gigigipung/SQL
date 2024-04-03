desc emp;

set serveroutput on;


begin
    dbms_output.put_line('hello world');
end;
/
declare
    v_empno emp.empno%type;
    v_ename emp.ename%type;
begin
    select empno, ename
    into v_empno,v_ename
    from emp
    where empno=7782;
    dbms_output.put_line(v_empno || ':' || v_ename);
end;
/
desc emp;

insert into dept values(50,'KH','서&울');
--&서&울 서는 선 입력 울은 설명 다음 입력창이 나옴
/
DECLARE
TYPE EMP_ID_TABLE_TYPE IS TABLE OF EMPLOYEE.EMP_ID%TYPE
INDEX BY BINARY_INTEGER;
TYPE EMP_NAME_TABLE_TYPE IS TABLE OF EMPLOYEE.EMP_NAME%TYPE
INDEX BY BINARY_INTEGER;
EMP_ID_TABLE EMP_ID_TABLE_TYPE;
EMP_NAME_TABLE EMP_NAME_TABLE_TYPE;
I BINARY_INTEGER := 0;
BEGIN
FOR K IN (SELECT EMP_ID, EMP_NAME FROM EMPLOYEE) LOOP
I := I + 1;
EMP_ID_TABLE(I) := K.EMP_ID;
EMP_NAME_TABLE(I) := K.EMP_NAME;
DBMS_OUTPUT.PUT_LINE('EMP_ID : ' || EMP_ID_TABLE(I) || ', EMP_NAME : ' || EMP_NAME_TABLE(I) || k.emp_name);
END LOOP;
FOR J IN 1..I LOOP
DBMS_OUTPUT.PUT_LINE('EMP_ID : ' || EMP_ID_TABLE(J) || ', EMP_NAME : ' || EMP_NAME_TABLE(J));
END LOOP;
END;
/
declare
    type empno_table is table of emp.empno%type index by BINARY_INTEGER;
    v_arr_no empno_table;
    type ename_table is table of emp.ename%type index by BINARY_INTEGER;
    v_arr_name  ename_table;
    
    v_idx BINARY_INTEGER := 0;
begin
    dbms_output.put_line(v_idx);
    
    for vo in (select empno ,ename from emp)loop
        v_idx := v_idx+1;
        v_arr_no(v_idx) := vo.empno;
        v_arr_name(v_idx) := vo.ename;
        
        dbms_output.put_line(v_arr_no(v_idx) || ':' || v_arr_name(v_idx));
    end loop
    ;
end;
/
declare
    type emp_record_type is RECORD (
        emp_id employee.emp_id%type,
        emp_name employee.emp_name%type,
        dept_title department.dept_title%type,
        job_name job.job_name%type
    );
    
    EMP_RECORD EMP_RECORD_type;
begin
    select emp_id,emp_name,dept_title,job_name into emp_record
    from employee e,department d,job j
    where e.dept_code = d.dept_id
        and e.job_code = j.job_code
        and emp_name = '&emp_name';
        
        dbms_output.put_line('사번 :'||emp_record.emp_id);
        dbms_output.put_line('이름 :'||emp_record.emp_name);
        dbms_output.put_line('부서 :'||emp_record.dept_title);
        dbms_output.put_line('직급 :'||emp_record.job_name);
end;
/
declare
    emp_id employee.emp_id%type;
    emp_name employee.emp_name%type;
    salary employee.salary%type;
    bonus employee.bonus%type;
begin
    select emp_id,emp_name,salary,nvl(bonus,0)
    into emp_id,emp_name,salary,bonus
    from employee
    where emp_id = '&EMP_ID';
    
    DBMS_OUTPUT.PUT_LINE('사번:' || EMP_ID);
    DBMS_OUTPUT.PUT_LINE('이름:' || EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('급여:' || SALARY);
    
    IF(BONUS = 0)
        THEN DBMS_OUTPUT.PUT_LINE('보너스를 지급받지 않는 사원입니다.');
    END IF;
    DBMS_OUTPUT.PUT_LINE('보너스율:' || BONUS*100||'%');
end;
/
declare
    emp_id employee.emp_id%type;
    emp_name employee.emp_name%type;
    DEPT_TITLE DEPARTMENT.DEPT_TITLE%TYPE;
    NATIONAL_CODE LOCATION.NATIONAL_CODE%TYPE;
    TEAM VARCHAR2(20);
begin
    SELECT EMP_ID,EMP_NAME,DEPT_TITLE,NATIONAL_CODE
    INTO EMP_ID, EMP_NAME,DEPT_TITLE,NATIONAL_CODE
    FROM EMPLOYEE E,DEPARTMENT D, LOCATION L
    WHERE E.DEPT_CODE = D.DEPT_ID
        AND D.LOCATION_ID = L.LOCAL_CODE
        AND EMP_ID = '&EMP_ID';
        
    IF(NATIONAL_CODE = 'KO') THEN TEAM:='국내팀';
    ELSE TEAM :='해외팀';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('사번:' || EMP_ID);
    DBMS_OUTPUT.PUT_LINE('이름:' || EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('부서:' || DEPT_TITLE);
    DBMS_OUTPUT.PUT_LINE('소속:' || TEAM);
end;
/
DECLARE
    SCORE INT;
    GRADE VARCHAR2(2);
BEGIN
    score := '&SCORE';
    
    IF SCORE >= 90 THEN GRADE:='A';
    ELSIF SCORE >= 80 THEN GRADE:='B';
    ELSIF SCORE >= 70 THEN GRADE:='C';
    ELSIF SCORE >= 60 THEN GRADE:='D';
    ELSE GRADE :='F';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('당신의 점수는'||SCORE||'점이고 학점은'||GRADE||'입니다.');
END;
/
DECLARE
    N NUMBER:=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N:=N+1;
        IF N > 5 THEN EXIT;
        END IF;
    END LOOP;
END;
/
BEGIN
    FOR N IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/
BEGIN
FOR N IN REVERSE 1..5 LOOP
DBMS_OUTPUT.PUT_LINE(N);
END LOOP;
END;
/
DECLARE
    N NUMBER:=1;
BEGIN
    WHILE N <=5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N:=N+1;
    END LOOP;
END;
/

DECLARE
    DUP_EMPNO EXCEPTION;
    PRAGMA EXCEPTION_INIT(DUP_EMPNO, -00001);
BEGIN
    UPDATE EMPLOYEE
    set emp_id='&사번'
    where EMP_ID = 200;
EXCEPTION
    when dup_empno
    then dbms_output.put_line('이미 존재하는 사번입니다.');
END;
/
DECLARE
DUP_EMPNO EXCEPTION;
PRAGMA EXCEPTION_INIT(DUP_EMPNO, -00001);
BEGIN
UPDATE EMPLOYEE 
SET EMP_ID = '&사번'
WHERE EMP_ID = '200';
EXCEPTION
WHEN DUP_EMPNO
THEN DBMS_OUTPUT.PUT_LINE('이미 존재하는 사번입니다.');
END;
/


create or REPLACE procedure proc_test1
is
    AAA_UK EXCEPTION;
    PRAGMA EXCEPTION_INIT(AAA_UK , -00001);
    BBB_OVERFLOW EXCEPTION;
    PRAGMA EXCEPTION_INIT(BBB_OVERFLOW , -01438);
BEGIN
    UPDATE EMP
    set empNO=7369
    where EMPNO = 7788;
EXCEPTION
    when AAA_UK
    then dbms_output.put_line('이미 존재하는 사번입니다.');
    when BBB_OVERFLOW
    then dbms_output.put_line('자릿수보다 큰 값은 허용되지않아요');
END;
/

EXEC proc_test1;


CREATE OR REPLACE PROCEDURE PRE_SELECT_EMPNO (
    V_EMPNO  IN   EMP.EMPNO%TYPE
    ,V_ENAME OUT  EMP.ENAME%TYPE
    ,V_SAL   OUT  EMP.SAL%TYPE
    ,V_COMM  OUT  EMP.COMM%TYPE)
IS 
BEGIN
    SELECT ENAME,SAL,COMM
    INTO V_ENAME,V_SAL,V_COMM
    FROM EMP
    WHERE EMPNO=V_EMPNO;
END;
/


VARIABLE A_NAME VARCHAR2(100);
VARIABLE A_SAL NUMBER;
VARIABLE A_COMM NUMBER;

EXEC PRE_SELECT_EMPNO(7788,:A_NAME,:A_SAL,:A_COMM);
PRINT A_NAME;
PRINT A_SAL;



CREATE TABLE EMP_DUP AS SELECT * FROM EMPLOYEE;
SELECT * FROM EMP_DUP;

/
CREATE OR REPLACE PROCEDURE DEL_ALL_EMP
IS BEGIN
    DELETE FROM EMP_DUP;
END;
/
EXEC del_all_emp;

SELECT * FROM EMP_DUP;

ROLLBACK;

DESC USER_SOURCE;

SELECT * FROM USER_SOURCE;

CREATE OR REPLACE VIEW V_EMP_JOB(사번,이름,직급,성별,근무년수)
AS SELECT EMP_ID,EMP_NAME,JOB_NAME,DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여'),
EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

SELECT * FROM V_EMP_JOB;



CREATE OR REPLACE FUNCTION BONUS_CALC(V_EMPID EMPLOYEE.EMP_ID%TYPE)
RETURN NUMBER
IS 
    V_SAL EMPLOYEE.SALARY%TYPE;
    V_BONUS EMPLOYEE.BONUS%TYPE;
    CALC_SAL NUMBER;
BEGIN
    SELECT SALARY,NVL(BONUS,0)
    INTO V_SAL,V_BONUS
    FROM EMPLOYEE
    WHERE EMP_ID=V_EMPID;
    
    CALC_SAL := (V_SAL+(V_SAL+V_BONUS))*12;
    RETURN CALC_SAL;
END;
/
SET AUTOPRINT ON;

VARIABLE VAR_CALC NUMBER;
EXEC :VAR_CALC := BONUS_CALC('&EMP_ID');
    
SELECT bonus_calc FROM EMPLOYEE;

SELECT EMP_ID, EMP_NAME,BONUS_CALC(EMP_ID)
FROM EMPLOYEE;