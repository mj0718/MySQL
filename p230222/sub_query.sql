# 서브쿼리: 쿼리문 내 쿼리문

# 1. d001 부서에 근무하고 있는 사원들의 사번과 이름 조회
# 1. 사번과 이름 조회
select emp_no, first_name
from employees;

# 2. d001 부서에 근무하는 사원의 사번 부서번호
select emp_no, dept_no
from dept_emp
where dept_no like 'd001';

# 3. 
select emp_no, first_name
from employees
where emp_no in (select emp_no from dept_emp where dept_no like 'd001');

# 위 서브쿼리를 조인으로 변경
select e.emp_no, first_name
from employees e, dept_emp d
where e.emp_no=d.emp_no and d.dept_no like 'd001';
