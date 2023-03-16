/*
[commit & rollback]
commit: 작업 완료
rollback: 작업 취소

commit과 rollback은 논리적인 작업의 단위(트랜잭션, transaction)과 관련 있음

*/
# < 첫 번째 시나리오>
# 1. t1 테이블을 복사한 copy_t1 테이블 생성
# 2. 로우 삭제: co3가 null인 로우
# 3. 작업 취소
# 4. 테이블 확인
########################################################
# 1. t1 테이블을 복사한 copy_t1 테이블 생성
create table copy_t1
as 
select * from t1;

# 2. 로우 삭제: co3가 null인 로우
delete from copy_t1
where co3 is null;

# copy_t1 테이블 조회: 로우 6개
select * from copy_t1;

# 3. 작업 취소
rollback;

# 4. 테이블 확인: row 6개 -> rollback 안 됨 -> 원인: auto commit 
select * from copy_t1;
