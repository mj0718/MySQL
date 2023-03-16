use employees;

show tables;

create table customer(
	id int not null,
    name varchar(50) not null,
	primary key(id)
);

create table order_list(
	order_id int not null,
    id int not null,
    product_name varchar(50) not null,
    primary key(order_id),
    foreign key(id) references customer(id)
);

desc customer;
desc order_list;


# row 추가
insert into customer 
values (1, '홍길동'), (2, '이미자'), (3, '박보검'), (4, '나가자'), (5, '하늘');

insert into order_list
values (1001, 1, '초코릿'), (1002, 1, '샴푸'), (1003, 2, '책상'), (1004, 5, '티슈');

# 외래키 설정 변경
set foreign_key_checks=0;

# [customer] id가 5인 로우 삭제
delete from customer 
where id=5;

# 테이블 조회
select * from customer;
select * from order_list;

# [inner join] ==========================================
# 조인에 참여하는 로우(데이터)만 표현 => 교집합
select *
from customer c INNER JOIN order_list o
	on c.id=o.id;

select * 
from customer c, order_list o
where c.id=o.id;

# [left join] ===========================================
# customer table 기준으로 조인에 참여하지 않은 로우 포함 
select *
from customer c LEFT JOIN order_list o
	on c.id=o.id;

# customer table 기준으로 조인에 참여하지 않은 로우만 조회
select *
from customer c LEFT JOIN order_list o
	on c.id=o.id
where o.order_id is null;

# [right join] ==========================================
# order_list 기준으로 조인에 참여하지 않은 로우 포함 
select * 
from customer c RIGHT JOIN order_list o
	on c.id=o.id;

# order_list 기준으로 조인에 참여하지 않은 로우만 조회 
select * 
from customer c RIGHT JOIN order_list o
	on c.id=o.id
where c.id is null;

# [full outer join] ==========================================
# MySQL은 full outer join을 지원하지 않음
# 합집합
select *
from customer c left join order_list o on c.id=o.id 
union 
select *
from customer c right join order_list o on c.id=o.id;

# 합집합 - 교집합
select *
from customer c left join order_list o on c.id=o.id 
where o.id is null
union 
select *
from customer c right join order_list o on c.id=o.id
where c.id is null;
