/*
update : 데이터 수정, 변경
[문법] 
update 테이블명
set 컬럼명 = 변경할 값
where 조건;

*/
use test;

# t1 테이블 조회
select * from t1;

# t1 테이블에서 co1 컬럼값이 4인 row의 co2 컬럼값을 '둘'로 변경
update t1 
set co2 = '둘'
where  co1 = 4;

# t1 테이블에서 co1 컬럼값이 8인 row의 co3 컬럼값을 null로 변경
update t1 
set co3 =null
where  co1 = 8;

#[문제] t1 테이블에서 co1값이 4~6인 row의 co3를 0.1로 변경
update t1
set co3 =0.1
where co1 between 4 and 6;

# [과제] ==========================================================
# salaries의 row 100개를 복사한 copy_salaries 테이블 생성
# key 복사 없이 모든 컬럼과 row 복사
# 입사일이 1986년도인 직원의 현재 연봉을 10% 인상하시오

# copy_salaries 테이블 생성
create table copy_salaries
as 
select *
from employees.salaries
limit 100;

# 입사일이 1986년도인 직원의 현재 연봉을 10% 인상
update copy_salaries
set salary = salary * 1.1
where emp_no in (select emp_no 
				from employees.employees
                where year(hire_date)=1986)
                and to_date='9999-01-01';

# copy_salaries 테이블 조회
select * 
from copy_salaries;

#====================================================
show tables;
select * from t1;

# [t1 테이블] co1이 7인 row에서 co2와 co3를 7로 변경
update t1
set co2=7, co3=7
where co1=7;

# [copy_temp1] three 컬럼의 값을 200으로 수정 
select * from copy_temp1;

# where 없으면 모든 값 변경됨
update copy_temp1
set three=200;
