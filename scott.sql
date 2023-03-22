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
    empno           사번,
    job             "직 책",
    ename           사원명,
    sal,
    comm,
    sal * 12 + comm annsal
FROM
    emp;
    
    
--    8. 정렬 : ORDER BY : 기본 오름차순 정렬
--              내림차순 -> DESC  오름차순 -> ASC
-- ENAME, SAL 열 추출하고, SAL 내림차순으로 정렬

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;
    
--    전체 내용 출력하고, 결과가 사원번호의 오름차순
SELECT
    *
FROM
    emp
ORDER BY
    empno;
    
    -- 결과가 부서번호의 오름차순과 급여의 내림차순으로 정렬
SELECT
    *
FROM
    emp
ORDER BY
    deptno,
    sal DESC;
    
    -- [실습] EMP 테이블의 모든 열 출력
    -- EMPNO => EMPLOYEE_NO
    -- ENAME => EMPLOYEE_NAME
    -- MGR => MANAGER
    -- SAL => SALARY
    -- COMM => COMMISSION
    -- DEPTNO => DEPARTMENT_NO

DESC EMP;

SELECT
    empno  employee_no,
    ename  employee_name,
    mgr    manager,
    sal    salary,
    comm   commission,
    deptno department_no
FROM
    emp
ORDER BY
    deptno DESC,
    ename;
    
    -- 9. 조건 : WHERE : 특정 조건을 기준으로 원하는 행을 조회
    -- 부서번호가 30인 데이터만 조회

SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    empno > 7000;

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
    
    --산술연산자 : +, -, *, /    MOD(오라클기능)
    --비교연산자 : >, <, <=, >=
    --등가비교연산자 : =, !=, <>, ^= (뒤에 3개 같은 기능. 다르면 TRUE 같으면 FALSE)
    --논리부정연산자 : NOT
    --IN 연산자
    --BETWEEN A AND B 연산자
    --LIKE 연산자와 와일드 카드(_,%)
    --IS NULL 연산자
    --집합연산자 : UNION(합집합-중복제거), UNION ALL(합집합-중복포함), MINUS(차집합), INTERSECT(교집합)
    
    
    
-- EMP 테이블에서 급여 열에 12를 곱한 값이 36000인 행을 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

--ENAME이 F 이후의 문자로 시작하는 사람 조회
--문자 표현 : ''만 사용한다
SELECT
    *
FROM
    emp
WHERE
    ename >= 'FORC'
ORDER BY
    ename;

-- JOB이 MANAGER 혹은 SALESMAN
SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN';

--SAL 이 3000이 아닌 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

--JOB이 MANAGER, SALESMAN, CLERK 인 사원 조회 -> IN 연산자
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job^= 'SALESMAN'
    AND job <> 'CLERK';

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );
    
    --급여가 2000이상 3000이하인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
    
        --LIKE 연산자와 와일드카드(_,%)
    --사원 이름이 S로 시작하는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';
    
    --사원 이름의 두번째 글자가 L 인 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';
    
    --사원 이름에 AM이 포함된 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';
    
    --사원 이름에 AM이 포함되지 않은 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';
    
    -- NULL : 데이터 값이 완전히 비어 있는 상태

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;
    
    --집합연산자
    
    --UNION, UNION ALL : UNION이 합집합, UNION ALL은 그냥 다 때려넣기

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN'
ORDER BY
    sal DESC;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000;

SELECT
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;

SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    
    --오라클 함수
-- 오라클에서 기본으로 제공하는 내장 함수와 사용자가 필요에 의해 직접 정의한 사용자 정의 함수

-- 1. 문자열 함수 (VARCHAR2에 사용)

-- 1) UPPER, LOWER, INITCAP -> 검색시 많이 사용
SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    upper(ename) LIKE upper('%FORD%');
    
    -- 2) LENGTH : 문자열 길이
SELECT
    ename,
    length(ename)
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    length(ename) >= 5;
    
    --한글일 때
    --DUAL : SYS가 소유하는 테이블 - 임시 연산이나 함수 결과값 확인 용도
