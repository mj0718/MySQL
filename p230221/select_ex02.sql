# 논리 연산자

# d001 부서 매니저 중 1990년 이후부터 매니저인 사원의 사원번호, 부서번호, 매니저 시작일 조회
select emp_no, dept_no, from_date
from dept_manager
where dept_no = 'd001' and from_date >= '1990-01-01';

# [문제1] 1990년 이후 입사한 남자 사원의 사원번호, 성별, 입사일 추출
select emp_no, gender, hire_date
from employees
where gender = 'M' and hire_date >= '1990-01-01';

# [문제2] 1990년 이후부터 연봉을 60,000 이상 받는 사원의 사원번호, 연봉, 연봉 수령 날짜(시작일) 추출
select emp_no, salary, from_date
from salaries
where salary >= 60000 and from_date >= '1990-01-01';

# [문제3] d001 부서와 d002 부서 매니저의 사원번호, 부서번호 추출
select emp_no, dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002';

# [문제4] 직책이 staff이거나 engineer인 사원의 사원번호, 직책 추출
select emp_no, title
from titles
where title = 'staff' or title = 'engineer';

# [문제5] d003 부서 소속(담당)이 아닌 매니저의 사원번호, 부서번호 추출
select emp_no, dept_no
from dept_manager
where not dept_no = 'd003';

# 범위 연산자
# 연봉이 60,000 이상 70,000이하인 사원의 사원번호, 연봉 추출
select emp_no, salary
from salaries
where salary between 60000 and 70000;

# 집합 연산자
# d001 부서와 d002 부서 매니저의 사원번호, 부서번호 추출
select emp_no, dept_no
from dept_manager
where dept_no in ('d001', 'd002');

# d001 부서와 d002 부서가 아닌 매니저의 사원번호, 부서번호 추출
select emp_no, dept_no
from dept_manager
where dept_no not in ('d001', 'd002');

# 문자열 연산자
# 여자 사원의 사번, 이름, 성별 조회
select emp_no, first_name, gender
from employees
where binary gender like 'F';

# 이름이 B로 시작하는 사원의 사번, 이름 추출
select emp_no, first_name
from employees
where first_name like 'B%';

# 이름이 i로 끝나는 사원의 사번, 이름 추출
select emp_no, first_name
from employees
where first_name like '%i';

# 이름에 u가 포함된 사원의 사번, 이름 추출
select emp_no, first_name
from employees
where first_name like '%u%';

# 이름에 두 번째 글자가 r인 사원의 사번, 이름 추출
select emp_no, first_name
from employees
where first_name like '_r%';

# 이름에 두 번째 글자가 r인 사원의 사번, 이름 추출
# 단, 이름 글자 수가 3개인 이름만
select emp_no, first_name
from employees
where first_name like '_r_';

# 이름이 b로 시작하지 않느 직원의 이름과 사번 추출
select first_name, emp_no 
from employees
where first_name not like 'b%';

# null 연산자
desc titles;

# null 값 확인
select *
from titles
where to_date is null;

# emp_no가 10002인 사원의 to_date를 null로 변경
update titles
set to_date = null
where emp_no = 10002;

select *
from titles
where to_date is null;