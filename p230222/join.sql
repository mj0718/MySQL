# 수평 조인: from절에 테이블명을 ,로 구분하여 여러 개

select * from dept_manager; # 24 row
select * from departments; # 9 row

# 다대다 조인
select emp_no, dept_manager.dept_no, departments.dept_no, dept_name
from dept_manager, departments;

# 부서번호가 같은 row끼리 수평 조인 1)
select emp_no, dept_manager.dept_no, departments.dept_no, dept_name
from dept_manager, departments
where dept_manager.dept_no=departments.dept_no;
# 부서번호가 같은 row끼리 수평 조인 2)
select emp_no, dm.dept_no, dt.dept_no, dept_name
from dept_manager as dm, departments as dt
where dm.dept_no=dt.dept_no;

# [문제] 현재 재직 중인 사원의 사원 번호, 이름, 연봉 조회
select e.emp_no, e.first_name, s.salary
from employees e, salaries s
where e.emp_no=s.emp_no and s.to_date='9999-01-01';

# 현재 재직 중인 사원의 직책 조회 (사번, 직책)
select e.emp_no, first_name, t.title
from employees e, titles t
where e.emp_no=t.emp_no and t.to_date='9999-01-01';
