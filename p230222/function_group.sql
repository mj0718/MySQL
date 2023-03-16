# [그룹함수] 집계함수
# count(칼럼명) : row 개수
# sum(칼럼명) : 합
# avg(칼럼명) : 평균
# max(칼럼명) : 최대값
# min(칼럼명) : 최소값

# [문법] 
# select 칼럼명1, 그룹함수(칼럼명2)
# from 테이블명
# where 조건
# group by 칼럼명1, 칼럼명2
# having 조건;

# 총 사원 수
select count(emp_no), count(*)
from employees;

select *
from titles;

select count(to_date), count(*)
from titles;

# 직원들 연봉 전체 합, 최고 연봉, 최저 연봉
select sum(salary), max(salary), min(salary)
from salaries;

# 직원의 성별 수
select gender, count(gender)
from employees
group by gender;

# 직책별 지원 수 (50000만 이상만)
select title, count(*)
from titles
group by title
having count(*) >=50000;

# [문제] d001, d002, d009 각 부서의 인원 수 
# [첫 번째 방법]
select dept_no, count(*)
from dept_emp
group by dept_no
having dept_no in ('d001', 'd002', 'd009');
# [두 번째 방법]
select dept_no, count(*)
from dept_emp
where dept_no in ('d001', 'd002', 'd009')
group by dept_no;