SELECT
    length('한글'),
    lengthb('한글'),
    lengthb('AB')
FROM
    dual;
    
    --3) SUBSTR(문자열데이터, 시작위치, 추출길이) : 추출길이 생략 가능
    --   문자열 일부 추출

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5),
    substr(job, - 3)
FROM
    emp;

SELECT
    ename,
    substr(ename, 3) from3
FROM
    emp;
    
    -- 4) INSTR : 문자열 데이터 안에서 특정 문자 위치 찾기
    -- INSTR (대상문자열, 찾으려는 문자열, 찾기를 시작할 위치(선택),  몇 번째 문자를 찾으려는지(선택))

SELECT
    instr('HELLO ORACLE!', 'L')       instr_1,
    instr('HELLO ORACLE!', 'L', 5)    instr_2,
    instr('HELLO ORACLE!', 'L', 2, 2) instr_3
FROM
    dual;
    
    -- 5) REPLACE : 특정 문자를 다른 문자로 변경
    -- REPLACE(문자열데이터, 찾는문자, 변경문자)
SELECT
    '010-1234-5678',
    replace('010-1234-5678', '-', ' ') replace1,
    replace('010-1234-5678', '-', '')  replace2
FROM
    dual;

SELECT
    replace('이것이 ORACLE이다', '이것이', 'THIS IS') replace
FROM
    dual;
    
    --6) CONCAT : 두 문자열 데이터 합치기
SELECT
    concat(concat(empno, ' - '),
           ename)
FROM
    emp;
    
    --7) || : 문자열 연결 연산자
SELECT
    empno
    || ' - '
    || ename
    || ' 네개'
FROM
    emp;
    
    --8) TRIM, LTRIM, RTRIM : 공백 포함 특정 문자 제거
SELECT
    '     이것이      ',
    TRIM('     이것이      '),
    rtrim('     이것이      '),
    ltrim('     이것이      ')
FROM
    dual;
    
    -- 2. 숫자함수
    --1) ROUND, TRUNC, CEIL, FLOOR, MOD(나머지)

    --ROUND(숫자, 반올림 위치(선택))
SELECT
    round(1234.5678)      round,
    round(1234.5678, 0)   round0,
    round(1234.5678, 1)   round1,
    round(1234.5678, 2)   round2,
    round(1234.5678, - 1) round_minus1,
    round(1234.5678, - 2) round_minus2
FROM
    dual;
    
    --TRUNC : 특정 위치에서 버리는 함수   
        --TRUNC(숫자, 버림 위치(선택))
SELECT
    trunc(1234.5678)      trunc,
    trunc(1234.5678, 0)   trunc0,
    trunc(1234.5678, 1)   trunc1,
    trunc(1234.5678, 2)   trunc2,
    trunc(1234.5678, - 1) trunc_minus1,
    trunc(1234.5678, - 2) trunc_minus2
FROM
    dual;
    
    --CEIL(숫자) FLOOR(숫자) : 입력된 숫자와 가까운 큰 정수, 작은 정수

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;
    
    --MOD(나눠지는 수,나누는 수)

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;
    
    --3. 날짜 함수
    -- 날짜 데이터+숫자 : 날짜 데이터보다 숫자만큼 일 수 이후의 날짜
    -- 날짜 데이터 - 날짜 데이터 : 두 날짜 데이터간의 일 수 차이
    
    -- 날짜 데이터 + 날짜 데이터 : 연산 불가능
    
    -- 1) SYSDATE 함수 : 오라클 데이터베이스 서버가 설치된 OS의 현재날짜와 시간을 가져옴
SELECT
    sysdate,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual; 
    
    -- ADD_MONTHS(날짜, 더할 개월 수) : 몇 개월 이후 날짜 구하기
SELECT
    sysdate,
    add_months(sysdate, 2)
