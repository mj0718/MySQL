/*
[권한 부여] grant
# 모든 권한 부여
grant all privileges on DB명.테이블명 to '아이디'@'localhost';
grant all privileges on *.* to '아이디'@'localhost';

# 아이디를 가진 사용자에게 DB의 테이블에 특정 권한 부여
grant 권한 on DB명.테이블명 to '아이디'@'localhost';

# ex) kim 사용자에게 employees DB의 salaries 테이블을 조회와 수정 권한 부여
grant select, update on employees.salaries to 'kim'@'localhost';

[권한 회수] revoke
# 모든 권한 회수
revoke all privileges on DB명.테이블명 from '아이디'@'localhost';
revoke all privileges on *.* from '아이디'@'localhost';

# 아이디를 가진 사용자에게 DB의 테이블에 특정 권한 회수
revoke 권한 on DB명.테이블명 from '아이디'@'localhost';

# ex) kim 사용자에게 employees DB의 salaries 테이블을 조회와 수정 권한 회수
revoke select, update on employees.salaries from 'kim'@'localhost';
*/

# kim의 권한 확인
show grants for kim@localhost;

# 현재 선택된 DB 확인
select database();

# test DB 선택
use test;

# test DB의 table 목록
show tables;

# 사용자 kim에게 test DB의 copy_departments 테이블 조회 권한 부여
grant select on test.copy_departments to 'kim'@'localhost';

# kim의 권한 확인
show grants for kim@localhost;

# cmd에서 확인 window+R -> cmd -> mysql -u kim -p 

# 사용자 kim에게 test DB의 copy_departments 테이블 수정 권한 부여
grant update on test.copy_departments to 'kim'@'localhost';

# [권한 회수] =============================================================
# 사용자 kim에게 test DB의 copy_departments 테이블 수정 권한 회수
revoke update on test.copy_departments from 'kim'@'localhost';

# kim의 권한 확인
show grants for kim@localhost;

# 사용자 kim에게 test DB의 copy_departments 테이블 조회 권한 회수
revoke select on test.copy_departments from 'kim'@'localhost';
