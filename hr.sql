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
        hire_date like '04%'
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
    
    SELECT LAST_NAME, SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN (20,50) AND SALARY BETWEEN 5000 AND 12000
    ORDER BY SALARY;
    
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%u%';

SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '___a%';

SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '___a%' OR LAST_NAME LIKE '___e%'
ORDER BY LAST_NAME;

SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%' AND LAST_NAME LIKE '%e%'
ORDER BY LAST_NAME;

select LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL OR MANAGER_ID = '';

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK' AND DEPARTMENT_ID IS NOT NULL;

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY * COMMISSION_PCT COMMISSION
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

