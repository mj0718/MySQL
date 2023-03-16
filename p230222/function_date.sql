# 날짜 함수
# 현재 날짜와 시간
select now();
select sysdate();

# 현재 날짜 (curdate(), current_date() 는 동일한 함수)
select curdate(), current_date();

# 현재 시간 (curtime(), current_time() 는 동일한 함수)
select curtime(), current_time();

# 특정 날짜를 기준으로 더하거나 뺀 값
# date_add(날짜, interval 값 기준) - 날짜에서 interval만큼 더한 날짜
# date_sub(날짜, interval 값 기준) - 날짜에서 interval만큼 뺀 날짜
# interval 기준: year, month, day, hour, minute, second

# 오늘을 기준으로 100일 뒤 날짜는?
select now(), date_add(now(), interval 100 day);
select now(), date_add(now(), interval 1 day);

# 오늘을 기준으로 14개월 뒤 날짜는?
select now(), date_add(now(), interval 14 month);

# 현재 시간을 기준으로 10시간 뒤?
select curtime(), date_add(curtime(), interval 10 hour);

# 오늘을 기준으로 100일 전 날짜는?
select now(), date_sub(now(), interval 100 day);

# [문제] 사원들의 발령 7일전 날짜 조회
select hire_date, date_sub(hire_date, interval 7 day)
from employees;

# 년, 월, 일, 시, 분, 초만 조회
select now(), year(now()), month(now()), day(now()), hour(now()), minute(now()), second(now());

# 월을 영어로 반환: monthname(날짜)
select now(), monthname(now());

# 요일을 숫자로 반환1): dayofweek(날짜)
# 일 1, 월 2, 화 3, 수 4, 목 5, 금 6, 토 7
select now(), dayofweek(now());

# 요일을 숫자로 반환2): weekday(날짜)
# 월 0, 화 1, 수 2, 목 3, 금 4, 토 5, 일 6
select now(), weekday(now());
select curdate()+1, weekday(curdate()+1);

# 일년을 기준으로 일 수: dayofyear(날짜)
select now(), dayofyear(now());

# 일년을 기준으로 몇 번째 주: week(날짜)
select now(), week(now());

# 형식 지정
select now(), date_format(now(), '%Y년 %m월 %d일 %H시 %i분 %s초');