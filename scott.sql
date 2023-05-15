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
    ename > 'F'
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
SELECT
    empno,
    ename,
    job,
    sal,
    (
        SELECT
            grade
        FROM
            salgrade
        WHERE
            e.sal BETWEEN losal AND hisal
    ) AS salgrade,
    deptno,
    (
        SELECT
            dname
        FROM
            dept
        WHERE
            e.deptno = dept.deptno
    ) AS dname
FROM
    emp e;
    
    --실습1
SELECT
    empno,
    ename,
    job,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 10
    AND job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 30
    );
    
    --실습2
SELECT
    e.*,
    s.grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            upper(job) = 'SALESMAN'
    )
ORDER BY
    empno;

SELECT
    e.*,
    (
        SELECT
            grade
        FROM
            salgrade
        WHERE
            e.sal BETWEEN losal AND hisal
    ) AS salgrade
FROM
    emp e
WHERE
    sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            upper(job) = 'SALESMAN'
    )
ORDER BY
    empno;

SELECT
    e.*,
    s.grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            upper(job) = 'SALESMAN'
    )
ORDER BY
    empno;
    
        -- *DML(DATA MANIPULATION LANGUAGE) : 데이터 INSERT, UPDATE, DELETE, 하는 조작어
        --COMMIT : DML 작업을 데이터베이스에 최종 반영
        --ROLLBACK : DML 작업을 취소
        --SELECT+DML : 자주 사용되는 SQL
        
        --연습용 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

DROP TABLE dept_temp;
        
        -- 열 이름은 선택사항임
        -- INSERT INTO 테이블이름(열이름1, 열이름2, ...)
        -- VALUES(데이터1, 데이터2, ...)
        
        -- DEPT_TEMP 새로운 부서 추가하기
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);
        
        --열 이름 제거할 때
INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);
        
        --INSERT시 오류들
        --이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
--        INSERT INTO dept_temp
--        VALUES(600,'NETWORK','BUSAN');

        --이정도는 자동으로 변환해서 반영해준다
INSERT INTO dept_temp VALUES (
    '60',
    'NETWORK',
    'BUSAN'
);
        
        --값의 수가 충분하지 않습니다
--        INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
--        VALUES(70, 'DATABASE')
        
        --NULL을 삽입하는 방법
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    80,
    'WEB',
    NULL
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    90,
    'MOBILE',
    ''
);      
        --NULL 삽입할 컬럼명을 지정하지 않았음
        --삽입시 전체 컬럼을 삽입하지 않는다면 필드명 기입 필수
INSERT INTO dept_temp (
    deptno,
    dname
) VALUES (
    91,
    'INCHEON'
);
        
       --EMP_TEMP 생성(EMP 테이블만 복사 - 데이터는 복사를 하지 않을 때)
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            100 <> 100;

DROP TABLE emp_temp;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    '홍길동',
    'PRESIDENT',
    NULL,
    '2001/01/01',
    5000,
    1000,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    1111,
    '성춘향',
    'MANAGER',
    9999,
    '2002-01/05',
    4000,
    NULL,
    20
);
        
        --날짜 입력 시 년/월/일 순서 => 일/월/년 삽입 => 그냥하면 오류
--        INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
--        VALUES(2222,'이순신','MANAGER',9999,'07/01/2001',4000,NULL,20);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    2222,
    '이순신',
    'MANAGER',
    9999,
    TO_DATE('07/01/2001', 'DD/MM/YYYY'),
    4000,
    NULL,
    20
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    3333,
    '심봉사',
    'MANAGER',
    9999,
    sysdate,
    4000,
    NULL,
    30
);
        
        --서브쿼리로 INSERT 구현
        --EMP, SALGRADE 테이블을 JOIN 후 급여 등급이 1인 사원만 EMP_TEMP 에 추가

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
             emp
        JOIN salgrade ON sal BETWEEN losal AND hisal
    WHERE
        grade = 1;

