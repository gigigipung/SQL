alter session set "_ORACLE_SCRIPT"=true;
CREATE user kh identified by khpwd;
--요청한 작업을 수행하는 중 오류 발생:ORA-01045: 사용자 KH는 CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절되었습니다
grant create session to kh;
revoke create session from kh;


--ORA-01045: 사용자 KH는 CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절되었습니다
--01045. 00000 -  "user %s lacks CREATE SESSION privilege; logon denied"
--*Cause:    A connect was attempted to a userid which does not have
--           create session privilege.
--*Action:   Grant the user CREATE SESSION privilege.

create user kh2 identified by khpwd;


grant connect, resource to kh, kh2;

--외우기
--create user 유저명 identified by 비밀번호;
--grant 권한명, 롤명, ... to 유저명, 유저명2, 롤명, ...;
--revoke 권한명, 롤명,... from 유저명, 롤명,.....;
--connect : 접속관련권한들로 만들어진 롤명
--resource : 테이블(객체) 관련 권한들로 만들어진 롤명