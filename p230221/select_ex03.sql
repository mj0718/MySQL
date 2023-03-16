/*
- 정의어(DCL): create(생성), drop(삭제), alter(변경)
- 조작어(DML): select(조회), insert(추가), update(수정), delete(삭제)
- 제어어(DDL): grant(부여), revoke(회수), commit(완료), rollback(취소)

[order by]
- [문법] order by 칼럼명 asc, 칼럼명 desc;
*/

# 연봉을 오름차순, 연봉 시작일을 내림차순으로 하여 사번, 연봉, 연봉 시작일 추출
select emp_no, salary, from_date
from salaries
order by salary, from_date desc;

# [문제] 직책을 오름차순, 업무 시작일을 내림차순하여 사번, 직책, 업무시작일 추출
select emp_no, title, from_date
from titles
order by title, from_date desc;