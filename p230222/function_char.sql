# [문자 함수]
# 대문자 변경: ucase(문자)
# 소문자 변경: lcase(문자)
select ucase('aBcDe'), lcase('aBcDe');

# 역순
select reverse('aBcDe');

# 문자 길이 (문자 수)
select length('abcd');

# ex) 부서명 길이
select length(dept_name)
from departments;