FROM
    dual;
    
    --입사 50주년 되는 날짜 구하기
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 600) AS "FIFTYTH"
FROM
    emp;
    
    --3) MONTHS_BETWEEN(첫 번째 날짜, 두 번째 날짜) : 두 날짜 데이터 간의 날짜 차이를 개월수로 계산하여 출력
    --입사 45년 미만인 사원 데이터 조회
SELECT
    empno,
    ename,
    hiredate
FROM
    emp
WHERE
    months_between(hiredate, sysdate) < 540;
    
    --현재 날짜와 6개월 후 날짜가 출력되도록
SELECT
    sysdate,
    add_months(sysdate, 6)
FROM
    dual;

SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(hiredate, sysdate)        AS months1,
    months_between(sysdate, hiredate)        AS months2,
    trunc(months_between(hiredate, sysdate)) AS months3
FROM
    emp;
    
    -- 4) NEXT_DAY(날짜, 요일) : 특정 날짜를 기준으로 돌아오는 요일의 날짜를 출력
    --  LAST_DAY(날짜) : 특정 날짜가 속한 달의 마지막 날짜를 출력
SELECT
    sysdate,
    next_day(sysdate, '금요일'),
    last_day(sysdate)
FROM
    dual;

    -- 날짜의 반올림, 버림 : ROUND, TRUNC
    -- CC : 네 자리 연도의 끝 두자리를 기준으로 사용 EX) 2023년 -> 2050년이 되지 않으므로 -> 2001년 
SELECT
    sysdate,
    round(sysdate, 'CC')   AS format_cc,
    round(sysdate, 'YYYY') AS format_yyyy,
    round(sysdate, 'DDD')  AS format_ddd,
    round(sysdate, 'HH')   AS format_hh
FROM
    dual;
    
    -- 4. 형변환 함수 : 자료형을 형 변환
    -- NUMBER, VARCHAR2, DATE

SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'FORD';

SELECT
    empno,
    ename,
    'abcd' + empno
FROM
    emp
WHERE
    ename = 'FORD';
    
    -- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
    -- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
    -- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
    
    -- 원하는 출력 형태로 날짜 출력하기 TO_CHAR 주로 사용됨
    
    -- MON, MONTH : 월 이름
    -- DDD : 올해 며칠째인지
SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간,
    to_char(sysdate, 'YYYY')                  AS 현재연도,
    to_char(sysdate, 'MM')                    AS 현재월,
    to_char(sysdate, 'MON')                   AS 현재월,
    to_char(sysdate, 'MONTH')                 AS 현재월,
    to_char(sysdate, 'DD')                    AS 현재일자,
    to_char(sysdate, 'DDD')                   AS 현재일자,
    to_char(sysdate, 'PM HH24:MI:SS')         AS 현재날짜시간
FROM
    dual;
    
    --SAL 필드에 ,나 통화 표시를 하고 싶다면?
SELECT
    sal,
    to_char(sal, '$999,999'),
    to_char(sal, 'L999,999')
FROM
    emp;
    
    --TO_NUMBER(문자열 데이터, 인식될 숫자 형태)
SELECT
    1300 - '1500',
    '1300' - 1500
FROM
    dual;

SELECT
    '1300' - '1500',
    TO_NUMBER('1300') - TO_NUMBER('1,500', '999,999')
FROM
    dual;
    
    -- 3) TO_DATE(문자열데이터, '인식될 날짜 형태')
SELECT
    TO_DATE('2019-07-14', 'YYYY-MM-DD') AS todate1,
    TO_DATE('20190714', 'YYYY-MM-DD')   AS todate2
FROM
    dual;

SELECT
    '2023-03-21' - '2023-02-01' -- 날짜데이터로 인식되지 않음
FROM
    dual;

SELECT
    TO_DATE('2023-03-21') - TO_DATE('2023-02-01') -- 날짜데이터로 인식
FROM
    dual;
    
    -- NULL 처리 함수
    -- NULL + 300 => NULL
    
    -- NVL(데이터, 널일 경우 반환할 데이터)

SELECT
    empno,
    ename,
    sal,
    nvl(comm, 0)       AS comm,
    sal + nvl(comm, 0) AS "ANNSAL"
