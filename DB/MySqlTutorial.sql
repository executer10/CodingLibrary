-- 코드를 모두 실행 하기 위해서 드래그하고 F9실행
SHOW DATABASES;

# 명령어가 아닌 텍스트로 인식하는 방법
CREATE DATABASE `data`; 

# DB생성
CREATE DATABASE a4; 

# DB삭제
DROP DATABASE a4; 

# 만약 a4라는 데이터베이스가 존재하면 지운다는 조건.
DROP DATABASE IF EXISTS a4; 

# 데이터베이스 선택
USE mysql;

# 테이블 전부 출력
SHOW TABLES;

SELECT * FROM db;

# 데이터베이스 전체의 기본 문자 집합과 정렬 규칙을 설정합니다.
# 새로 생성되는 테이블에 적용되며, 기존 테이블에는 영향을 주지 않습니다.
ALTER DATABASE test CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 기존 테이블의 문자 집합과 정렬 규칙을 변경합니다.
# 테이블의 모든 문자열 컬럼(CHAR, VARCHAR, TEXT 등)에 적용됩니다.
# 이 명령은 테이블의 구조를 변경하므로 대용량 테이블의 경우 실행 시간이 오래 걸릴 수 있습니다.
ALTER TABLE article CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 특정 컬럼(title)의 문자 집합과 정렬 규칙을 개별적으로 변경합니다.
# VARCHAR(255)는 컬럼의 데이터 타입과 길이를 지정합니다.
# 이 명령은 title 컬럼만 변경하며 다른 컬럼에는 영향을 주지 않습니다.
ALTER TABLE article MODIFY title VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 특정 컬럼(BODY)의 문자 집합과 정렬 규칙을 개별적으로 변경합니다.
# TEXT는 대용량 문자열을 저장할 수 있는 데이터 타입입니다.
# 이 명령은 BODY 컬럼만 변경하며 다른 컬럼에는 영향을 주지 않습니다.
# 특히 긴 텍스트, 이모지, 다국어 텍스트 등을 저장할 때 유용합니다.
ALTER TABLE article MODIFY BODY TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;