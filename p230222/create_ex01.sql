/*
test DB 생성
[문법] create database DB명;
*/
create database test;

show databases;

# test DB 삭제
drop database test;

# test DB 생성
create database test
char set = utf8mb4;

# utf8mb4는 이모지 저장 가능
# 이모지(emoji) : window + . 또는 window + ,

# test DB 선택
use test;

# table 목록 확인
show tables;

#################################################################################################
# 테이블 생성
# [문법 1] create table [IF NOT EXISTS] 테이블명 (칼럼명 자료형, 칼럼명 자료형(크기));

# [문법 2] 
# 서브쿼리를 이용한 테이블 생성
# create table [IF NOT EXISTS] 테이블명 as select 칼럼명, 칼럼명 from 테이블명 where 조건;

# [문법 3]
# 테이블 구조만 복사
# key 복사
# create table [IF NOT EXISTS] 복사본_테이블명 like 원본_테이블명;
#################################################################################################

# t1 테이블 생성
create table t1 (
	co1 int, 
    co2 varchar(10),
    co3 float
);

# 테이블 목록 조회
show tables;

# t1 테이블 구조
desc t1;

# t1 테이블 데이터 조회
select * from t1;

# [문법 2] 
# 테이블 구조 + 데이터 복사
# 서브쿼리를 이용한 테이블 생성
# deparments 테이블의 모든 데이터 조회
select * from departments;
select * from employees.departments;

# 현재 선택된 DB 확인
select database();

# employees DB의 departments 테이블 복사
create table copy_departments
as 
select * from employees.departments;

# table 목록
show tables;

# copy_departments 로우 조회
select * from copy_departments;

# 테이블 구조
# employees DB의 departments 테이블(원본)과 test DB의 copy_departments 테이블(복사본)의 구조 차이
desc employees.departments;
desc copy_departments;

# [문제] 사번과 직책 칼럼으로 구성된 copy_titles 테이블을 생성 단, staff 정보로만 데이터를 구성
create table copy_titles
as 
select emp_no, title 
from employees.titles 
where title like 'staff';

# copy_titles 테이블 조회
select * from copy_titles;

# 테이블 목록
show tables;
show tables like 'copy%';
show tables like '%titles';

# [문법 3] 
# employees 테이블 구조 확인
desc employees.employees;

# employees 테이블의 구조를 복사한 copy_employees 테이블 생성
create table copy_employees 
like employees.employees;

# copy_employees 테이블 구조
desc copy_employees;

# copy_employees 테이블 조회
select * from copy_employees;

# test DB의 테이블 목록
show tables;