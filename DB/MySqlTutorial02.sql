#기존에 a2 데이터베이스가 존재한다면 삭제
DROP DATABASE IF EXISTS a2;

#새 데이터베이스(`a2)생성
CREATE DATABASE a2;

#새 데이터베이스(`a2`)선택
USE a2;

#article 테이블 생성(id, regDate, title, body)
CREATE TABLE article(
    id INT,
    regDate DATETIME,
    title VARCHAR(100),
    `body` TEXT
);

#article 테이블 조회(*)
SELECT id, regDate, title, `body` 
    FROM article;
    
#article 테이블에 data insert (regDate = NOW(), title = '제목', body = '내용')
INSERT INTO article
    SET regDate = NOW(),
        title = '제목',
        `body` = '내용';

#article 테이블에 data insert (regDate = NOW(), title = '제목', body = '내용')
INSERT INTO article
    SET regDate = NOW(),
        title = '제목',
        `body` = '내용';
        
# article 테이블 조회(*)
##id가 NULL인 데이터 생성이 가능하다?
SELECT * FROM article;


#id 데이터는 꼭 필수이기 때문에 NULL을 허용하지 않게 바꾼다.(alter table, not null)
##기존의 NULL값 때문에 경고가 뜬다.(하지만 난 뜨지 않았다?)
##기존의 NULL값이 0으로 바뀐다.
ALTER TABLE article MODIFY COLUMN id INT NOT NULL;



#article 테이블 조회(*)
SELECT * FROM article;

DESC article;


#생각해보니 모든 행(row)의 id 값은 유니크 해야한다.(ADD PRIMARY KEY(id))
##오류가 난다. 왜냐하면 기존의 데이터 중에서 중복되는게 있기 때문에
ALTER TABLE article MODIFY COLUMN id INT NOT NULL PRIMARY KEY;
ALTER TABLE article ADD PRIMARY KEY(id); # 둘 중 하나 아무거나 가능함

#id가 0인 것 중에서 1개 id를 1로 바꾼다.
UPDATE article
    SET id = 1
    LIMIT 1;
    
#id가 0인것을 id 2로 바꾼다.
UPDATE article
    SET id = 2
    WHERE id = 0;
    
#생각해 보니 모든 행(row)의 id 값은 유니크 해야한다.(ADD PRIMARY KEY(id))
##이제 잘 된다.
ALTER TABLE article ADD PRIMARY KEY(id);


#id 칼럼에 auto_increment를 건다.
##PRIMARY KEY는 이미 적용됬다면 추가로 작성하면 에러 발생.
## auto_increment를 걸기전에 해당 칼럼은 무조건 key여야 한다.
## auto_increment는 1부터 숫자를 자동으로 넘버링 해준다.
ALTER TABLE article MODIFY COLUMN id INT NOT NULL AUTO_INCREMENT;

# article 테이블 구조확인
DESC article;

#나머지 칼럼 모두에도 not null을 적용해주세요.
ALTER TABLE article MODIFY COLUMN regDate DATETIME NOT NULL;
ALTER TABLE article MODIFY COLUMN title VARCHAR(100) NOT NULL;
ALTER TABLE article MODIFY COLUMN `body` TEXT NOT NULL;

#id 칼럼에 UNSIGNED 속성을 추가하세요.(
##UNSIGNED = 음수 불가)
##UNSIGNED의 순서: type 다음.
ALTER TABLE article MODIFY COLUMN id INT UNSIGNED NOT NULL AUTO_INCREMENT;

#작성자(writer) 칼럼을 title 칼럼 다음에 추가해 주세요.
ALTER TABLE article ADD COLUMN writer VARCHAR(20) NOT NULL AFTER title;

#작성자(writer) 칼럼의 이름을 nickname으로 변경해주세요. (ALTER TABLE article CHANGE `oldName` `newName` TYPE 조건)
ALTER TABLE article CHANGE writer nickname VARCHAR(20) NOT NULL;