FROM
    emp;
    
    -- NVL2(데이터, 널이 아닐경우 반환할 데이터, 널일 경우 반환할 데이터)

SELECT
    empno,
    ename,
    sal,
    nvl2(comm, 'O', 'X')                        AS comm,
    sal + nvl2(comm, sal * 12 + comm, sal * 12) AS "ANNSAL"
FROM
    emp;
    
    -- DECODE 함수 / CASE 문
    
    -- DECODE(검사 대상이 될 데이터, 조건1, 조건1이 일치할 때 실행할 구문, 조건2(선택), ...)
    
    -- EMP 테이블에서 직책이 MANAGER인 사람은 급여의 10% 인상, SALESMAN인 사람은 5%, ANALYST인 사람은 그대로, 나머지는 3% 인상
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS raised
FROM
    emp;
    
    -- CASE 문
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS raised
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당 없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
    END AS comm_text
FROM
    emp;

SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 1) AS day_pay,
    round(sal / 21.5, 1) AS time_pay
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    to_char(next_day(add_months(hiredate, 3),
                     '월요일'),
            'YYYY-MM-DD') AS r_job,
    nvl2(comm,
         to_char(comm),
         'N/A')           AS comm
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr),
                  1,
                  2),
           NULL,
           '0000',
           '75',
           '5555',
           '76',
           '6666',
           '77',
           '7777',
           '78',
           '8888',
           mgr) AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN to_char(mgr) LIKE '75%' THEN
            '5555'
        WHEN to_char(mgr) LIKE '76%' THEN
            '6666'
        WHEN to_char(mgr) LIKE '77%' THEN
            '7777'
        WHEN to_char(mgr) LIKE '78%' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;
    
        
    --6. 다중행(ROW) 함수
--    SELECT
--    ENAME 이건 여러 행이 나오는데, SUM(SAL) 이건 단일결과값으로 나오니 오류가 발생한다.
--    FROM EMP;

SELECT
    SUM(DISTINCT sal),
    SUM(ALL sal),
    SUM(sal)
FROM
    emp;

SELECT
    SUM(comm)
FROM
    emp;

SELECT
    COUNT(*)
FROM
    emp
WHERE
    deptno = 30;
    
    --MAX
SELECT
    MAX(sal)
FROM
    emp;

SELECT
    MAX(hiredate)
FROM
    emp;
    
    --MIN
    
    --AVG
SELECT
    round(AVG(sal),
          - 1)
FROM
    emp
WHERE
    deptno = 30;
    
    --GROUP BY : 결과 값을 원하는 열로 묶어 출력
    --부서별 SAL의 평균 구하기

SELECT
    round(AVG(sal),
          - 1) AS 평균연봉,
    deptno
FROM
    emp
GROUP BY
    deptno;

SELECT
    AVG(comm),
    deptno
FROM
    emp
GROUP BY
    deptno;
    
    --GROUP BY + HAVING : GROUP BY 절에 조건을 줄 때
    
    --각 부서의 직책별 평균 급여 구하기(단, 평균 급여가 2000 이상인 그룹만 출력)

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    sal <= 3000
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) > 2000
ORDER BY
    deptno,
    job;
    
    --실습1
SELECT
    deptno,
    trunc(AVG(sal),
          0),
    MAX(sal),
    MIN(sal),
    COUNT(deptno)
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno DESC;
    
    --실습2
SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;
    
    --실습3
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)
FROM
    emp
GROUP BY
    deptno,
    to_char(hiredate, 'YYYY')
ORDER BY
    COUNT(*),
    deptno;
    
    -- 조인 : 여러 테이블을 하나의 테이블처럼 사용
    -- 1) 내부 조인 (inner join) - 여러 개의 테이블에서 공통된 부분만 추출
    -- 2) 외부 조인 (outer join)
    --  1. LEFT OUTER JOIN
    --  2. RIGHT OUTER JOIN
    --  3. FULL OUTER JOIN
    
        --DEPT - 4ROW, EMP - 12ROW = RESULT 48ROW
