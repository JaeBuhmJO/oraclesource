-- PL / SQL : SQL만으로는 구현이 어렵거나 구현 불가능한 작업을 수행하기 위해 오라클에서 제공하는 프로그래밍 언어

    -- 실행 결과를 화면에 출력
        SET SERVEROUTPUT ON;
    
    -- 블록 : DECLARE ~ BEGIN ~ END
    -- 변수 선언
        DECLARE
            V_EMPNO NUMBER(4) :=7788;
            V_ENAME VARCHAR2(10);
        BEGIN
            V_ENAME := 'SCOTT';
            DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
            DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
        END;
        /

-- 상수 선언 : CONSTANT
DECLARE
    V_TAX CONSTANT NUMBER(4) :=7788;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

--변수 + DEFAULT(기본값)
DECLARE
    V_TAX NUMBER(4) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

--변수 + NOT NULL
DECLARE
    V_TAX NUMBER(4) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

-- 변수 + NOT NULL + DEFAULT
DECLARE
    V_TAX NUMBER(4) NOT NULL DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

    -- 변수와 상수의 자료형
        -- 스칼라 : 오라클이 사용하는 타입(NUMBER, CHAR, DATE....)
        -- 참조형 : 오라클 데이터 베이스에 존재하는 특정 테이블의 열의 자료형이나 하나의 행 구조를 참조하는 자료형
            -- 1) 변수이름 테이블명.열이름%TYPE : 특정 테이블에 속한 열과 같은 크기의 자료형을 사용
            -- 2) 변수이름 테이블명%ROWTYPE : 특정 테이블에 속한 행구조 전체 참조
        
        DECLARE
            V_DEPTNO DEPT.DEPTNO%TYPE := 50;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
        END;
        /
        
            DECLARE
            -- V_DEPT_ROW 변수가 DEPT 테이블의 한 행의 구조를 참조
                V_DEPT_ROW DEPT%ROWTYPE;
            BEGIN
                SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
                FROM DEPT
                WHERE DEPTNO = 40;
                
                DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPT_ROW.DEPTNO);
                DBMS_OUTPUT.PUT_LINE('V_DNAME : ' || V_DEPT_ROW.DNAME);
                DBMS_OUTPUT.PUT_LINE('V_LOC : ' || V_DEPT_ROW.LOC);
            END;
            /

            --조건문 : IF, IF~THEN~END IF,
            DECLARE
                V_number NUMBER := 15;
            BEGIN
            --V_NUMBER 홀수, 짝수 구별
            --MOD() : 나머지 구하는 오라클 함수
                IF MOD(V_NUMBER, 2) = 1 THEN 
                  DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수');
                END IF;
            END;
            / 
            
            DECLARE
                V_number NUMBER := 14;
            BEGIN
            --V_NUMBER 홀수, 짝수 구별
            --MOD() : 나머지 구하는 오라클 함수
                IF MOD(V_NUMBER, 2) = 1 THEN 
                    DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('V_NUMBER는 짝수');
                END IF;
            END;
            / 