#nickname 칼럼의 위치를 body 밑으로 보내주세요.(MODIFY COLUMN nickname)
ALTER TABLE article MODIFY COLUMN nickname VARCHAR(20) NOT NULL AFTER `body`;

DESC article;

SELECT * FROM article;
#hit 조회수 칼럼 추가 한 후 삭제해주세요.
ALTER TABLE article ADD COLUMN hit INT UNSIGNED NOT NULL DEFAULT 0;

INSERT INTO article
    SET regDate = NOW(),
        title = 'test',
        `body` = 'test',
        nickname = 'test';

ALTER TABLE article DROP COLUMN hit;
##id 순서 정렬 및 시작지점 설정(비어있는 곳에 번호를 지정하면 그곳을 체워준 후 진행)
ALTER TABLE article AUTO_INCREMENT = 5;

#hit 조회수 칼럼을 다시 추가
ALTER TABLE article ADD COLUMN hit INT UNSIGNED NOT NULL DEFAULT 0;

#기존의 비어있는 닉네임 채우어넣기(무명)
UPDATE article
    SET nickname= '무명';
    
UPDATE article
    SET nickname= '';
    WHERE nickname= '무명';

UPDATE article
    SET nickname= '무명';
    WHERE id IN(1,2,3);

#article 테이블에 데이터 추가(regDate = NOW(), title = '제목3', body = '내용3', nickname = '홍길순', hit = 10)
INSERT INTO article
    SET regDate= NOW(),
        title = "제목3",
        `body` = "내용3",
        nickname = "홍길순",
        hit = 10;
        
#article 테이블에 데이터 추가(regDate = NOW(), title = '제목4', body = '내용4', nickname = '홍길동', hit = 55)
INSERT INTO article (regDate, title, `body`, nickname, hit
) VALUES(
NOW(), '제목', '내용', '홍길동', 55
);

#article 테이블에 데이터 추가(regDate = NOW(), title = '제목5', body = '내용5', nickname = '홍길동', hit = 10)
INSERT INTO article VALUES(7, NOW(), '제목', '내용', '홍길동', 10);

#article 테이블에 데이터 추가(regDate = NOW(), title = '제목6', body = '내용6', nickname = '임꺽정', hit = 100)
INSERT INTO article
    SET regDate= NOW(),
        title = "제목",
        `body` = "내용",
        nickname = "임꺽정",
        hit = 100;

#조회수 가장 많은 게시물 3개만 출력.(힌트 : ORDER BY, LIMIT
##ASC = 오름차순, DESC = 내림차순(반대 순서)
SELECT * 
    FROM article
    ORDER BY hit DESC
    LIMIT 3;
    
#작성자명이 '홍길'로 시작하는 게시물만 출력. 힌트:where 조건1 AND 조건2
## %가 앞에 있으면, '홍길'전의 단어가 무엇이 와도 상관없고,
## %가 뒤에 있으면, '홍길'후의 단어가 무엇이 와도 상관없다.
## 연산 속도때문에 필요한 경우에만 사용할 것.
SELECT *
    FROM article
    WHERE nickname LIKE '홍길%';
    
#조회수가 10이상 55이하 인것만 보여주세요. 힌트: WHERE 조건1 AND 조건2
SELECT *
    FROM article
    WHERE hit >=10 
    AND hit <=55;
    
SELECT *
    FROM article
    WHERE hit BETWEEN 10 AND 55;
    
#작성자가 '무명'이 아니고, 조회수가 50 이하인 것만 보여주세요. 힌트: !=
SELECT *
    FROM article
    WHERE nickname != '무명'
    AND hit <= 50;
    
#작성자가 '무명'이거나 조회수가 55 이상인 게시물을 보여주세요. 힌트: OR
SELECT *
    FROM article
    WHERE nickname = '무명'
    OR hit >=55;