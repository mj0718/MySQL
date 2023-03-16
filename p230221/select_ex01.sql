# limit  
select * 
from employees
where emp_no < 10004;

select * 
from employees
limit 3;

select *
from employees
limit 1, 3;

# 산술 연산자
# 1) 단순 계산 
select 20-10, 30*3, 40/2;

SELECT emp_no, salary, salary + 10 AS '10 증가값'
FROM salaries;

# [문제] 사번, 현재 연봉, 10% 인상된 각 사원의 연봉 조회 (상위 20개만)
select emp_no, salary, salary*1.1 as '10% 인상된 연봉'
from salaries
where to_date = '9999-01-01'
limit 20;

# distinct 중복 제거 (row단위 기준)
select distinct dept_no
from dept_manager;