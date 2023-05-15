--JAVADB

--userTBL 테이블 생성
--NO(번호-숫자(4)), USERNAME(이름-한글 적어도 4자리), BIRTHYEAR(숫자 4자리), ADDR(주소-문자(한글+숫자) 넉넉히), MOBILE (010-1234-1234)

CREATE TABLE USERTBL (
NO NUMBER(4) CONSTRAINT PK_USERTBL PRIMARY KEY,
USERNAME VARCHAR2(12),
BIRTHYEAR NUMBER(4),
ADDR VARCHAR2(50),
MOBILE VARCHAR2(13)
);

--select(+서브쿼리, 조인) + DML(insert, delete, update)

delete usertbl where addr='옆집';
commit;

select * from usertbl where no=1;
select * from usertbl where username='홍길동';

-- like : _ or %
select * from usertbl where username like '홍%동%';

--insert into 테이블명(필드명1, 필드명2,...)
--values();

--update 테이블명
--set 업데이트할필드명=값, 업데이트할필드명=값, ...
--where 조건;

--delete 테이블명 where 조건


-- 시퀀스 생성
-- USER_SEQ 생성(기본형태)
CREATE SEQUENCE USER_SEQ;

INSERT INTO USERTBL VALUES(USER_SEQ.NEXTVAL, '홍길동2', '1992', '활빈당' , '010-1231-2312');

update booktbl set price=16000 where code=1010;

commit;

--모든 컬럼은 NOT NULL

--paytype 테이블 : pay_no(number-1 PK), info(문자-영어4자 CARD, CASH) 
    -- paytype_seq 생성

CREATE TABLE PAYTYPE (
PAY_NO NUMBER(1) CONSTRAINT PAYTYPE_PAY_NO_PK PRIMARY KEY,
INFO VARCHAR2(10) NOT NULL
);

CREATE SEQUENCE PAYTYPE_SEQ;

INSERT INTO PAYTYPE VALUES(PAYTYPE_SEQ.NEXTVAL, 'CARD');
INSERT INTO PAYTYPE VALUES(PAYTYPE_SEQ.NEXTVAL, 'CASH');

SELECT * FROM PAYTYPE;

-- Suser : user_id(숫자-4 PK), name(문자-한글), pay no(paytype 테이블 pay_no 참조) 

CREATE TABLE SUSER ( 
USER_ID NUMBER(4) CONSTRAINT SUSER_USER_ID_PK PRIMARY KEY, 
NAME VARCHAR2(20) NOT NULL, 
PAY_NO NUMBER(1) NOT NULL CONSTRAINT SUSER_PAY_NO_FK REFERENCES PAYTYPE(PAY_NO));

    
--product
    -- product_id (숫자-8 PK), pname(문자-넉넉) ,price(숫자), content(문자-feature들 들어올거)
    
CREATE TABLE PRODUCT(
PRODUCT_ID NUMBER(8) CONSTRAINT PRODUCT_PRODUCT_ID_PK PRIMARY KEY,
PNAME VARCHAR2(30) NOT NULL,
PRICE NUMBER(8) NOT NULL,
CONTENT VARCHAR2(50) NOT NULL);

CREATE SEQUENCE PRODUCT_SEQ;
    
--Sorder
    --order_id(숫자-8 PK), user_id(user테이블 참조), product_id(product 테이블 참조)
    --order_seq 생성
    
CREATE TABLE SORDER(
ORDER_ID NUMBER(8) CONSTRAINT SORDER_ORDER_ID_PK PRIMARY KEY,
USER_ID NUMBER(4) NOT NULL CONSTRAINT SORDER_USER_ID_FK REFERENCES SUSER(USER_ID),
PRODUCT_ID NUMBER(8) NOT NULL CONSTRAINT SORDER_PRODUCT_ID_FK REFERENCES PRODUCT(PRODUCT_ID));

-- 구매 날짜
ALTER TABLE SORDER ADD ORDER_DATE DATE;

CREATE SEQUENCE ORDER_SEQ;


--장바구니 대용
--INSERT INTO SORDER VALUES(ORDER_SEQ.NEXTVAL, 물건을 구매한 ID, 상품 ID, SYSDATE);

insert into sorder(order_Id, user_Id, product_Id, order_Date)
values(ORDER_SEQ.NEXTVAL,1000,1001,sysdate);

SELECT USER_ID, NAME, U.PAY_NO, INFO
FROM SUSER U JOIN PAYTYPE P ON U.PAY_NO = P.PAY_NO
WHERE U.USER_ID = 1000;

ALTER TABLE PRODUCT MODIFY PRICE NUMBER(8);

