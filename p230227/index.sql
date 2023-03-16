/*
[index 생성]
alter table 테이블명 add index 인덱스명(컬럼1,컬럼2);
create [unique] index 인덱스명 on 테이블명 (컬럼명1, 컬럼명2) [asc|desc];

[index 삭제]
alter table 테이블명 drop index 인덱스명;
drop index 인덱스명 on 테이블명;
*/

# 테이블 인덱스 확인
show index from customer;

select * from customer;

use employees;

show index from employees;

# 전체 DB의 모든 key 정보 조회 2-1)
select * from information_schema.table_constraints;

# 전체 DB의 모든 key 정보 조회 2-2)
select * from information_schema.table_constraints
where table_schema like 'employees'
	and table_name like 'employees';

# 전체 로우 조회
select * from employees;

# 특정 로우 조회: [index] emp_no가 10002인 로우 조회
# single row
select * from employees
where emp_no=10002;

# 특정 로우 조회: [일반 컬럼] first_name이 Parto인 로우 조회
# full table scan
select * from employees
where first_name like 'Parto';

# 인덱스 설정
# alter table 테이블명 add index 인덱스명(컬럼1,컬럼2);
alter table employees add index idx_emp_first_name(first_name);

# 인덱스 확인
show index from employees;
show indexes from employees;

# key 정보
select * from information_schema.table_constraints
where table_schema like 'employees'
	and table_name like 'employees';

# 특정 로우 조회: [index] first_name이 Parto인 로우 조회
# index range scan : cost 102.86
select * from employees
where first_name like 'Parto';

# 인덱스 삭제
# alter table 테이블명 drop index 인덱스명;
alter table employees drop index idx_emp_first_name;

# 특정 로우 조회: [일반 컬럼] first_name이 Parto인 로우 조회
# full table scan : cost 30174.55
select * from employees
where first_name like 'Parto';
