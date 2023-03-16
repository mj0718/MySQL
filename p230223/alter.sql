/*
자료형 변경
alter table 테이블명 modify 컬럼명 자료형;

컬럼명 변경
alter table 테이블명 change 기존컬럼명 새컬럼명 자료형;

새 컬럼 추가
alter table 테이블명 add 추가컬럼명 자료형;

컬럼 삭제
alter table 테이블명 drop 컬럼명;

테이블명 변경
alter table 테이블명 rename 새테이블명;
*/
# 테이블 목록
show tables;
# 테이블 구조
desc t1;
# 테이블 조회
select * from t1;
# 데이터 추가
insert into t1 values(1, 'one', 1.1);
insert into t1 values(2, 'two', 2.2);

# 테이블 t1의 co2 컬럼의 자료형 변경: varchar(10) -> char(5)
alter table t1 modify co2 char(5);

# 테이블 t1의 co1 컬럼명 변경: co1 -> num
alter table t1 change co1 num int;

# 테이블 t1의 num 컬럼명 변경: num -> co1, 타입 float 변경
alter table t1 change num co1 float;

# 테이블 t1에 co4 컬럼 추가: 타입 int
alter table t1 add co4 int;

# 테이블 t1에 co5 컬럼 추가: 타입 int 
alter table t1 add co5 int default 0;

# co4 컬럼 삭제
alter table t1 drop co4;

# t1테이블을 t2로 변경
alter table t1 rename t2;

show tables;

desc t1;

# t1테이블 조회
select * from t2;