-- 학점 출력
            DECLARE
                V_number NUMBER := 87;
            BEGIN
                IF V_NUMBER > 90 THEN 
                    DBMS_OUTPUT.PUT_LINE('A 학점');
                ELSIF V_NUMBER > 80 THEN 
                    DBMS_OUTPUT.PUT_LINE('B 학점');
                ELSIF V_NUMBER > 70 THEN 
                    DBMS_OUTPUT.PUT_LINE('C 학점');
                ELSIF V_NUMBER > 60 THEN 
                    DBMS_OUTPUT.PUT_LINE('D 학점');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('F 학점');
                END IF;
            END;
            /
            
            --CASE 문
            DECLARE
                V_number NUMBER := 87;
            BEGIN
                CASE TRUNC(V_NUMBER/10)
                WHEN 10 THEN
                    DBMS_OUTPUT.PUT_LINE('A 학점');
                WHEN 9 THEN
                    DBMS_OUTPUT.PUT_LINE('A 학점');
                WHEN 8 THEN
                    DBMS_OUTPUT.PUT_LINE('B 학점');
                WHEN 7 THEN
                    DBMS_OUTPUT.PUT_LINE('C 학점');
                WHEN 6 THEN
                    DBMS_OUTPUT.PUT_LINE('D 학점');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('F 학점');
                END CASE;
            END;
            /

            DECLARE
                V_number NUMBER := 87;
            BEGIN
                CASE
                WHEN V_NUMBER>90 THEN
                    DBMS_OUTPUT.PUT_LINE('A 학점');
                WHEN V_NUMBER>80 THEN
                    DBMS_OUTPUT.PUT_LINE('B 학점');
                WHEN V_NUMBER>70 THEN
                    DBMS_OUTPUT.PUT_LINE('C 학점');
                WHEN V_NUMBER>60 THEN
                    DBMS_OUTPUT.PUT_LINE('D 학점');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('F 학점');
                END CASE;
            END;
            /
            
            -- 반복문
            -- LOOP ~ END LOOP, WHILE, FOR LOOP, Cusor FOR LOOP
                DECLARE
                    V_NUM NUMBER := 0;
                BEGIN
                    LOOP
                        DBMS_OUTPUT.PUT_LINE('V_NUM : ' || V_NUM);
                        V_NUM := V_NUM+1;
                        EXIT WHEN V_NUM>4;
                    END LOOP;
                END;
                /
                
                DECLARE
                    V_NUM NUMBER := 0;
                BEGIN
                    WHILE V_NUM<4 LOOP
                        DBMS_OUTPUT.PUT_LINE('V_NUM : ' || V_NUM);
                        V_NUM := V_NUM+1;
                    END LOOP;
                END;
                /
                
            -- FOR i IN 시작값..종료값 LOOP
            -- 반복 수행 작업;
            -- END LOOP;
                
                BEGIN
                    FOR i IN 0..4 LOOP
                        DBMS_OUTPUT.PUT_LINE('i: ' || i);
                    END LOOP;
                END;
                /
                
                BEGIN
                    FOR i IN REVERSE 0..4 LOOP
                        DBMS_OUTPUT.PUT_LINE('i: ' || i);
                    END LOOP;
                END;
                /
                
                BEGIN
                    FOR i IN 0..4 LOOP
                        CONTINUE WHEN MOD(i,2) = 1;
                        DBMS_OUTPUT.PUT_LINE('i: ' || i);
                    END LOOP;
                END;
                /
                
                BEGIN
                    FOR i IN 1..10 LOOP
                        CONTINUE WHEN MOD(I,2)=0;
                        DBMS_OUTPUT.PUT_LINE('i: ' || i);
                    END LOOP;
                END;
                /
                
                BEGIN
                    FOR i IN 1..10 LOOP
                        IF MOD(i,2)<>0 THEN DBMS_OUTPUT.PUT_LINE('i: ' || i);
                        END IF;
                    END LOOP;
                END;
                /
                
    -- 커서 : SELECT문 또는 DML같은 SQL문을 실행했을 때 해당 SQL문 처리 정보를 저장한 메모리 공간(포인터)
        -- 명시적 커서
            -- 1) 커서 선언 2) 커서 열기 3) 커서에서 얻어온 데이터 사용 4) 커서 닫기
            
            -- 결과가 단일행인 경우
                DECLARE
                    V_DEPT_ROW DEPT%ROWTYPE;
            -- 커서 선언
                CURSOR C1 IS
                    SELECT DEPTNO, DNAME, LOC
                    FROM DEPT
                    WHERE DEPTNO = 40;
                BEGIN
            -- 커서 열기
                OPEN C1;
            -- 커서에서 얻어온 데이터 사용
                FETCH C1 INTO V_DEPT_ROW;
                    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPT_ROW.DEPTNO);
                    DBMS_OUTPUT.PUT_LINE('V_DNAME : ' || V_DEPT_ROW.DNAME);
                    DBMS_OUTPUT.PUT_LINE('V_LOC : ' || V_DEPT_ROW.LOC);
            -- 커서 닫기
                CLOSE C1;
                END;
                /
                
            -- 결과가 다중행인 경우
                DECLARE
                    V_DEPT_ROW DEPT%ROWTYPE;
            -- 커서 선언
                CURSOR C1 IS
                    SELECT DEPTNO, DNAME, LOC
                    FROM DEPT;
                BEGIN
            -- 커서 열기
                OPEN C1;
            -- 커서에서 얻어온 데이터 LOOP 사용
                LOOP 
                    FETCH C1 INTO V_DEPT_ROW;
                    EXIT WHEN C1%NOTFOUND; 
            -- 루프 탈출 조건 : 커서이름%NOTFOUND => 수행된 FETCH문을 통해 추출된 행이 있으면 FALSE, 없으면 TRUE 반환
                    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPT_ROW.DEPTNO);
                    DBMS_OUTPUT.PUT_LINE('V_DNAME : ' || V_DEPT_ROW.DNAME);
                    DBMS_OUTPUT.PUT_LINE('V_LOC : ' || V_DEPT_ROW.LOC);
                END LOOP;
            -- 커서 닫기
                CLOSE C1;
                END;
                /
                
            -- 결과가 다중행인 경우
                DECLARE
            -- 커서 선언
                CURSOR C1 IS
                    SELECT DEPTNO, DNAME, LOC
                    FROM DEPT;
                BEGIN
            -- 커서에서 얻어온 데이터 FOR LOOP 사용
                -- 커서 + FOR LOOP => OPEN, FETCH, CLOSE 자동
                FOR C1_REC IN C1 LOOP 
                    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || C1_REC.DEPTNO||'  V_DNAME : ' || C1_REC.DNAME||'  V_LOC : ' || C1_REC.LOC);
                END LOOP;
                END;
                /
                
            -- 커서 + 파라미터
                DECLARE
                    V_DEPT_ROW DEPT%ROWTYPE;
            -- 커서 선언
                CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
                    SELECT DEPTNO, DNAME, LOC
                    FROM DEPT
                    WHERE DEPTNO = P_DEPTNO;
                BEGIN
            -- 커서 열기
                OPEN C1(10);
            -- 커서에서 얻어온 데이터 LOOP 사용
                LOOP 
                    FETCH C1 INTO V_DEPT_ROW;
                    EXIT WHEN C1%NOTFOUND; 
                    DBMS_OUTPUT.PUT_LINE('10번 부서 DEPTNO : ' || V_DEPT_ROW.DEPTNO||'  10번 부서 DNAME : ' || V_DEPT_ROW.DNAME||'  10번 부서 LOC : ' || V_DEPT_ROW.LOC);
                END LOOP;
            -- 커서 닫기
                CLOSE C1;
                
                OPEN C1(20);
            -- 커서에서 얻어온 데이터 LOOP 사용
                LOOP 
                    FETCH C1 INTO V_DEPT_ROW;
                    EXIT WHEN C1%NOTFOUND; 
                    DBMS_OUTPUT.PUT_LINE('20번 부서 DEPTNO : ' || V_DEPT_ROW.DEPTNO||'  20번 부서 DNAME : ' || V_DEPT_ROW.DNAME||'  20번 부서 LOC : ' || V_DEPT_ROW.LOC);
                END LOOP;
                
                END;
                /
                
                
                
            -- 커서 + 파라미터는 입력받아서
                DECLARE
                --사용자가 입력한 부서 번호를 저장하는 변수
                    V_DEPTNO DEPT.DEPTNO%TYPE;
                    CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
                        SELECT DEPTNO, DNAME, LOC
                        FROM DEPT
                        WHERE DEPTNO = P_DEPTNO;
                BEGIN

                -- 사용자 입력 : &변수
                
                V_DEPTNO := &INPUT_DEPTNO; -- & 뒤는 입력값에 대한 사용자 안내인듯?

                FOR C1_REC IN C1(V_DEPTNO) LOOP 
                    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || C1_REC.DEPTNO||'  V_DNAME : ' || C1_REC.DNAME||'  V_LOC : ' || C1_REC.LOC);
                END LOOP;
                END;
                /
                
        -- 묵시적 커서 : 별다른 선언 없이 SQL문 사용
            --여러 행의 결과를 가지는 커서는 명시적 커서로만 사용함
            
            -- SQL%NOTFOUND : 묵시적 커서 안에 추출된 행이 있으면 FALSE, 없으면 TRUE 반환
            --                DML 명령어로 영향을 받는 행이 없을 경우에도 TRUE
            
            -- SQL%FOUND : 묵시적 커서 안에 추출된 행이 있으면 TRUE, 없으면 FALSE 반환
            --             영향을 받는 행이 있다면 TRUE
            
            -- SQL%ROWCOUNT : 묵시적 커서에 현재까지 추출한 행 수 또는 DML 명령어로 영향받는 행 수 반환
            
            -- SQL%ISOPEN : 묵시적 커서는 자동으로 SQL문을 실행한 후 CLOSE 되므로 이 속성은 항상 FALSE 반환
            
            BEGIN
                UPDATE DEPT_TEMP SET DNAME = 'DATABASE'
                WHERE DEPTNO = 50;
                
                DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : '||SQL%ROWCOUNT);
                
                IF (SQL%FOUND) THEN 
                DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : TRUE');
                ELSE
                DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : FALSE');
                END IF;
                
                IF (SQL%ISOPEN) THEN 
                DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : TRUE');
                ELSE
                DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : FALSE');
                END IF;
            END;
            /
            
            --예외 처리
                DECLARE
                    V_WRONG NUMBER;
                BEGIN
                    SELECT DNAME INTO V_WRONG
                    FROM DEPT
                    WHERE DEPTNO = 10;
                    
                    DBMS_OUTPUT.PUT_LINE('예외 발생 시 다음 문장은 실행되지 않음');
                EXCEPTION 
                    WHEN VALUE_ERROR THEN 
                        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
                END;
                /
                
                DECLARE
                    V_WRONG NUMBER;
                BEGIN
                    SELECT DNAME INTO V_WRONG
                    FROM DEPT
                    WHERE DEPTNO = 10;
                    DBMS_OUTPUT.PUT_LINE('예외 발생 시 다음 문장은 실행되지 않음');
                EXCEPTION 
                    WHEN TOO_MANY_ROWS THEN 
                        DBMS_OUTPUT.PUT_LINE('예외 처리 : 요구보다 많은 행 추출 오류 발생');
                    WHEN VALUE_ERROR THEN 
                        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
                    WHEN OTHERS THEN 
                        DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류발생');
                END;
                /
                
                DECLARE
                    V_WRONG NUMBER;
                BEGIN
                    SELECT DNAME INTO V_WRONG
                    FROM DEPT
                    WHERE DEPTNO = 10;
                    DBMS_OUTPUT.PUT_LINE('예외 발생 시 다음 문장은 실행되지 않음');
                EXCEPTION 
                    WHEN OTHERS THEN 
                        DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류발생');
                        DBMS_OUTPUT.PUT_LINE('SQLCODE : '||TO_CHAR(SQLCODE));
                        DBMS_OUTPUT.PUT_LINE('SQLERRM : '||SQLERRM);
                END;
                /
            
            -- 명시적 커서를 사용하여 EMP 테이블의 전체 데이터를 조회한 후 데이터를 출력
            
            -- FOR LOOP
            
            DECLARE
            CURSOR C1 IS
            SELECT * FROM EMP;
            
            BEGIN 
                FOR C1_REC IN C1 LOOP
                DBMS_OUTPUT.PUT_LINE(C1_REC.EMPNO||'  '||C1_REC.ENAME||'  '||C1_REC.JOB||'  '||C1_REC.HIREDATE||'  '||C1_REC.SAL||'  '||C1_REC.COMM||'  '||C1_REC.DEPTNO);
                END LOOP;
            END;
                /
                
    -- (저장) 프로시저 : 특정 처리 작업을 수행하는 데 사용(다른 응용 프로그램에서 호출 가능)
        
