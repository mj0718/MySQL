/* 
[DDL] create
create table [IF NOT EXISTS] 테이블명 (
	컬럼명 자료형, 
    컬럼명 자료형
);

[제약 조건]
primary key: 기본키 - 중복 허용X, null 허용X 				: 참조되는~ 부모
foreign key: 외래키 - 중복 허용, null 허용, 참조값만 허용  : 참조하는~ 자식

not null: null 허용X
auto_increment: 자동으로 1씩 증가
unique: 중복 허용X (유일 값), null 허용
check: 값의 범위나 종류 지정 (domain, 도메인), MySQL 8.0.16부터 지원
default: 기본값

*/

# 현재 DB 확인
select database();

# 테이블 생성
create table if not exists t1 (
	co1 int,
    co2 float
);

create table temp1 ( 
	one int primary key auto_increment, # 컬럼 레벨 방식
    two int not null,
    three int 
);

desc temp1;

# temp1 조회
select * from temp1;

-- insert into  테이블명(컬럼명, 컬럼명)
-- values (값1, 값2);

insert into temp1 values(1,1,1);
insert into temp1(two, three) values (2,2);
insert into temp1 values (100,100,100);
insert into temp1(two, three) values (3,3);

# Error - two의 not null 제약 조건 위배
insert into temp1(one, three) values (4,4);

# Error - one의 제약 조건 위배 => 중복값
insert into temp1 values(1,5,5);

insert into temp1(one, two) values(200,200);
insert into temp1(two, three) values(3,1);

# temp1 조회
select * from temp1;

create table temp2 (
	one int,
    two int unique,
    constraint pk_one primary key(one)  #테이블 레벨 방식
);

desc temp2;

# row 추가
insert into temp2 values(1,1);

# Error - one 제약 조건 위배 => null 허용 안 함
insert into temp2(two) values(2);

insert into temp2(one) values(3);

# Error - two 제약 조건 위배 -> 중복값
insert into temp2 values(2,1);

# temp2 조회
select * from temp2;

create table temp3 (
	gender char(1),
    age int default 1,
    constraint ch_gender check(gender in ('M','F')), 
    check(age>0)
);

desc temp3;

# row 추가
insert into temp3 values('M',5);
insert into temp3 values('f',6);
insert into temp3(age) values(29);
insert into temp3(gender) values('F');

# Error - gender 제약 조건 위배 => check 도메인 값 아님
insert into temp3 values('w',34);

# Error - age 제약 조건 위배 => check 도메인 값 아님
insert into temp3 values('F',0);

# Error - char 크기 넘어감
insert into temp3 values('Man',33);

# temp3 조회
select * from temp3;

# MySQL 버전 확인
select version();

create table temp4 (
	one int,
    two char(10),
    three float,
    four int,
    constraint pk_temp4 primary key(one, two, three)
);

desc temp4;

# row 추가
insert into temp4 values(1,1,1,1);
insert into temp4 values(1,2,2,2);

# Error - pk => 중복값
insert into temp4 values(1,2,2,3);

# Error - pk => null값
insert into temp4(one, three, four) values(3,3,3);

# temp4 조회
select * from temp4;

select * from temp1;

# [테이블 생성] 외래키 설정
create table temp5 (
	id int, 
    name varchar(50),
    constraint fk_id foreign key(id) references temp1(one)
);

desc temp5;

# row 추가
insert into temp5 values(1, '홍길동');

# Error - fk => pk에 없는 값 5를 추가
insert into temp5 values(5, '박보검');

insert into temp5(name) values('이미자');
insert into temp5 values (1, '해피');

select * from temp5;
select * from temp1;

/*
# [문제] 
# temp6 table 생성
<<컬럼>>
id: pk  -> temp1의 one 컬럼 참조, null 허용 X
name: varchar(30), null 허용 X
age: 1이상, null 허용 X
*/

create table temp6 (
	id int not null,
    name varchar(30) not null,
    age int not null,
    primary key(id), foreign key(id) references temp1(one), check(age>0)
);

desc temp6;

# temp6 데이터 추가
insert into temp6 values(1,'홍길동',31);
insert into temp6 values(5, '박보검', 33); # Error FK - 참조값 
insert into temp6 values(1, '이미자', 35); # Error PK - 중복

select * from temp6;