SELECT
    *
FROM
    emp,
    dept
ORDER BY
    empno;

    -- INNER JOIN
SELECT
    empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal >= 3000;
    
    --SQL 99 표준
SELECT
    empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal <= 3000;

SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal <= 2500
    AND e.empno <= 9999;

SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.sal <= 2500
    AND e.empno <= 9999;
    
    --EMP SALGRADE 조인
    -- EMP 테이블의 SAL이 SALGRADE의 LOSAL과 HISAL 범위에 들어가는 형태로 조인
SELECT
    *
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal;

SELECT
    *
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

    --SELF JOIN

SELECT
    e1.*,
    e2.ename AS mgrname
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;
    
    --OUTER JOIN
    --1) LEFT OUTER JOIN -- 부가데이터에 (+)표시. 왼쪽을 기준으로, 왼쪽의 값은 일치 안되어도 다 표기
SELECT
    e1.*,
    e2.ename AS mgrname
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);

SELECT
    e1.*,
    e2.ename AS mgrname
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;
    
        --2) RIGHT OUTER JOIN -- 부가데이터에 (+)표시. 오른쪽을 기준으로, 오른쪽의 값은 일치 안되어도 다 표기
SELECT
    e1.*,
    e2.ename AS mgrname
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;

SELECT
    e1.*,
    e2.ename AS mgrname
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;
    
    --3) FULL OUTER JOIN
SELECT
    e1.*,
    e2.ename AS mgrname
FROM
    emp e1
    FULL OUTER JOIN emp e2 ON e1.mgr = e2.empno;
    
    --연결해야 할 테이블이 세개일 때
--    SELECT *
--    FROM TABLE1 T1, TABLE2 T2, TABLE3 T3
--    WHERE T1.EMPNO = T2.EMPNO AND T2.DEPTNO = T3.DEPTNO;
--    
--        SELECT *
--    FROM TABLE1 T1 JOIN TABLE2 T2 ON T1.EMPNO = T2.EMPNO JOIN TABLE3 T3 ON T2.DEPTNO = T3.DEPTNO;

--실습1
SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal > 2000
ORDER BY
    deptno;

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal > 2000
ORDER BY
    deptno;

--실습2
SELECT
    d.deptno,
    dname,
    round(AVG(sal),
          0) AS avg_sal,
    MAX(sal) AS max_sal,
    MIN(sal) AS min_sal,
    COUNT(*) AS cnt
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY
    d.deptno,
    dname
ORDER BY
    deptno;

SELECT
    d.deptno,
    dname,
    round(AVG(sal),
          0) AS avg_sal,
    MAX(sal) AS max_sal,
    MIN(sal) AS min_sal,
    COUNT(*) AS cnt
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    dname
ORDER BY
    deptno;

--실습3
SELECT
    d.deptno,
    dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
FROM
    emp  e,
    dept d
WHERE
    e.deptno (+) = d.deptno
ORDER BY
    deptno,
    empno;

SELECT
    d.deptno,
    dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
FROM
    emp  e
    RIGHT OUTER JOIN dept d ON e.deptno = d.deptno
ORDER BY
    deptno,
    empno;

-- SUBQUERY
-- SQL문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 SQL문 내부에서 사용하는 SELECT문

--SELECT 조회할 열
--FROM 테이블명
--WHERE 조건식(SELECT 조회할 열 FROM 테이블 WHERE 조건식);

--존스의 급여보다 높은 급여를 받는 사람 조회
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            upper(ename) = 'JONES'
    );

SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            upper(ename) = 'ALLEN'
    );

SELECT
    *
FROM
    emp
WHERE
    hiredate > (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            upper(ename) = 'WARD'
    );

--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보 및 부서정보 조회
SELECT
    empno,
    ename,
    job,
    sal,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 20
    AND sal <= (
        SELECT
            AVG(sal)
        FROM
            emp
    );

