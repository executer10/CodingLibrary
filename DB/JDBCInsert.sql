DROP DATABASE IF EXISTS jdbc_article_manager;
CREATE DATABASE jdbc_article_manager;
USE jdbc_article_manager;


CREATE TABLE article(
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT
    , regDate DATETIME NOT NULL
    , updateDate DATETIME NOT NULL
    , title VARCHAR(100) NOT NULL
    , `body` TEXT NOT NULL
);

SELECT * FROM article;
DESC article;

INSERT INTO article
    SET regDate = NOW()
        , updateDate = NOW()
        , title = CONCAT('제목_', RAND())
        , `body` = CONCAT('내용_', RAND());
        
        
SELECT * FROM article;

SELECT * FROM article
ORDER BY id DESC;



INSERT INTO `member`
    SET regDate = NOW()
        , updateDate = NOW()
        , loginId = 'user1'
        , loginPw = '1234'
        , `name` = '유저1';
        
SELECT * FROM article;

SELECT * FROM `member`;