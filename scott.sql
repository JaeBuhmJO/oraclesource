--scott

--DESC EMP: describe : 테이블 EMP(EMPLOYEE)의 구성 보기
--필드명(열 이름)   제약조건   데이터타입
--EMPNO(사원번호)  NOT NULL   NUMBER(4)
--ENAME(사원명), JOB(직책), MGR(직속상관 번호)
--HIREDATE(입사일),SAL(급여),COMM(수당),DEPTNO(부서번호)
--NUMBER : 소수점 자릿수를 포함해서 지정 가능한 숫자
--NUMBER(4) : 4자리 숫자까지 허용, NUMBER(8,2) : 전체 자릿수는 8자리이고 소수점 2자리 포함
--VARCHAR2(10) : 가변형 문자열 저장, 10바이트까지 저장 가능
--DATE : 날짜형 저장

DESC EMP;
--DNAME(부서명), LOC(부서위치)
DESC DEPT;
-- GRADE(급여 등급), LOSAL(최소급여액), HISAL(최대급여액)
DESC SALGRADE;

--select : 데이터 조회
--조회 방식 : 셀렉션(행 단위로 조회), 프로젝션(열 단위로 조회), 조인(두 개 이상의 테이블을 사용하여 조회)
--SELECT 열이름1 열이름2... (조회할 열이 전체라면 * 입력)
--FROM 테이블명;

-- 1. EMP 테이블의 전체 열을 조회
SELECT
    *
FROM
    emp;

-- 2. EMP 테이블에서 사원번호, 이름, 급여 열을 조회
SELECT
    empno,
    ename,
    sal
FROM
    emp;

SELECT
    *
FROM
    emp;

-- 3. DEPT 테이블 전체 조회
DESC DEPT

SELECT
    *
FROM
    dept;

-- 4. DEPT 테이블 안에 부서번호, 지역만 조회
SELECT
    loc,
    deptno
FROM
    dept;
    
-- 5. EMP 테이블 안의 부서번호
SELECT
    deptno
FROM
    emp;
    
-- 6. EMP 테이블 안의 중복되지 않은 부서번호 - SELECT DISTINCT
-- 열이 여러개인 경우 모든 열의 정보가 동일해야 중복으로 판단함
SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
-- 7. 연산
-- 각 사원의 1년간 급여 총합 구하기 - SALARY*12+COMMISION
-- SELECT 필드명BLANK별칭
-- 별칭에 공백을 줄거라면 묶어야함
SELECT
    empno,
    ename,
    sal * 12 + comm AS annsal
FROM
    emp;
    
SELECT
    empno 사번,
    JOB "직 책",
    ename 사원명,
    sal * 12 + comm annsal
FROM
    emp