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