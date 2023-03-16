# < 두 번째 시나리오>
# 1. [delete] copy_t1 테이블의 모든 로우 삭제
# 2. [insert] t1 테이블의 모든 데이터를 copy_t1 테이블에 복사
# 3. [delete] copy_t1 테이블에서 co3 컬럼이 2.2인 로우 삭제
# 4. [rollback] 작업 취소
########################################################

# copy_t1 테이블 조회 - row 6개
select * from copy_t1;

# 1. [delete] copy_t1 테이블의 모든 로우 삭제
delete from copy_t1;

# 2. [insert] t1 테이블의 모든 데이터를 copy_t1 테이블에 복사
insert into copy_t1
select * from t1;

# copy_t1 테이블 조회 - row 8개
select * from copy_t1;

# 3. [delete] copy_t1 테이블에서 co3 컬럼이 2.2인 로우 삭제
delete from copy_t1
where co3 like 2.2;

# copy_t1 테이블 조회 - row 7개
select * from copy_t1;

# 4. [rollback] 작업 취소
rollback;

# copy_t1 테이블 조회 - row 6개 => 처음 상태로 돌아감
select * from copy_t1;