ALTER TABLE PRODUCT ADD COLUMN_COPY varchar2(50);
UPDATE PRODUCT SET COLUMN_COPY=content;
ALTER TABLE PRODUCT DROP COLUMN content;
ALTER TABLE PRODUCT RENAME COLUMN COLUMN_COPY TO content;


--USER_ID, NAME. CARD/CASH, PRODUCT_ID, PNAME, PRICE, CONTENT
SELECT O.USER_ID, U.NAME, P.INFO, O.PRODUCT_ID, PR.PNAME, PR.PRICE, PR.CONTENT, o.order_date
FROM SORDER O, SUSER U, PAYTYPE P, PRODUCT PR
WHERE O.USER_ID = U.USER_ID AND U.PAY_NO = P.PAY_NO AND O.PRODUCT_ID = PR.PRODUCT_ID AND O.USER_ID=1000
order by pr.price desc;

--도서 테이블
-- code, title, writer, price
-- code : 1001
-- title : '자바의 신'
-- writer : '홍길동'
-- price : 250000

create table bookTBL(
code number(4) primary key,
title nvarchar2(50) not null,
writer nvarchar2(20) not null,
price number(8) not null);

INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)VALUES (1001,'이것이 자바다','신용균',25000);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)VALUES (1002,'자바의 신','강신용',28000);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)VALUES (1003,'오라클로 배우는 데이터베이스','이지훈',28000);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)VALUES (1004,'자바 1000제','김용만',29000);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE)VALUES (1005,'자바 프로그래밍 입문','박은종',30000);
COMMIT;

select * from booktbl;
desc booktbl;
alter table booktbl add description nvarchar2(100);

-- member 테이블
-- userid (영어, 숫자, 특수문자) 최대 12자까지 허용
-- password (영어, 숫자, 특수문자) 최대 15자까지 허용
-- name (한글)
-- gender (한글: 남 or 여)
-- email(적절하게)

CREATE TABLE MEMBERTBL (
USERID VARCHAR2(15) PRIMARY KEY,
PASSWORD VARCHAR2(20) NOT NULL,
NAME NVARCHAR2(10) NOT NULL,
GENDER NVARCHAR2(2) NOT NULL,
EMAIL VARCHAR2(50) NOT NULL
);
INSERT INTO MEMBERTBL VALUES('hong123','hong123@','홍길동','남','hong123@gmail.com');
commit;
select * from membertbl;

-- 게시판 BOARD
-- 글번호(bno 숫자, 시퀀스 삽입, PK 이름은 PK_BOARD), 작성자(name 한글), 비밀번호(password 숫자, 영문자), 제목(TITLE 한글), 
-- 내용(CONTENT 한글), 파일첨부(ATTACH 파일명), 
-- 답변글 작성시 참조되는 글번호(RE_REF 숫자), 답변글 레벨(RE_LEV 숫자), 답변글 순서(RE_SEQ 숫자)
-- 조회수(CNT 숫자, DEFAULT 0), 작성날짜(REGDATE, DEFAULT로 SYSDATE)

-- 테이블 생성
CREATE TABLE BOARD (
BNO NUMBER(8) CONSTRAINT PK_BOARD PRIMARY KEY ,
NAME NVARCHAR2(10) NOT NULL,
PASSWORD VARCHAR2(20) NOT NULL,
TITLE NVARCHAR2(50) NOT NULL,
CONTENT NVARCHAR2(1000) NOT NULL,
ATTACH NVARCHAR2(100),
RE_REF NUMBER(8) NOT NULL,
RE_LEV NUMBER(8) NOT NULL,
RE_SEQ NUMBER(8) NOT NULL,
CNT NUMBER(8) DEFAULT 0,
REGDATE DATE DEFAULT SYSDATE
);

-- 시퀀스 생성 BOARD_SEQ
CREATE SEQUENCE BOARD_SEQ;

select * from board;

insert into board(bno, name, password, title, content, re_ref, re_lev, re_seq)
(select board_seq.nextval,name,password,title,content,board_seq.currval,re_lev,re_seq from board);

commit;

-- 댓글
--re_ref, re_lev, re_seq

-- 원본글 작성 re_ref : bno  값과 동일
--              re_lev : 0, re_seq : 0

select bno, title, re_ref, re_lev, re_seq from board where bno=32;

-- re_ref : 그룹번호, re_seq : 그룹 내에서 댓글의 순서, 
-- re_lev : 그룹 내에서 댓글의 깊이(원본글의 댓글인지? 댓글의 댓글인지?)
-- 댓글도 새 글임 => insert 작업
--      bno : board_seq.nextval
--      re_ref : 원본글의 re_ref와 동일
--      re_seq : 원본글의 re_seq + 1
--      re_lev : 원본글의 re_lev +1

