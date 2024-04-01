rename employee_copy to emmmm;

truncate table emmmm;

rollback;

SELECT    * FROM user_tables;
SELECT    * FROM user_views;
SELECT    * FROM user_constraints;
SELECT    * FROM user_cons_columns;
create table t8 (
c1 varchar2(10),
c2 nvarchar2(10),
c3 char (10),
c4 nchar(10)
);

--insert into t8 VALUES('123456789가','123456789가','123456789가','123456789가');

insert into t8 VALUES('1234567가','123456789가','1234567가','123456789가');
--앞에 n이 들어간 값들은 글자당 한자리를 차지한다.


select * from t8 
where c3='aaa ';

create table t9(
    c1 varchar2(4000),
    c2 nvarchar2(2000),
    c3 char(2000),
    c4 nchar(1000)
);
drop table t9;
select * from t9 ;
create index inx_t9 on t9(c1);

select * from user_indexes;
select * from user_ind_columns;

create index idx_dept on department(dept_id, dept_title);

select * from user_IND_columns where table_name='department';
