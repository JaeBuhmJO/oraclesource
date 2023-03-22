--EMPLOYEE 테이블 전체 내용 조회
DESC EMPLOYEES;

SELECT
    *
FROM
    employees;


--EMPLOYEE 테이블 FIRST_NAME, LAST_NAME, JOB_ID 만 조회
SELECT
    first_name 이름,
    last_name  성,
    job_id
FROM
    employees;

-- 사원번호가 176인 사람의 LAST_NAME 조회
SELECT
    last_name
FROM
    employees
WHERE
    employee_id = 176;
    
    --연봉이 12000 이상 되는 직원들의 LAST_NAME, SALARY 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary > 12000;
    
    --연봉이 5000에서 12000 범위가 아닌 사람들의 LAST_NAME, SALARY 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary < 5000
    OR salary > 12000
ORDER BY
    last_name DESC;
    
    --20, 50번 부서에서 근무하는 모든 사원들의 LAST-NAME, 부서번호를  오름차순으로 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
ORDER BY
    last_name,
    department_id;
    
    --커미션을 받는 모든 사원들의 LAST_NAME, 연봉, 커미션 조회(연봉의 내림차순, 커미션 내림차순)
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct DESC;
    
    
    --연봉이 2500, 3500, 7000이 아니며 직업이 SA_REP이나 ST_CLERK 인 사원 조회
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );
    
    --2008/02/20 ~ 2008/05/01 사이 고용된 사원들의 LAST_NAME, 사번, 고용일자 조회, 고용일자 내림차순

SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
        hire_date > '2008/02/20'
    AND hire_date < '2008-05-01'
ORDER BY
    hire_date DESC;
    
    --2004년도에 고용된 사원들의 LAST_NAME, HIRE_DATE 조회
    --고용일자 오름차순 정렬

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%'
ORDER BY
    hire_date;

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004/01/01' AND '2004/12/31'
ORDER BY
    hire_date;
    
    --부서가 20, 50이고 연봉이 5000에서 12000범위인 사람들의 LAST_NAME, SALARY 조회
    -- 연봉 오름차순 정렬

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000
ORDER BY
    salary;

SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%u%';

SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%';

SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%'
    OR last_name LIKE '___e%'
ORDER BY
    last_name;

SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    AND last_name LIKE '%e%'
ORDER BY
    last_name;

SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL
    OR manager_id = '';

SELECT DISTINCT
    department_id
FROM
    employees
WHERE
        job_id = 'ST_CLERK'
    AND department_id IS NOT NULL;

SELECT
    employee_id,
    first_name,
    job_id,
    salary * commission_pct commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

SELECT
    first_name,
    last_name,
    email,
    phone_number,
    lower(job_id)
FROM
    employees
WHERE
    first_name = 'Curtis';

SELECT
    employee_id,
    first_name,
    hire_date,
    replace(job_id, 'IT_PROG', '프로그래머')
FROM
    employees
WHERE
    department_id IN ( 60, 70, 80, 90 );

SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    job_id,
    first_name
    || ' '
    || last_name 사원명
FROM
    employees
WHERE
    job_id IN ( 'AD_PRES', 'PU_CLERK' );

--
SELECT
    last_name,
    salary,
    CASE
        WHEN salary < 2000  THEN
            0
        WHEN salary < 4000  THEN
            0.09
        WHEN salary < 6000  THEN
            0.20
        WHEN salary < 8000  THEN
            0.30
        WHEN salary < 10000 THEN
            0.40
        WHEN salary < 12000 THEN
            0.42
        WHEN salary < 14000 THEN
            0.44
        ELSE
            0.45
    END AS tax_rate
FROM
    employees   
WHERE
    department_id = 80;


SELECT MAX(SALARY)-MIN(SALARY) AS RANGE
FROM EMPLOYEES;

SELECT COUNT(DISTINCT MANAGER_ID)
FROM EMPLOYEES;