SELECT
    *
FROM
    emp_temp;

COMMIT;
        
        --UPDATE : 테이블에 있는 데이터 수정
        
--        UPDATE 테이블명
--        SET 변경할열이름 = 데이터, 변경할열이름 = 데이터..
--        WHERE 변경을 위한 대상 행을 선별하기 위한 조건

SELECT
    *
FROM
    dept_temp;

-- DEPT_TEMP LOC 열의 모든 값을 SEOUL로 변경

UPDATE dept_temp
SET
    loc = 'SEOUL';

ROLLBACK;

--데이터 일부분 수정은 WHERE 사용
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = 40;

UPDATE dept_temp
SET
    dname = 'SALES',
    loc = 'CHICAGO'
WHERE
    deptno = 80;

--EMP_TEMP 사원들 중에서 급여가 2500이하인 사원만 추가수당을 50으로

UPDATE emp_temp
SET
    comm = 50
WHERE
    sal < 2500;

SELECT
    *
FROM
    emp_temp;

--UPDATE에서도 서브쿼리 사용 가능
UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 40
    )
WHERE
    deptno = 40;

SELECT
    *
FROM
    dept_temp;

COMMIT;

        --DELETE : 테이블에 있는 데이터 삭제
        --DELETE 테이블명
        --FROM (선택) 
        --WHERE 삭제 데이터를 선별하기 위한 조건식

CREATE TABLE emp_temp2
    AS
        SELECT
            *
        FROM
            emp;

--JOB이 MANAGER인 사원 삭제

DELETE FROM EMP_TEMP2 WHERE JOB='MANAGER';

SELECT * FROM EMP_TEMP2;

DELETE EMP_TEMP2 WHERE JOB='SALESMAN';

--전체 데이터 삭제

DELETE EMP_TEMP2;

DELETE EMP_TEMP2 
WHERE EMPNO IN (SELECT EMPNO 
                FROM EMP JOIN SALGRADE ON SAL BETWEEN LOSAL AND HISAL AND GRADE=3 AND DEPTNO=30);
                
                COMMIT;


CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

--INSERT INTO EXAM_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
--VALUES
--(7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL,50),
--(7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL,50),
--(7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,NULL,60),
--(7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300,60),
--(7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,NULL,70),
--(7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,NULL,70),
--(7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,NULL,80),
--(7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200,NULL,80);

SELECT * FROM EXAM_EMP;

DELETE EXAM_EMP WHERE ENAME LIKE '%6';

--EXAM_EXP 사원 중 50번 부서에서 근무하는 사원 평균 급여보다 많이 받는 사원들 70번 부서로  이동
UPDATE EXAM_EMP
SET DEPTNO=70
WHERE SAL>(SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO=50);

--EXAM_EMP 사원 중 60번 부서의 사원중 가장 입사일 빠른 사원보다 늦게 입사한 사원 급여 10% 인상
--80번 부서로 이동
UPDATE EXAM_EMP
SET SAL=SAL*1.1, DEPTNO=80
WHERE HIREDATE>(SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO=60);

SELECT * FROM EXAM_EMP;

--EXAM_EMP 사원 중 급여등급 5등급 삭제
DELETE EXAM_EMP
WHERE EMPNO IN (SELECT EMPNO FROM EXAM_EMP JOIN EXAM_SALGRADE ON SAL BETWEEN LOSAL AND HISAL AND GRADE = 5);


--트랜잭션(transaction) : 최소  수행 단위
--트랜잭션 제어하는 구문 TCL(Transaction Control Language) : COMMIT, ROLLBACK

CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;

INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');

UPDATE DEPT_TCL SET LOC='BUSAN' WHERE DEPTNO=40;

DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

SELECT * FROM DEPT_TCL;

--트랜잭션 취소
ROLLBACK;

--트랜잭션 최종 반영
COMMIT;


--세션 : 어떤 활동을 위한 시간이나 기간
--데이터베이스 세션 : 데이터베이스 접속을 시작으로 관련작업 수행한 후 접속 종료까지

