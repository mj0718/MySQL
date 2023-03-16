# 수직 조인
# 합집합: union - 중복 제거, union all - 중복 모두 표시 
# 교집합, 차집합: MySQL은 별도의 연산자를 제공하지 않음
# 교집합: join -> 조인 조건
# 차집합: sub query -> not in

select dept_no, emp_no
from dept_manager;

select dept_no, dept_name
from departments;

# union
select dept_no
from dept_manager
union 
select dept_no
from departments;

# union all
select dept_no
from dept_manager
union all 
select dept_no
from departments;

# union
select dept_no, emp_no
from dept_manager
union
select dept_no, dept_name
from departments;