--join
--자신의 담당 매니저의 고용일보다 빠른 입사자 찾기 (SELF JOIN - EMPLOYEES)
--HIRE_DATE LAST_NAME, MANAGER_ID
SELECT E1.HIRE_DATE, E1.LAST_NAME, E1.MANAGER_ID, E2.HIRE_DATE AS MGRHIRE_DATE
FROM EMPLOYEES E1 JOIN EMPLOYEES E2 ON E1.MANAGER_ID=E2.EMPLOYEE_ID
WHERE E1.MANAGER_ID IS NOT NULL AND (E1.HIRE_DATE<E2.HIRE_DATE)
ORDER BY E1.HIRE_DATE;

--도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, 부서번호, 도시 조회
--EMPLOYEES, DEPARTMENTS, LOCATIONS INNER JOIN
SELECT E.EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
WHERE CITY LIKE 'T%';

SELECT E.EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID, L.CITY
FROM EMPLOYEES E ,DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID AND D.LOCATION_ID=L.LOCATION_ID AND CITY LIKE 'T%';

--위치 ID가 1700인 사원들의 사번, LAST_NAME, 부서번호, 급여 조회
--EMPLOYEES, DEPARTMENTS INNER JOIN
SELECT E.EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID, E.SALARY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
WHERE LOCATION_ID=1700;

--부서명, 위치ID, 각 부서별 사원 총 수, 각 부서별 평균 연봉 조회
--평균 연봉은 소수점 2자리까지만
--EMPLOYEES, DEPARTMENTS INNER JOIN
SELECT DEPARTMENT_NAME, LOCATION_ID, COUNT(EMPLOYEE_ID) AS CNT, ROUND(AVG(SALARY),2) AS AVG_SALARY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME, LOCATION_ID;

--EXECUTIVE 부서에 근무하는 사원들의 부서번호, LAST_NAME, JOB_ID 조회
--EMPLOYEES DEPARTMENTS, INNER JOIN
SELECT E.DEPARTMENT_ID, LAST_NAME, JOB_ID
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
WHERE UPPER(D.DEPARTMENT_NAME) = 'EXECUTIVE';

--각 사원별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의
--부서번호, 풀네임, SALARY, HIRE_DATE 조회
--EMPLOYEES SELF JOIN
SELECT distinct E1.DEPARTMENT_ID, E1.FIRST_NAME||' '||E1.LAST_NAME AS FULL_NAME, E1.SALARY, E1.HIRE_DATE
FROM EMPLOYEES E1 JOIN EMPLOYEES E2 ON E1.DEPARTMENT_ID=E2.DEPARTMENT_ID
WHERE E1.HIRE_DATE < E2.HIRE_DATE AND E1.SALARY < E2.SALARY
ORDER BY E1.DEPARTMENT_ID, FULL_NAME;

--서브쿼리 연습
--LAST_NAME에 U가 포함된 사원들과 동일 부서에 근무하는 사원들의 사번, LAST_NAME 조회

SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE UPPER(LAST_NAME) LIKE '%U%');

--JOB_ID가 SA_MAN인 사원들의 최대 연봉보다 높게 받는 사원들의 LAST_NAME, JOB_ID, SALARY 조회
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT MAX(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'SA_MAN');

--커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, DEPARTMENT_ID, SALARY 조회
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE (SALARY, DEPARTMENT_ID) IN (SELECT SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL);

-- 회사 전체 평균 연봉보다 더 받는 사원들 중 LAST_NAME에 U가 있는 사원들이 근무하는 부서에서 
-- 근무하는 사원들의 EMPLOYY_ID, LAST_NAME, SALARY 조회
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM (SELECT * FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES))
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE UPPER(LAST_NAME) LIKE '%U%');

-- LAST_NAME 이 DAVIES인 사람보다 나중에 고용된 사원들의 LAST_NAME, HIRE_DATE 조회
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE>(SELECT HIRE_DATE FROM EMPLOYEES WHERE UPPER(LAST_NAME) = 'DAVIES');

-- LAST_NAME이 KING인 사원을 매니저로 두고 있는 모든 사원들의 LAST_NAME, SALARY 조회
SELECT E1.LAST_NAME, E1.SALARY
FROM EMPLOYEES E1 JOIN EMPLOYEES E2 ON E1.MANAGER_ID = E2.EMPLOYEE_ID
WHERE UPPER(E2.LAST_NAME) = 'KING';

SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE UPPER(LAST_NAME) = 'KING');