DELETE FROM DEPT_TCL WHERE DEPTNO=50;
COMMIT;

UPDATE DEPT_TCL SET LOC='SEOUL' WHERE DEPTNO=30;
COMMIT;

select * from dept_temp;

DELETE FROM DEPT_TEMP WHERE DEPTNO=55;

select * from emp_temp;

insert into emp_temp values(4444,'a','a',1111,sysdate,100,10,99);


-- DDL : 데이터 정의어 (데이터 객체 생성, 수정, 삭제)
-- 1. 테이블 생성
    --CREATE TABLE 테이블명(
    --열이름1 자료형,
    --열이름2 자료형,
    --열이름3 자료형,
    --열이름4 자료형
    --);

    -- 테이블 생성 규칙
        -- 1)테이블 이름은 문자로 시작
        -- 2) 테이블 이름은 30BYTE 이하
        -- 3) 같은 사용자 소유의 테이블 이름은 중복될 수 없음
        -- 4) 테이블 명에 사용할 수 있는 특수문자는 $,#,_ 가능
        -- 5) SQL 키워드(ex. SELECT, FROM, WHERE)는 테이블명에 사용 불가

-- 자료형

    -- 1. 문자형 데이터
        --VARCHAR2(길이) : 가변 길이 문자열 데이터 저장 (최대 4000BYTE)
        --CHAR(길이) : 고정 길이 문자열 데이터 저장
        --NVARCHAR2(길이) : 가변 길이(UNICODE) 데이터 저장
            --NAME VARCHAR2(10) : 영어는 10자, 한글은 3자(한글 1자당 3BYTE이므로)
            --NAME NVARCHAR2(10) : 영어 10자, 한글 10자 까지 입력
    
    -- 2. 숫자형 데이터 
        --NUMBER(전체자릿수,소수점이하자릿수)
    
    -- 3. 날짜형 데이터
        --DATE : 날짜, 시간 저장
        --TIMESTAMP

    -- 4. 기타
        --BLOB : 대용량 이진 데이터 저장 (이미지, 동영상, 소리 등도 가능)
        --CLOB : 대용량 텍스트 데이터 저장
        --JSON : JSON 데이터 저장
        
CREATE TABLE EMP_DDL(
EMPNO NUMBER(4), -- 사번을 총 4자리로 지정하겠음
ENAME VARCHAR2(10), --사원명을 총 10바이트로 지정하겠음
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2), --급여를 전체 자리수로는 7자리, 소수점은 2자리까지
COMM NUMBER(7,2),
DEPTNO NUMBER(2)
);

DESC EMP_DDL;

-- 2. 테이블 수정 - ALTER
    -- 1) 열 추가 : ADD
    ALTER TABLE EMP_TEMP2 ADD HP VARCHAR2(20);

    -- 2) 열 이름 변경 : RENAME
    ALTER TABLE EMP_TEMP2 RENAME COLUMN HP TO TEL;
    
    -- 3) 열 자료형 변경 : MODIFY
    ALTER TABLE EMP_TEMP2 MODIFY EMPNO NUMBER(5);

    -- 4) 특정 열을 삭제 : DROP
    ALTER TABLE EMP_TEMP2 DROP COLUMN TEL;
    
    -- 5) 테이블 명 변경
    RENAME EMP_TEMP2 TO EMP_RENAME;
    
    -- 6) 테이블 데이터 전체 삭제
    DELETE FROM EMP_RENAME;
    SELECT * FROM EMP_RENAME;
    ROLLBACK;

    TRUNCATE TABLE EMP_RENAME; --DDL문은 ROLLBACK 안됨

-- 3. 테이블 삭제
    DROP TABLE EMP_RENAME;


CREATE TABLE MEMBER(
ID CHAR(8),
NAME VARCHAR2(10),
ADDR VARCHAR2(50),
NATION NCHAR(4),
EMAIL VARCHAR2(50),
AGE NUMBER(7,2)
);

