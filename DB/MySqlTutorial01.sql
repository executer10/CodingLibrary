#전체 데이터베이스 리스팅
SHOW DATABASES;

#`mysql`데이터 베이스 선택
USE mysql;

#테이블 리스팅
SHOW TABLES;

#특정 테이블의 구조
DESCRIBE db;

#`test` 데이터 베이스 선택
USE test;

#테이블 리스팅
SHOW TABLES;

#기존에 a1 데이터베이스가 존재한다면 삭제
DROP DATABASE IF EXISTS a1;

#새 데이터베이스(`a1`)생성
CREATE DATABASE a1;

#데이터베이스 추가 되었는지 확인
SHOW DATABASES;

#테이블 확인
SHOW TABLES;

#게시물 테이블 article(title, body)을 만듭니다.
#varchar(100) => 문자 저장 100개 저장 가능
#text => 문자 많이 저장 가능
CREATE TABLE article(
    title VARCHAR(100),
    `body` TEXT
);

#잘 추가되었는지 확인, 리스팅과 구조까지 확인
SHOW TABLES;
DESC article;

#-------여기까지 DDL-------
#-------DML 시작---------
#데이터 하나 추가(title = 제목, bodt = 내용)
INSERT INTO article
    SET title = '제목',
        `body` = '내용';

#데이터 조회(title만)
SELECT title FROM article;

#데이터 조회(title, body)
SELECT title, `body` FROM article;

#데이터 조회(*)
SELECT * FROM article;

#데이터 또 하나 추가(tytle = 제목, body = 내용)
INSERT INTO article
    SET title = '제목2',
        `body` = '내용2';

#데이터 조회(*, 어떤게 2번 게시물인지 알 수 없음)
SELECT * FROM article;

#테이블 구조 수정(id 칼럼 추가, first)
ALTER TABLE article ADD COLUMN id INT FIRST;


#데이터 조회(*, id 칼럼은 NULL)
SELECT * FROM article;
DESC article;

#기존 데이터에 id값 추가(id = 1, id is NULL)
UPDATE article
    SET id = 1
    WHERE id IS NULL;#where = 조건부

#데이터 조회(*, 둘 다 수정되어버림...)
SELECT * FROM article;

#기존 데이터 중 1개만 id를 2로 변경(LIMIT 1)
UPDATE article
    SET id = 2
    LIMIT 1;

#데이터 조회(*)
SELECT * FROM article;

#데이터 1개 추가(id = 3, title = 제목3, body = 내용3)
INSERT article
    SET id=3,
        title = "제목3",
        `body` = "내용3";

#데이터 조회(*)
SELECT * FROM article;

#2번 게시물, 데이터 삭제=> DELETE
DELETE FROM article
    WHERE id=2;
    
#데이터 조회(*)
SELECT * FROM article;

#-------------여기까지 DML--------------

#날짜 칼럼 추가 => regDate DATATIME
ALTER TABLE article ADD COLUMN regDate DATETIME AFTER id; #id컬럼 뒤에 위치

#테이블 구조 확인
SELECT * FROM article;

#1번 게시물의 비어있는 날짜정보 체우기(regDate = 2018-08-10 15:00:00)
UPDATE article
    SET regDate = '2018-08-10 15:00:00'
    WHERE id = 1;
    
#데이터 조회(*, 2번 게시물의 날짜 정보만 넣으면 됩니다.)
SELECT * FROM article;

#NOW() 함수 실행해보기
SELECT NOW(); #FROM DUAL 생략

#3번 게시물의 비어있는 날짜 정보 체움(NOW())
UPDATE article
    SET regDate = NOW()
    WHERE id = 3;

#데이터 조회
SELECT * FROM article;