--단일행 서브쿼리 : 서브쿼리 결과로 하나의 행 반환
-- 연산자들 허용됨

--다중행 서브쿼리 : 서브쿼리 결과로 여러개의 행 반환
--IN, ANY(SOME), ALL, EXISTS 연산자 허용(단일쿼리에 쓰는 연산자는 사용 안됨)

--각 부서별 최고 급여와 동일한 급여를 받는 사원정보 조회
--IN : 메인쿼리 결과가 서브쿼리 결과 중 하나라도 일치하면 TRUE
SELECT
    *
FROM
    emp
WHERE
    sal IN (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );
    
    --ANY / SOME : 메인 쿼리 결과가 서브쿼리 결과 중 하나라도 조건 일치한다면 TRUE
    --30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 정보 조회

SELECT
    *
FROM
    emp
WHERE
    sal < ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

SELECT
    *
FROM
    emp
WHERE
    sal < SOME (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
    
    -- 이 결과는 단일행 쿼리로도 작성할 수 있다.
SELECT
    *
FROM
    emp
WHERE
    sal < (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            deptno = 30
    );
    
    --단일행
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            MIN(sal)
        FROM
            emp
        WHERE
            deptno = 30
    );
    --다중행
SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
    
    --ALL : 서브쿼리의 모든 조건에 맞아 떨어질 때만 TRUE
SELECT
    *
FROM
    emp
WHERE
    sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

    --EXISTS : 서브 쿼리에 결과값이 하나 이상 존재하면 조건식이 모두 TRUE, 존재하지 않으면 FALSE
SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 10
    );

SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 50
    );

--실습1
SELECT
    e.job,
    e.empno,
    e.ename,
    e.sal,
    e.deptno,
    d.dname
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    job = (
        SELECT
            job
        FROM
            emp
        WHERE
            upper(ename) = 'ALLEN'
    );

SELECT
    empno,
    ename,
    dname,
    hiredate,
    d.loc,
    sal,
    g.grade
FROM
         emp e
    JOIN dept     d ON e.deptno = d.deptno
    JOIN salgrade g ON e.sal BETWEEN g.losal AND g.hisal
WHERE
    sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    )
ORDER BY
    sal DESC,
    empno;

        --3) 다중열 서브쿼리 : 서브 쿼리의 SELECT 열에 비교할 데이터를 여러 개 지정
SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );
    
        --4) FROM절에 사용하는 서브쿼리 (인라인 뷰) : 테이블 규모가 너무 클 때 / 불필요한 열이 많을 때

SELECT
    e10.empno,
    e10.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;
            --차이점 : FROM이 읽어오는 데이터량이 줄어들어서, 효율적 처리 가능
SELECT
    e10.empno,
    e10.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    emp e10,
    (
        SELECT
            *
        FROM
            dept
    )   d
WHERE
        e10.deptno = 10
    AND e10.deptno = d.deptno;
    
    --SELECT 절에 사용하는 서브쿼리(스칼라 서브쿼리)
    --SELECT 절에 사용하는 서브쿼리는 반드시 하나의 결과만 반환해야 함
    SELECT EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
    DEPTNO, 
    (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
    FROM EMP E;
    
    --실습1
    SELECT EMPNO, ENAME, JOB, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
    WHERE E.DEPTNO = 10 AND JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO=30);
    
    --실습2
    SELECT E.*, S.GRADE
    FROM EMP E JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    WHERE SAL>(SELECT MAX(SAL) FROM EMP WHERE UPPER(JOB) = 'SALESMAN')
    ORDER BY EMPNO;
    
    SELECT E.*, (SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE
    FROM EMP E
    WHERE SAL>(SELECT MAX(SAL) FROM EMP WHERE UPPER(JOB) = 'SALESMAN')
    ORDER BY EMPNO;
    
        SELECT E.*, S.GRADE
    FROM EMP E JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    WHERE SAL>ALL(SELECT SAL FROM EMP WHERE UPPER(JOB) = 'SALESMAN')
    ORDER BY EMPNO;