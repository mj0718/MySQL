/*
row 추가
[문법 1] 컬럼명 지정
insert into 테이블명(컬럼명1, 컬럼명2)
values(값1, 값2);

[문법 2] 컬럼명 없음: 모든 컬럼
insert into 테이블명
values (값1, 값2);

[문법 3] 서브쿼리 이용
insert into 테이블명(컬럼명, 컬럼명)
select 컬럼명, 컬럼명
from 테이블명;

[문법 4] 한번에 여러 개 row 추가
insert into 테이블명(컬럼명, 컬럼명) 
values
(값1, 값2),
(값3, 값4),
(값5, 값6);
*/


# t1 테이블 생성
create table t1 (
	co1 int,
    co2 varchar(10),
    co3 float
);
# t1 테이블 구조
desc t1;

# row 추가 : 컬럼명 모두 표시
insert into t1(co1, co2, co3)
values (1, '하나', 1.1);

# row 추가 : 컬럼명 모두 생략
insert into t1
values (2, '둘', 2.2);

# row 추가 : 일부 컬럼
insert into t1(co1, co2)
values (3, '셋');

# row 추가 : 자료형 - co2 컬럼: 숫자
insert into t1
values (4, 400, 4.4);

# row 추가 : 자료형 - co1 컬럼: 문자
insert into t1
values ('5', '500', '5.5');

# row 추가 : 자료형 - co1 컬럼: 문자
insert into t1
values ('육', '여섯', 6.6); # Error 

# t1 테이블 조회
select * from t1;

# 테이블 구조(key 포함) 복사 -> 데이터 복사

# 1. 테이블 구조(key 포함) 복사
create table copy_temp1 like temp1;

# 2. 테이블 목록
show tables like '%temp1';

# 3. copy_temp1 구조 확인
desc copy_temp1;

# 4. copy_temp1 데이터 조회 -> data 없음
select * from copy_temp1;

# 5. temp1 조회
select * from temp1;

# 6. copy_temp1에 row 추가 : temp1의 row 복사
insert into copy_temp1
select * from temp1;

# 7. copy_temp1 조회
select * from copy_temp1;

# [과제] =========================================================================
# titles 테이블의 일부 구조를 복사한 c_titles 테이블 생성
# 단, emp_no, title, from_date 컬럼 구조 그대로 복사 -> pk 설정 되어있어야 함
# to_date 컬럼 제외
# 데이터는 title이 Engineer인 행만 추가

# 구조 복사
create table c_titles like employees.titles;

# to_date 컬럼 삭제
alter table c_titles drop column to_date;

# 값 복사
insert into c_titles
select emp_no, title, from_date from employees.titles where title like 'engineer';

# 데이터 출력
select * from c_titles;
#====================================================================================

# t1 테이블 여러 개 row 추가
insert into t1 
values
(6, '육', 6.6),
(7, '칠', 7.7),
(8, '팔', 8.8);

select * from t1;