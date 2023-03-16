# 남자 사원의 수
select count(*) as '남자 사원 수'
from employees
where gender = 'M'
group by gender;

# d005 부서의 현재 근무하고 있는 사원 수
select count(*) as 'd005부서의 사원 수'
from dept_emp
where dept_no = 'd005' and to_date='9999-01-01'
group by dept_no;

# 부서별 현재 재직자 수
select dept_no as '부서', count(*) as '재직자 수'
from dept_emp
where to_date='9999-01-01'
group by dept_no;

# 각 부서의 과거 매니저 수
select dept_no as '부서', count(*) as '과거 매니저 수'
from dept_manager
where to_date <> '9999-01-01'
group by dept_no;

# 직책에 공백이 있는 데이터의 길이 구하기 (단, 중복을 제거하여 하나의 데이터만 조회)
select title as '직책', length(title) as '직책 문자열 길이'
from titles
group by title
having title like '% %';

# 부서명, 부서번호, 부서 총 직원수 조회 (현재와 기존 직원 포함)
select dept_name as '부서명', d.dept_no, count(*) as '부서 총 직원수'
from dept_emp de, departments d
where de.dept_no=d.dept_no
group by d.dept_no;

# 현재 연봉을 전체 현재 평균 연봉보다 많이 받는 직원들의 사원번호, 현재 연봉 조회
select emp_no, salary
from salaries
where to_date='9999-01-01' and salary >= (select avg(salary) from salaries where to_date='9999-01-01');

# 1960년 이후 태어난 사원들의 사원 번호, 부서 번호 조회
select e.emp_no, dept_no
from employees e, dept_emp de
where e.emp_no=de.emp_no and e.birth_date >= '1960-01-01';
