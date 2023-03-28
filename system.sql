-- 대소문자 구별하지 않음 (단, 비밀번호는 구별함)
--
-- CREATE : 생성 ALTER : 수정 DROP : 삭제 DELETE : 삭제
--
--오라클 버전이 변경되면서 사용자 생성 시 C## 문자를 넣어서 만들도록 변경 됨
--JAVADB -> C##JAVADB / 에서 C##을 사용하지 않겠음
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; 

-- 사용자 : scott, hr 같은 거 => 데이터베이스 접속하여 데이터를 관리하는 계정
    --테이블, 인덱스, 뷰 등 여러 객체가 사용자별로 생성됨
    --업무에 따라 사용자들을 나눠서 관리
    
    -- 스키마 : 데이터간 관계, 데이터 구조, 제약조건 등 데이터를 관리 저장하기 위해 정의한 데이터베이스 구조의 범위
        -- 스키마 == 사용자 (오라클 데이터베이스의 경우)
    
    -- 사용자 생성 : 사용자 생성 권한이 필요함 => sys, system이 부여 가능함
    -- 비밀번호는 대소문자 구별함

-- USER 생성작업은 SYS, SYSTEM만 가능
-- USER 생성
-- CREATE USER id IDENTIFIED BY password
CREATE USER JAVADB IDENTIFIED BY 12345;

-- CREATE한 USER가 사용할 공간을 할당
ALTER USER JAVADB DEFAULT TABLESPACE USERS;
ALTER USER JAVADB TEMPORARY TABLESPACE TEMP;
ALTER USER JAVADB QUOTA 2M ON USERS;

--GRANT : 권한 부여 (여기서는 CONNECT, RESOURCE) USER생성만으로는 어떤 작업도 할 수 없음
GRANT CONNECT, RESOURCE TO JAVADB;

CREATE USER SCOTT IDENTIFIED BY TIGER
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

--SCOTT에게 부여된 권한
GRANT CONNECT, RESOURCE TO SCOTT;
--뷰 생성 권한 부여
GRANT CREATE VIEW TO SCOTT;
--SYNONYM 생성 권한 부여
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;


GRANT UNLIMITED TABLESPACE TO SCOTT;

SELECT * FROM ALL_USERS;

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;

-- test 사용자 생성 / 비번 12345
CREATE USER test IDENTIFIED BY 12345;

-- 접속권한 부여하지 않으면 안됨

-- 권한 관리
    -- 1) 시스템 권한
        -- 사용자 생성(CREATE USER) / 수정(ALTER USER) / 삭제(DROP USER)
        -- 데이터베이스 접근 (CREATE SESSION) / 수정 (ALTER SESSION)
        -- 여러 객체 생성(view, synonym) 및 관리 권한

    -- 2) 객체 권한
        --테이블 수정, 삭제, 인덱스 생성, 삽입, 참조, 조회, 수정
        --뷰 삭제, 삽입, 생성, 조회, 수정
        --시퀀스 수정, 조회
        --프로시저, 함수, 패키지 권한
        
        -- CREATE SESSION을 TEST에게 부여
        GRANT CREATE SESSION TO TEST;
        
        GRANT RESOURCE, CREATE TABLE TO TEST;
        
        ALTER USER TEST DEFAULT TABLESPACE USERS;
        ALTER USER TEST TEMPORARY TABLESPACE TEMP;
        ALTER USER TEST QUOTA 2M ON USERS; -- USERS에 공간 설정
        
        
        --SCOTT에게 TEST가 생성한 MEMBER 테이블 조회 권한 부여
        --GRANT SELECT ON MEMBER TO SCOTT;
        
        --권한 취소
        REVOKE SELECT, INSERT ON MEMBER FROM SCOTT;
        
        -- 롤 : 여러 권한들의 모임
        -- CONNECT 롤 : CREATE SESSION
        -- RESOURCE 롤 : CREATE TRIGGER, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TABLE, ...
        
        --사용자 삭제
        DROP USER TEST; -- test 사용자가 만든 테이블 같은 거 있어서 안됨
        DROP USER TEST cascade;
        
        create user test2 identified by 12345
        DEFAULT TABLESPACE USERS
        TEMPORARY TABLESPACE TEMP;
        
        GRANT CONNECT, RESOURCE TO TEST2;
        
        