/*
[SQL]
- 정의어: create, drop, alter
- 조작어: select, insert, update, delete
- 제어어: grant, revoke, commit, rollback

[조작어] select - 조회, 검색
select 필드명1, 필드명2 #select clause => select절
from 테이블명 #from clause
where 조건; #where clause
*/
# DB 선택 
use employees;

# 테이블 목록
show tables;

# 테이블 구조 확인
desc employees; 

# 전체 직원의 정보 조회
select emp_no, birth_date, first_name, last_name, gender, hire_date
from employees;

# 전체 직원의 정보 중 사번과 이름만 조회
select emp_no, first_name
from employees;

# 사번이 10001인 사원의 정보 조회
select emp_no, birth_date, first_name, last_name, gender, hire_date
from employees
where emp_no = 10001;

# [문제] 
# d005 부서 매니저의 사원번호, 부서번호 추출
select emp_no, dept_no
from dept_manager
where dept_no = 'd005';

# d003 부서 소속이 아닌 매니저들의 사원번호, 부서번호 추출
select emp_no, dept_no
from dept_manager
where dept_no <> 'd003';

# 연봉이 150,000이상인 사원들의 사원번호, 연봉 추출
select emp_no, salary
from salaries
where salary >= 150000;

# 1986년 이후에 입사한 사원의 사원번호, 입사일, 이름 추출
select emp_no, hire_date, first_name
from employees
where hire_date >= '1986-01-01';

# 1990년 이후부터 매니저로 근무하고 있는 사원들의 사원번호, 부서번호, 매니저 시작 날짜 추출
select emp_no, dept_no, from_date
from dept_manager
where from_date >= '1990-01-01';

# 1990년 이전 입사한 사원들의 사원번호, 입사일 추출
select emp_no, hire_date
from employees
where hire_date < '1991-01-01';