/*
[사용자 추가]
create user '아이디'@'localhost' identified by '비밀번호'; -> 내부접근
create user '아이디'@'%' identified by '비밀번호'; -> 외부접근

[사용자 삭제]
drop user '아이디'@'localhost'; 
drop user '아이디'@'%';
*/

# DB 목록
show databases;
# mysql DB 선택
use mysql;
# 테이블 목록
show tables;
show tables like 'user';
# user 테이블 구조
desc user;
# user 테이블 조회
select * from user;

select host, user from user;

# 사용자 추가
create user 'kim'@'localhost' identified by '1111';
create user 'kim'@'%'identified by '1111';

# 사용자 추가 확인
select host, user from mysql.user;

# 사용자 삭제=================================================
drop user kim@localhost;
drop user kim@'%';

# 사용자 삭제 확인
select host, user from mysql.user;