--        CREATE [OR REPLACE] PROCEDURE 프로시저명
--        IS | AS
--        BEGIN
--            실행부
--        EXCEPTION
--            예외부
--        END;
        
        -- 작성 후 컴파일
            CREATE OR REPLACE PROCEDURE PRO_NOPARAM
            IS
                V_EMPNO NUMBER(4) :=7788;
                V_ENAME VARCHAR2(10);
            BEGIN
                V_ENAME := 'SCOTT';
                DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
                DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
            END;
            /
        
        -- 프로시저 실행
        EXECUTE PRO_NOPARAM;
        
        -- 블록 안에서 실행
        BEGIN 
            PRO_NOPARAM;
        END;
        /
        
        -- 프로시저 삭제
        DROP PROCEDURE PRO_NOPARAM;
        
        -- 파라미터 프로시저
            -- IN(DEFAULT) : 프로시저 호출 시 값을 입력받음
            -- OUT : 프로시저 호출할 때 값 반환
            -- IN OUT : 호출할 때 값을 입력 받은 후 실행 결과 값 반환
            
            CREATE OR REPLACE PROCEDURE PRO_PARAM(PARAM1 IN NUMBER, PARAM2 NUMBER, PARAM3 NUMBER :=3, PARAM4 NUMBER DEFAULT 4)
            IS
                V_ENAME VARCHAR2(10);
            BEGIN
                V_ENAME := 'SCOTT';
                DBMS_OUTPUT.PUT_LINE('PARAM1 : ' || PARAM1);
                DBMS_OUTPUT.PUT_LINE('PARAM2 : ' || PARAM2);
                DBMS_OUTPUT.PUT_LINE('PARAM3 : ' || PARAM3);
                DBMS_OUTPUT.PUT_LINE('PARAM4 : ' || PARAM4);
            END;
            /
            
        EXECUTE PRO_PARAM(1,2);
        
            CREATE OR REPLACE PROCEDURE PRO_PARAM_OUT(IN_EMPNO IN EMP.EMPNO%TYPE, OUT_ENAME OUT EMP.ENAME%TYPE, OUT_SAL OUT EMP.SAL%TYPE)
            IS
            BEGIN
                SELECT ENAME, SAL INTO OUT_ENAME, OUT_SAL
                FROM EMP
                WHERE EMPNO = IN_EMPNO;
            END;
            /
            
        DECLARE
            V_ENAME EMP.ENAME%TYPE;
            V_SAL EMP.SAL%TYPE;
        BEGIN
            PRO_PARAM_OUT(7839,V_ENAME,V_SAL);
            DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
            DBMS_OUTPUT.PUT_LINE('V_SAL : ' || V_SAL);
        END;
        /

    -- 트리거 : 데이터베이스 안의 특정 상황이나 동작, 즉 이벤트가 발생할 경우 자동으로 실행되는 기능 정의
        -- EX) 회원 테이블에서 회원이 삭제가 되면 해당 회원을 다른 테이블로 이동
        
