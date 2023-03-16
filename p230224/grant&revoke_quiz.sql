# 1. 내부접근이 허용된 사용자 park 생성
create user 'park'@'localhost' identified by '1111';

# 권한 확인
show grants for park@localhost;

# 2. cmd에서 park으로 접속 -> DB 확인
# window+R -> cmd -> mysql -u park -p -> show databases;

# 3. 사용자 park에게 test DB의 모든 테이블을 조회할 수 있는 권한 부여
grant select on test.* to 'park'@'localhost';

# 권한 확인 
show grants for park@localhost;

# 4. cmd에서 확인: DB 목록 확인 -> 테이블 목록 확인 -> copy_departments 조회
# show databases; -> use test; -> show test; -> select * from copy_departments;

# 5. cmd에서 확인: copy_departments 로우 1개 추가
# insert into copy_departments values('d010','IT');

# 6. 사용자 park에게 test DB의 copy_departments 테이블을 추가 권한 부여
grant insert on test.copy_departments to 'park'@'localhost';

# 권한 확인
show grants for park@localhost;

# 7. cmd에서 확인 : copy_departments 로우 1개 추가
# insert into copy_departments values('d010','IT'); -> select * from copy_departments;

# 8. 사용자 park에게 부여한 모든 권한 회수
revoke all privileges on test.* from 'park'@'localhost';
revoke all privileges on *.* from 'park'@'localhost';

# 권한 확인 
show grants for park@localhost;

# 9. 사용자 park 삭제
drop user 'park'@'localhost';

select host, user from mysql.user;