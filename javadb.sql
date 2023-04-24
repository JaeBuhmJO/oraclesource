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

select * from usertbl;

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

select * from usertbl;

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

desc booktbl;
alter table booktbl add description nvarchar2(100);