--        CREATE [OR REPLACE] TRIGGER 트리거이름
--        BEFORE | AFTER => 트리거 동작 시점
--        INSERT | UPDATE | DELETE ON 테이블 명 => 때
--        FOR EACH ROW WHEN 조건식 => 선택
--        ENABLE | DISABLE
--        
--        DECLARE
--            선언부
--        BEGIN
--            실행부
--        EXCEPTION
--            예외부
--        END;

            CREATE TABLE EMP_TRG AS SELECT * FROM EMP;
            
            -- EMP_TRG 테이블에 DML 명령어 사용 시 주말일 경우는 DML 명령 실행 취소
            CREATE OR REPLACE TRIGGER TRG_EMP_NODML_WEEKEND
            BEFORE
            INSERT OR UPDATE OR DELETE ON EMP_TRG
            BEGIN
                IF TO_CHAR(SYSDATE, 'DY') IN ('토','일') THEN 
                    IF INSERTING THEN
                        RAISE_APPLICATION_ERROR(-20000,'주말 사원정보 추가 불가');
                    ELSIF UPDATING THEN
                        RAISE_APPLICATION_ERROR(-20001,'주말 사원정보 수정 불가');
                    ELSIF DELETING THEN
                        RAISE_APPLICATION_ERROR(-20002,'주말 사원정보 삭제 불가');
                    ELSE
                        RAISE_APPLICATION_ERROR(-20003,'주말 사원정보 변경 불가');
                    END IF;
                END IF;
            END;
            /
            
            UPDATE EMP_TRG SET SAL = 8000 WHERE EMPNO = 7369;
            
            SELECT * FROM EMP_TRG_LOG;
            
            --로그 기록 테이블
            CREATE TABLE EMP_TRG_LOG (
                TABLENAME VARCHAR2(10),
                DML_TYPE VARCHAR2(10),
                EMPNO NUMBER(4),
                USER_NAME VARCHAR2(30),
                CHANGE_DATE DATE);
            
            -- LOG 기록 트리거
            CREATE OR REPLACE TRIGGER TRG_EMP_LOG
            AFTER
            INSERT OR UPDATE OR DELETE ON EMP_TRG
            FOR EACH ROW 
            BEGIN
                IF INSERTING THEN
                    INSERT INTO EMP_TRG_LOG
                    VALUES ('EMP_TRG','INSERT', :NEW.EMPNO, SYS_CONTEXT ('USERENV','SESSION_USER'),SYSDATE);
                ELSIF UPDATING THEN
                    INSERT INTO EMP_TRG_LOG
                    VALUES ('EMP_TRG','UPDATE', :OLD.EMPNO, SYS_CONTEXT ('USERENV','SESSION_USER'),SYSDATE);
                ELSIF DELETING THEN
                    INSERT INTO EMP_TRG_LOG
                    VALUES ('EMP_TRG','DELETING', :OLD.EMPNO, SYS_CONTEXT ('USERENV','SESSION_USER'),SYSDATE);
                END IF;
            END;
            /
            
            