# 1번
create database movie
char set = utf8mb4;

# 2번
use movie;

create table film (
	film_id smallint not null auto_increment,
    title varchar(255) not null,
    description text not null,
    release_year year not null,
    production_company varchar(100) not null,
    primary key(film_id)
);
create table actor (
	actor_id smallint not null auto_increment,
    name varchar(45) not null,
    birth_date date,
    primary key(actor_id)
);
create table film_actor (
	actor_id smallint not null,
    film_id smallint not null,
    primary key(actor_id,film_id), 
    foreign key(actor_id) references actor(actor_id),
    foreign key(film_id) references film(film_id)
);

desc film_actor;
desc film;
desc actor;

# 3번
insert into film
values (1001, '초록물고기', '이창동감독의 데뷔작', 1997, '이스트필름'), 
	(1002,'접속', 'PC통신을 통해 신청자에게 접속하면서 생기는 로맨스', 1997, '명필름'),
    (1003, '8월의크리스마스', '허진호감독의 데뷔작', 1998, '우노필름'),
    (1004, '쉬리', '국내 첩보 액션 스릴러 영화', 1999, '(주)강제규필름'),
    (1005, '텔미썸딩', '이승현 감독의 멜로 영화', 1999, '쿠앤씨필름'),
    (1006, '시월애', '이승현 감독의 멜로 영화', 2000, '싸이더스');

insert into actor
values (1, '송강호', '1967-01-17'),
	(2, '한석규', '1964-11-03'),
    (3, '문성근', '1953-05-28'),
    (4, '심은하', '1972-09-23'),
    (5, '전도연', '1973-02-11'),
    (6, '이정재', '1981-10-30');

insert into film_actor
values (2, 1001), (3,1001), (2,1002), (5,1002), (2,1003), (4,1003), (1,1004), (2,1004), (2,1005), (4,1005), (6,1006); 

select * from film;
select * from actor;
select * from film_actor;

# 4번
select count(*) as '1999년 이후 제작된 영화 수'
from film
where release_year>='1999-01-01';

# 5번
select title as '1999년 개봉 영화'
from film
where release_year between '1999-01-01' and '1999-12-31';

# 6번 
select a.name as '쉬리 출연 배우'
from actor a, film_actor fa 
where a.actor_id = fa.actor_id and fa.film_id in (select f.film_id from film f, film_actor fa where f.film_id = fa.film_id and f.title like'쉬리');

# 7번
select concat(count(*), '편') as '한석규 배우 영화수'
from actor a, film_actor fa 
where a.actor_id=fa.actor_id and a.name like '한석규';

# 8번
select name as '이름', birth_date as '생년월일'
from actor
where birth_date between '1970-01-01' and '1979-12-31';

# 9번
create user 'hyun'@'localhost' identified by '1111';

grant select on movie.film to 'hyun'@'localhost';

show grants for hyun@localhost;