/*
[함수]

*/
# [숫자]
# 절대값
select abs(100), abs(-100);

# 소수점 이하 올림
select ceil(10.4), ceil(10.5), ceil(10.6);

# 소수점 이하 내림
select floor(10.4), floor(10.5), floor(10.6);

# 반올림
select round(10.4), round(10.5), round(10.6);

select round(166.555,0), round(166.555,1), round(166.555,-1);

# 버림
select truncate(166.555, 0), truncate(166.555, 1), truncate(166.555, -1);

# x의 y승
select power(5,2);

# 나머지 
select mod(5,2);

# 가장 큰 값
select greatest(3, 10, 5, 20);

# 가장 작은 값
select least(3, 10, 5, 20);

# [문자]
# 이어주기
select concat('one', 'two', 'three');

select concat(first_name, '님') as '이름', concat('성별: ',gender) as '성별'
from employees;

# 사원의 사번, 이름 조회 단, 이름은 first_name, last_name을 한 칼럼에 표시
select emp_no as '사번', concat(first_name,' ', last_name) as '이름'
from employees;

# 특정 위치에 추가(1) : 첫 번째 인수인 문자에서 2번째 자리 문자 1개를 wow로 변경
# select insert('문자', 시작위치, 개수, '추가문자');
select insert('abcdefg', 2, 1, 'wow');

# 특정 위치에 추가(2)
select insert('abcdefg', 2, 0, 'wow');

# [문제] bcd를 삭제하시오
select insert('abcdefg', 2, 3, '');

# 교체
# replace(문자, 기존문자, 새문자);
select replace('abcdefg', 'bc', 'ONE');

# [문제] bcd를 삭제하시오
select replace('abcdefg', 'bcd', '');

# 위치 
# instr(문자, 찾고자하는문자);
select instr('abcdefg' , 'b');

select instr('abcdefg' , 'k');

select instr('abcdefg' , 'cde');

# [문자 반환]
# left(문자, 개수)
select left('abcdefg', 3);

# right(문자, 개수)
select right('abcdefg', 3);

# mid(문자, 시작위치, 개수)
select mid('abcdefg', 3, 2);

# substring(문자, 시작위치, 개수)
select substring('abcdefg', 3, 2);

# mid를 이용하여 c부터 끝까지 추출
select mid('abcdefg', 3);

# [과제] 부서명에서 S로 시작하는 단어 추출
select mid(dept_name, instr(binary dept_name, 'S')) as 'S로 시작하는 부서'
from departments
where mid(dept_name, instr(binary dept_name, 'S')) not like '';

# 공백제거
# ltrim(문자): 왼쪽 공백 제거
# rtrim(문자): 오른쪽 공백 제거
# trim(문자): 양쪽 공백 제거

select concat('|', ltrim('     abc     '), '|');
select concat('|', rtrim('     abc     '), '|');
select concat('|', trim('     abc     '), '|');
select concat('|', trim('     a   bc     '), '|');

# [과제] 모든 공백 제거
select insert(trim('     a   bc     '),2,3,'');
select replace('     a   bc     ',' ','');