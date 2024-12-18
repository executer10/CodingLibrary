# a5 데이터베이스 삭제/생성/선택
DROP DATABASE IF EXISTS a5;
CREATE DATABASE a5;
USE a5;

# 부서(dept) 테이블 생성 및 홍보부서 기획부서 추가
CREATE TABLE dept(
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    #UNIQUE = 데이터 중복 불가
    `name` VARCHAR(20) NOT NULL UNIQUE 
);

INSERT INTO dept
    SET regDate = NOW(),
        `name` = "기획";
        
INSERT INTO dept
    SET regDate = NOW(),
        `name` = "홍보";
        
SELECT * FROM dept;

# 사원(emp) 테이블 생성 및 홍길동사원(홍보부서), 홍길순사원(홍보부서), 임꺽정사원(기획부서) 추가
CREATE TABLE emp(
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    deptName VARCHAR(20) NOT NULL,
    `name` VARCHAR(20) NOT NULL
);

INSERT INTO emp
    SET regDate = NOW(),
        deptName = "홍보",
        `name` = "홍길동";
INSERT INTO emp
    SET regDate = NOW(),
        deptName = "홍보",
        `name` = "홍길순";
INSERT INTO emp
    SET regDate = NOW(),
        deptName = "기획",
        `name` = "임꺽정";
        
SELECT * FROM dept;
SELECT * FROM emp;

# 홍보를 마케팅으로 변경 
UPDATE dept
    SET `name` = "마케팅"
    WHERE `name` = "홍보";

UPDATE emp
    SET dept = "마케팅"
    WHERE deptName = "홍보";
    
# 마케팅을 홍보로 변경
UPDATE dept
    SET `name` = "홍보"
    WHERE `name` = "마케팅";

# 구조를 변경하기로 결정(사원 테이블에서, 이제는 부서를 이름이 아닌 번호로 기억)
ALTER TABLE emp DROP COLUMN deptName;
ALTER TABLE emp ADD COLUMN deptNo INT UNSIGNED NOT NULL AFTER regDate;

UPDATE emp SET deptNo =3
WHERE id = 3;

UPDATE emp 
SET deptNo =2
WHERE id = 3;

SELECT * FROM dept;
SELECT * FROM emp;

# 사장님께 드릴 인명록을 생성
SELECT * FROM emp;
#사장님께서 부서 번호가 아니라 부서명을 알고 싶어 하신다.
#그래서 dept테이블 조회법을 알려드리고 혼이났다
SELECT * FROM emp, dept;

#사장님께 드릴 인명록을 생성(v3, 부서명 포함, 올바른 조인 툴(ON)적용)
#보고용으로 좀 더 편하게 보여지도록 고쳐야 한다고 지적받음
SELECT e.id AS `사원번호`
        , e.regDate AS `입사일`
        , e.name AS `사원명`
        , d.name AS `부서명`
    FROM emp AS e
    INNER JOIN dept AS d
    ON e.deptNo = d.id

#사장님께 드릴 인명록을 생성(v4, 사장님께서 보시기에 편한 칼럼명(AS))