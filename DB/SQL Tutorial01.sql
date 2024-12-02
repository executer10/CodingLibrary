

CREATE DATABASE naver_db;
use naver_db;

DROP TABLE IF EXISTS member;

CREATE TABLE member(
	member_id CHAR(8) NOT NULL PRIMARY KEY
    , member_name VARCHAR(10) NOT NULL
    , member_number TINYINT NOT NULL
    , addr CHAR(2) NOT NULL
    , age INT CHECK(age >= 19)
    , phone1 CHAR(3) NULL
    , phone2 CHAR(8) NULL
    , height TINYINT UNSIGNED NULL
    , debut_date DATE DEFAULT NOW()
);


ALTER table member
MODIFY debut_date DATETIME DEFAULT NOW();

create table bye(
	num int AUTO_INCREMENT PRIMARY KEY #AUTO_INCREMENT= 자동 증가id
    , member_id char(8) not null
    , prod_name CHAR(6) not null
    , group_name CHAR(4) null
    , price int UNSIGNED not null
    , amount SMALLINT UNSIGNED not null
    , FOREIGN KEY(member_id) REFERENCES member(member_id)
);

INSERT INTO member(member_id, member_name, member_number, addr, phone1, phone2, height, debut_date)
VALUES('hong1234', '홍길동', 4, '울산', null, null, null, null);

INSERT INTO member(member_id, member_name, member_number, addr, age, phone1, phone2, height, debut_date)
values('java1234', '정자바', 2, '울산', 20, '010', '11112222', null, null);

INSERT INTO member(member_id, member_name, member_number, addr, age, phone1, phone2, height)
values('python1', '정자바', 2, '울산', 20, '010', '11112222', null);

INSERT INTO bye(member_id, prod_name, group_name, price, amount)
values('hong1234', '코트', '상의', 10000, 1);

-- DELETE from member where member_id = 'hong1234';

select * from member;
select * from bye;

desc member;



