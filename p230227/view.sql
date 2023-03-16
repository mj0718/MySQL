/*
[view]
- 가상 테이블, 논리 테이블
- 기반 테이블(base table)을 삭제하면 view도 삭제됨

[장점] 
- 보안 효과
- 특정 데이터만 조회 가능
- 쿼리 재사용 가능 
[단점] 
- 뷰 변경 불가능 
- row 추가, 삭제, 수정 제한
- 인덱스를 가질 수 없음

[문법] 
create view 뷰이름 as select문;
*/

select * from employees;

create view emp
as
select emp_no, first_name, gender
from employees;

show tables like '%emp';

# view emp 전체 조회
select * from emp;

# view emp 남직원 조회
select * from emp
where gender like 'm';

# view emp 수정: emp_no가 10003인 직원의 이름을 길동으로 수정
update emp
set first_name='길동'
where emp_no=10003;

# view emp 추가: emp_no - 100, first_name - 보검, gender - M
# 제한됨
insert into emp
values(100, '보검', 'M'); 

# view emp 인덱스 생성: first_name 컬럼에 idx_emp_first_name 인덱스 생성
# view 인덱스 설정 불가능: 물리적으로 존재하는 테이블이 아님
create index idx_emp_first_name on emp (first_name);

# view emp로 view v_emp 생성
create view v_emp 
as 
select emp_no, first_name
from emp;

# view v_emp 조회
select * from v_emp;

# view v_emp 삭제
drop view v_emp;

# table 목록 확인
show tables like '%emp';

# view 확인
show full tables where table_type like 'VIEW';

select table_schema, table_name, table_type from information_schema.tables
where table_schema like 'employees' and table_type like 'VIEW';

# view emp 수정: emp_no가 10100 이하인 직원
select * from emp;

alter view emp
as 
select emp_no, first_name, gender
from employees
where emp_no<=10100;

select * from emp;

# [문제] 사번, 부서번호, 부서의 매니저 사번이 조회되는 v_dept_emp_manager 뷰 생성
create view v_dept_emp_manager
as 
select de.emp_no as '사번', de.dept_no as '부서번호', dm.emp_no as '매니저 사번'
from dept_emp de, dept_manager dm
where de.dept_no=dm.dept_no and dm.to_date='9999-01-01'; 

select * from v_dept_emp_manager;

drop view v_dept_emp_manager;

# view 확인
show tables like '%emp%';
show full tables where table_type like 'VIEW';

# view 생성 쿼리문 확인
show create view v_dept_emp_manager;