-- 첫번째 댓글 작성
insert into board(bno,name,password,title,content,attach,re_ref,re_lev,re_seq)
values(board_seq.nextval,'김댓글','12345','Re : 게시글','게시글 댓글',null,32,1,1);

-- 두번째 댓글 작성
-- re_seq가 값이 작을수록 최신글임 -> 기존 댓글의 re_seq를 수정해야함

-- 기존 댓글이 있는가? 기존 댓글의 re_seq 변경을 한 후 insert 작업 해야함
-- update 구문에서 where 절은 re_ref는 원본글의 re_ref값, re_seq 비교구문은 원본글의 re_seq 값과 비교
update board set re_seq = re_seq + 1 where re_ref=32 and re_seq > 0 ;

insert into board(bno,name,password,title,content,attach,re_ref,re_lev,re_seq)
values(board_seq.nextval,'김댓글','12345','Re : 게시글2','게시글 댓글2',null,32,1,1);

select bno, title, re_ref, re_lev, re_seq from board where re_ref=32 order by re_ref desc , re_seq;
commit;

-- 댓글의 댓글 작성
-- 댓글은 무조건 update -> insert
update board set re_seq = re_seq + 1 where re_ref=32 and re_seq > 2;

insert into board(bno,name,password,title,content,attach,re_ref,re_lev,re_seq)
values(board_seq.nextval,'김댓글','12345','ReRe : 게시글','댓글의 댓글2',null,32,2,3);

-- 페이지 나누기
-- ROWNUM : 조회된 결과에 번호를 매겨줌
--          ORDER BY 구문에 INDEX가 들어가지 않는다면 제대로 된 결과를 보장하지 않음
--          PK가 INDEX로 사용됨
    SELECT ROWNUM, BNO, TITLE FROM BOARD ORDER BY BNO DESC;
    
    SELECT ROWNUM, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ FROM BOARD ORDER BY RE_REF DESC, RE_SEQ;
    
-- 해결
-- ORDER BY 구문을 먼저 실행한 후 ROWNUM 붙여야 함
SELECT ROWNUM, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ
  FROM(SELECT ROWNUM, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ FROM BOARD ORDER BY RE_REF DESC, RE_SEQ)
  WHERE ROWNUM <= 30;
  -- WHERE ROWNUM BETWEEN 2 AND 10; 이거 안됨. 1부터 해도 안됨.
  
  -- 1 2 3 4 5 6 ...
  -- 1PAGE 요청 (1~30)
  -- 2PAGE 요청 (31~60)
  -- 3PAGE 요청 (61~90)
  
  --60개를 먼저 뽑아나와서, 31~60을 보여준다.
  SELECT * FROM (SELECT ROWNUM AS RNUM, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ
  FROM(SELECT ROWNUM, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ 
  FROM BOARD ORDER BY RE_REF DESC, RE_SEQ) WHERE ROWNUM <= 60)
  WHERE RNUM >30;
  
    --90개를 먼저 뽑아나와서, 61~90을 보여준다.
  SELECT * FROM (SELECT ROWNUM AS RNUM, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ
  FROM(SELECT ROWNUM, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ 
  FROM BOARD ORDER BY RE_REF DESC, RE_SEQ) WHERE ROWNUM <= 90)
  WHERE RNUM >60;
  
  -- spring_board
  CREATE TABLE SPRING_BOARD(
  BNO NUMBER(10) CONSTRAINT PK_SPRING_BOARD PRIMARY KEY,
  TITLE VARCHAR2(200) NOT NULL,
  CONTENT VARCHAR2(2000) NOT NULL,
  WRITER VARCHAR2(50) NOT NULL,
  REGDATE DATE DEFAULT SYSDATE,
  UPDATEDATE DATE DEFAULT SYSDATE
  );
  
  CREATE SEQUENCE SEQ_BOARD;
  
  select * from spring_board;
  
  -- 시퀀스 seq_board
  create sequence seq_board;
  
  --mybatis 연습용 테이블
  create table person(
  id varchar2(20) primary key,
  name varchar2(30) not null);
  
  insert into person values('choi123','최길동');
  commit;
  select * from person;
  select * from booktbl order by code;
  
  -- 트랜잭션 테스트 테이블
  -- 트랜잭션 : 하나의 업무에 여러개의 작은 업무들이 같이 묶여 있음 / 하나의 단위로 처리
  -- EX) 계좌이체 : 해당 계좌 출금 + 타 계좌 입금
  CREATE TABLE TBL_SAMPLE1(COL1 VARCHAR2(500));
  CREATE TABLE TBL_SAMPLE2(COL1 VARCHAR2(50));
  
  select * from tbl_sample1;
  select * from tbl_sample2;
  
  delete tbl_sample1;
  commit;