ALTER TABLE MEMBER ADD BIGO VARCHAR2(20);

ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;

DESC MEMBER;

INSERT INTO MEMBER VALUES('HONG1234','홍길동','서울시 구로구 개봉동','대한민국','HONG123@NAVER.COM',25,NULL);

DROP TABLE MEMBER;


-- 데이터 베이스 객체
    -- 테이블, 인덱스, 뷰, 데이터 사전, 시퀀스, 시노님, 프로시저, 함수, 패키지, 트리거
    -- 생성 : CREATE, 수정 : ALTER, 삭제 : DROP
    
    -- 1) 인덱스 : 더 빠른 검색을 도와줌
        --       : 사용자가 직접 특정 테이블 열에 지정 가능
        --       : 기본키(혹은 Unique Key)를 생성하면 인덱스로 지정
        -- CREATE INDEX 인덱스이름 ON 테이블명(인덱스로 사용할 열 이름)
        
        -- EMP 테이블의 SAL 열을 인덱스로 지정
        CREATE INDEX IDX_EMP_SAL ON EMP(SAL);
        
        -- SELECT : 검색방식
        -- FULL SCAN
        -- INDEX SCAN
        
        SELECT * FROM EMP WHERE EMPNO=7900;
        
        -- 인덱스 삭제
        DROP INDEX IDX_EMP_SAL;
        
        -- VIEW : 가상 테이블
        -- 편리성 : SELECT 문의 복잡도를 완화하기 위해
        -- 보안성 : 테이블의 특정 열을 노출하고 싶지 않을 때
        
        -- CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW 뷰이름(열이름1, 열이름2, ...)
        -- AS (저장할 SELECT 구문)
        -- [WITH CHECK OPTION]
        -- [WITH READ ONLY]
        
        -- 서브 쿼리를 사용
        SELECT *
        FROM (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=20);
        
        -- VIEW 생성하기
        CREATE VIEW VM_EMP20
        AS (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=20);
        
        -- VIEW 활용하기
        SELECT *
        FROM VM_EMP20;
        
        -- VIEW 삭제
        DROP VIEW VM_EMP20;
        
        -- VIEW 에 INSERT 작업?
        INSERT INTO VM_EMP20 VALUES (8888,'KIM','SALES',20);
        -- VIEW의 참조 원본도 변경이 일어남
        SELECT * FROM EMP;
        
        -- READ ONLY VIEW
        CREATE VIEW VM_EMP_READ
        AS SELECT EMPNO, ENAME, JOB FROM EMP WITH READ ONLY;
        
        -- READ ONLY VIEW 에 INSERT 작업?
        INSERT INTO VM_EMP_READ VALUES(9999,'KIM','SALES');
        --작업 거부


    -- 인라인 뷰 : 일회성으로 만들어서 사용하는 뷰
        -- rownum : 조회된 순서대로 일련번호 매김
        
        SELECT ROWNUM, E.*
        FROM EMP E;
        
        SELECT ROWNUM, E.*
        FROM ( SELECT *
                FROM EMP E
                ORDER BY SAL DESC) E
                WHERE ROWNUM <=3;
                
        -- 시퀀스 : 규칙에 따라 순번 생성
        -- CREATE SEQUENCE 시퀀스이름; (설정 안하는 것들은 다 기본값으로 세팅)
        
--        CREATE SEQUENCE 시퀀스명
--        [INCREMENT BY 숫자] 기본값 1
--        [START WITH 숫자] 기본값 1
--        [MAXVALUE 숫자 | NOMAXVALUE]
--        [MINVALUE 숫자 | NOMINVALUE]
--        [CYCLE | NOCYCLE] cycle인 경우 MAXVALUE에 값이 다다르면 시작값부터 다시 시작
--        [CACHE 숫자 | NOCACHE] 시퀀스가 생성할 번호를 미리 메모리에 할당해 놓음(기본 CACHE 20)
        
        CREATE TABLE DEPT_SEQUENCE AS SELECT * FROM DEPT WHERE 1<>1;
        
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 0
NOCYCLE
CACHE 2;
        
