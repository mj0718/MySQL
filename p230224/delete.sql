/*
[delete]
- row 삭제, 변경

delete from 테이블명
where 조건;

*/
# [copy_temp1] one 컬럼의 값이 100인 row 삭제
delete from copy_temp1
where one=100;

select * from copy_temp1;

# [문제]  copy_temp1 one 컬럼의 값이 2, 200인 row 삭제
delete from copy_temp1
where one in(2,200);

# delete 문에 where 절이 없는 경우 : 모든 row 삭제
delete from copy_temp1;
