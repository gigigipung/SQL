--DROP TABLE "LOGIN_LOG";
--DROP TABLE "BOARD_REPLY";
--DROP TABLE "BOARD_REPORT";
--DROP TABLE "BOARD_FILE";
--DROP TABLE "BOARD";
--DROP TABLE "MEMBER";

--insert 순서는 drop반대 순서

-----  TABLE MEMBER INSERT
DESC MEMBER;
--MEM_ID    NOT NULL VARCHAR2(20)  
--MEM_PWD   NOT NULL VARCHAR2(20)  
--MEM_EMAIL NOT NULL VARCHAR2(100)
INSERT INTO MEMBER VALUES ('kh1','pwd1','kh1@a.com');
INSERT INTO MEMBER VALUES ('kh2','pwd2','kh2@a.com');
INSERT INTO MEMBER VALUES ('kh3','pwd3','kh3@a.com');
INSERT INTO MEMBER VALUES ('kh4','pwd4','kh4@a.com');
INSERT INTO MEMBER VALUES ('kh5','pwd5','kh5@a.com');


DESC board;
--MEM_ID    NOT NULL VARCHAR2(20)  
--MEM_PWD   NOT NULL VARCHAR2(20)  
--MEM_EMAIL NOT NULL VARCHAR2(100)
INSERT INTO board VALUES (SEQ_BOARD_ID.nextval,'제목1','내용1',DEFAULT,'127.0.0.0','kh1',DEFAULT);
INSERT INTO board VALUES (SEQ_BOARD_ID.nextval,'제목2','내용2',DEFAULT,'127.0.0.0','kh2',DEFAULT);
INSERT INTO board VALUES (SEQ_BOARD_ID.nextval,'제목3','내용3',DEFAULT,'127.0.0.0','kh3',DEFAULT);
INSERT INTO board VALUES (SEQ_BOARD_ID.nextval,'제목4','내용4',DEFAULT,'127.0.0.0','kh4',DEFAULT);
INSERT INTO board VALUES (SEQ_BOARD_ID.nextval,'제목5','내용5',DEFAULT,'127.0.0.0','kh5',DEFAULT);


desc board_reply;

--BOARD_REPLY_ID         NOT NULL NUMBER         
--BOARD_ID               NOT NULL NUMBER         
--BOARD_REPLY_WRITER     NOT NULL VARCHAR2(20)   
--BOARD_REPLY_CONTENT    NOT NULL VARCHAR2(4000) 
--BOARD_REPLY_WRITE_TIME NOT NULL TIMESTAMP(6)   
--BOARD_REPLY_LOG_IP              VARCHAR2(15)   
--BOARD_REPLY_LEVEL      NOT NULL NUMBER(2)      
--BOARD_REPLY_REF        NOT NULL NUMBER         
--BOARD_REPLY_STEP       NOT NULL NUMBER(3) 

-- board_id : 5 댓글들 ...달기

insert into board_reply values( (select nvl(max(board_reply_id),0)+1 from board_reply),5, 
    'kh1', '댓글1', default, null, 
    1 , (select nvl(max(board_reply_id),0)+1 from board_reply), 1
);

-- 1번글에 대댓글
insert into board_reply values( (select nvl(max(board_reply_id),0)+1 from board_reply),5, 
    'kh1', '대댓글1', default, null, 
    2 , 1, 2
);
-- 1번글에 대대댓글
insert into board_reply values( (select nvl(max(board_reply_id),0)+1 from board_reply),5, 
    'kh1', '대댓글1', default, null, 
    3 , 1, 3
);
select * from board_reply

;

-- 1번글에 대댓글
--insert into board_reply values( (select nvl(max(board_reply_id),0)+1 from board_reply),5, 
--    'kh1', '대댓글1', default, null, 
--    2 , 1, 2
--);

commit;