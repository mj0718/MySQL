# < 네 번째 시나리오>
# 특정 위치(쿼리) 작업 취소 : savepoint

# savepoint 이름1;
# 1. [insert] t1 테이블의 모든 로우를 copy_t1 테이블에 복사

# savepoint 이름2;
# 2. [delete] co1이 3인 로우 삭제

# 3. [rollback] 작업 취소
########################################################

 -- copy_t1 테이블 조회 : row 0개
 select * from copy_t1;

savepoint before_insert;

# 1. [insert] t1 테이블의 모든 로우를 copy_t1 테이블에 복사
insert into copy_t1
select * from t1;

 -- copy_t1 테이블 조회 : row 8개
 select * from copy_t1;
 
 savepoint before_delete;
 
# 2. [delete] co1이 3인 로우 삭제
delete from copy_t1
where co1=3;

 -- copy_t1 테이블 조회 : row 7개
 select * from copy_t1;
 
# 3. [rollback] 작업 취소
rollback to before_delete;
rollback to before_insert;

 -- copy_t1 테이블 조회 : row 0개
 select * from copy_t1;