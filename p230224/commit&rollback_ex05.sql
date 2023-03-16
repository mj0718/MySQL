# < 다섯 번째 시나리오>
# 1. [insert] copy_t1 : 로우 3개 추가
# 2. [create] new_t1 : 테이블 생성
# 3. [delete] copy_t1 : 로우 1개 삭제
# 4. [rollback] 작업취소 : rollback
########################################################

# copy_t1 테이블 조회 : 로우 0개
select * from copy_t1;

# 1. copy_t1 : 로우 3개 추가
insert into copy_t1
values (1, '하나', 1.1), (2, '둘',2.2), (3,'셋',3.3);

# copy_t1 테이블 조회 : 로우 3개
select * from copy_t1;

# 2. new_t1 : 테이블 생성
create table new_t1
select * from t1;

show tables like '%t1%';

# new_t1 테이블 조회 : 로우 8개
select * from new_t1;

# 3. copy_t1 : 로우 1개 삭제 - co1 컬럼의 값이 2인 로우 삭제
delete from copy_t1
where co1 =2;

# copy_t1 테이블 조회 : 로우 2개
select * from copy_t1;

# 4. 작업취소 : rollback
rollback;

# copy_t1 테이블 조회 : 로우 3개
select * from copy_t1;