-- 시퀀스 사용 : 시퀀스이름.CURRVAL, 시퀀스이름.NEXTVAL

-- 부서번호 입력시 시퀀스 사용
INSERT INTO DEPT_SEQUENCE(DEPTNO, DNAME, LOC)
VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
-- NO CYCLE 옵션 선택했기 때문에 90에 도달하면 다시 0으로 안가고 에러 팝업

SELECT * FROM DEPT_SEQUENCE;

--시퀀스 삭제
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 3
START WITH 10
MAXVALUE 99
MINVALUE 0
CYCLE
CACHE 2;

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE','SEOUL');

-- SYNONYM(동의어) : 테이블, 뷰, 시퀀스 등 객체 이름 대신 사용할 수 있는 다른 이름을 부여하는 객체

-- EMP 테이블의 별칭을 E로 지정
CREATE SYNONYM E FOR EMP;

-- PUBLIC : 동의어를 데이터베이스 내 모든 사용자가 사용할 수 있도록 설정
-- CREATE [PUBLIC] SYNONYM E FOR EMP;

SELECT * FROM EMP;
SELECT * FROM E;

DROP SYNONYM E;

CREATE TABLE EMPIDX AS SELECT * FROM EMP;

DROP TABLE EMPIDX;

CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);

SELECT * FROM USER_INDEXES;

CREATE VIEW EMPIDX_OVER15K
AS (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, COMM FROM EMP WHERE SAL>1500);

CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT WHERE 1<>1;

CREATE SEQUENCE SEQ_DEPTSEQ_SEQUENCE
INCREMENT BY 1
START WITH 1
MAXVALUE 99
MINVALUE 1
NOCYCLE
CACHE 2;

-- 제약 조건 : 테이블의 특정 열에 지정
    -- NULL 허용/불허용, 유일한 값, 조건식을 만족하는 데이터만 입력 가능...
    -- 데이터 무결성(데이터 정확성, 일관성 보장) 유지
    -- 영역 무결성, 개체 무결성, 참조 무결성
    -- 테이블 생성 시 제약조건 지정, OR 생성 후에 ALTER를 통해 추가, 변경 가능
    
    -- 1) not null : null값 허용 불가
        CREATE TABLE TABLE_NOTNULL(
        LOGIN_ID VARCHAR2(20) NOT NULL,
        LOGIN_PWD VARCHAR2(20) NOT NULL,
        TEL VARCHAR2(20)
        );

insert INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD) VALUES('HONG123','HONG123');

SELECT * FROM TABLE_NOTNULL;

insert INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD,TEL) VALUES('HONG123',NULL,'010-1234-4444');
    
SELECT * FROM USER_CONSTRAINTS;

    -- 제약조건 + 제약조건 이름 지정
        CREATE TABLE TABLE_NOTNULL2(
        LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LOGIN_NN NOT NULL,
        LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGPWD_NN NOT NULL,
        TEL VARCHAR2(20)
        );
        
    -- 생성한 테이블에 제약조건 추가
    ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL);
    ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL CONSTRAINT TBLNN2_TEL_NN NOT NULL);
    
    SELECT * FROM TABLE_NOTNULL;
    
    UPDATE TABLE_NOTNULL
    SET TEL = '010-1234-5678'
    WHERE LOGIN_ID = 'HONG123';
    
    ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT TBLNN2_TEL_NN TO TBLNN3_TEL_NN;
    
    ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBLNN3_TEL_NN;
    
    -- 2) UNIQUE : 중복되지 않는 값
        -- 아이디, 전화번호
        
CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
    );
    
    insert INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD,TEL) VALUES(null,'HONG123','010-1234-1234');
    
    delete TABLE_UNIQUE where login_id is null;
    
    SELECT * FROM TABLE_UNIQUE;
    
    -- 테이블 생성 제약조건 지정, 변경, 삭제 NOT NULL 형태와 동일함
    
    -- 3) Primary Key (PK) : UNIQUE + NOT NULL
        CREATE TABLE TABLE_PRIMARY(
        LOGIN_ID VARCHAR2(20) PRIMARY KEY,
        LOGIN_PWD VARCHAR2(20) NOT NULL,
        TEL VARCHAR2(20)
        );
    
    -- PRIMARY KEY => INDEX 자동 생성 됨
        SELECT * FROM USER_INDEXES;
    
    INSERT INTO TABLE_PRIMARY(LOGIN_ID, LOGIN_PWD,TEL) VALUES('HONG123','HONG123','010-1234-1234');
    
    -- 4) 외래 키 : Foreign Key (FK) : 다른 테이블 간 관계를 정의하는데 사용
        -- 특정 테이블에서 PRIMARY KEY 제약조건을 지정한 열을 다른 테이블의 특정 열에서 참조
        
        -- 사원 추가시 부서 번호 입력을 해야 하는 경우 => DEPT 테이블의 DEPTNO만 삽입
        
        -- 부모 테이블
        CREATE TABLE DEPT_fk(
        DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13)
        );
        
        -- 자식 테이블
        --REFERENCES 참조할테이블명(참조할 열) : 외래키
        CREATE TABLE EMP_FK(
        EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));
        
        INSERT INTO EMP_FK VALUES(1000,'TEST','SALES',10);
        
        -- 외래키 제약 조건
        -- 부모 테이블 데이터가 데이터 먼저 입력
        
        -- 삭제 시
        -- 자식 테이블 데이터 먼저 삭제
        -- 부모 테이블 데이터 삭제
        
        INSERT INTO DEPT_FK VALUES(10,'DATABASE','SEOUL');
        
        DELETE FROM DEPT_FK WHERE DEPTNO=10;
        
        --외래 키 제약조건 옵션
        -- ON DELETE CASCADE : 부모가 삭제되면 부모를 참조하는 자식 레코드도 같이 삭제
        -- ON DELETE SET NULL : 부모가 삭제되면 부모를 참조하는 자식 레코드의 값을 NULL로 변경
        
        CREATE TABLE DEPT_fk2(
        DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK2 PRIMARY KEY,
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13)
        );
        
        CREATE TABLE EMP_FK2(
        EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK2 PRIMARY KEY,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK2 REFERENCES DEPT_FK2(DEPTNO) ON DELETE CASCADE);
        
        INSERT INTO DEPT_FK2 VALUES(10,'DATABASE','SEOUL');
        INSERT INTO EMP_FK2 VALUES(1000,'TEST','SALES',10);
        
        DELETE FROM DEPT_FK2 WHERE DEPTNO=10;
        
        -- 5) CHECK : 열에 지정할 수 있는 값의 범위 또는 패턴 지정
            -- 비밀번호는 6자리 이상 같은거
        CREATE TABLE TABLE_CHECK(
        LOGIN_ID VARCHAR2(20) PRIMARY KEY,
        LOGIN_PWD VARCHAR2(20) CHECK (LENGTH(LOGIN_PWD)>3),
        TEL VARCHAR2(20)
        );
        
        INSERT INTO TABLE_CHECK VALUES('TEST','1234','010-123-5678');
        
        -- 6) DEFAULT : 기본값 지정
        CREATE TABLE TABLE_DEFAULT(
        LOGIN_ID VARCHAR2(20) PRIMARY KEY,
        LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
        TEL VARCHAR2(20)
        );
        
        INSERT INTO TABLE_DEFAULT VALUES('TEST',NULL,'010-123-5678');
        INSERT INTO TABLE_DEFAULT(LOGIN_ID,TEL) VALUES('TEST1','010-123-5678');
        
        SELECT * FROM TABLE_DEFAULT;
