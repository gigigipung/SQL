--kh

CREATE table EMPLOYEE_COPY
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)
LEFT JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
LEFT JOIN national USING(NATIONAL_CODE);

SELECT * FROM EMPLOYEE_COPY;

CREATE OR REPLACE VIEW V_EMPLOYEE
AS SELECT EMP_ID, EMP_NAME, SALARY, DEPT_TITLE, NATIONAL_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)
LEFT JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
LEFT JOIN national USING(NATIONAL_CODE);

SELECT * FROM V_EMPLOYEE;


DESC EMPLOYEE;

insert into employee  values('999','홍길동','000329-4123456','a@a.a','01011112222','D9','J1','1',3000000,null,'207',sysdate,null,'N' );
select * from v_employee order by emp_id desc;

select * from user_views
;

--검색 기능에 많이 쓰임
SELECT * FROM EMP WHERE 0<>0;


--1
DROP TABLE TB_CATEGORY;

CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);
--2
DROP TABLE TB_CLASS_TYPE;

CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);
--3
ALTER TABLE TB_CATEGORY
ADD PRIMARY KEY(NAME)
;
--4
ALTER TABLE TB_CLASS_TYPE
MODIFY NAME NOT NULL;
--5
ALTER TABLE TB_CLASS_TYPE 
MODIFY NO VARCHAR(10)
MODIFY NAME VARCHAR2(20);
SELECT * FROM TB_CLASS_TYPE;

