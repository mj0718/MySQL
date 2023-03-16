/*
[truncate]
- 구조만 남기고, 모든 row 삭제

truncate 테이블명;
*/

select * from t1;

# t1 테이블을 복사한 copy_t1 테이블 생성
create table copy_t1
as 
select * from t1;

# 모든 row 삭제
truncate copy_t1;

select * from copy_t1;