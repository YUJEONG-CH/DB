-- SQLite

-- users 테이블 생성
CREATE TABLE users (
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
age INTEGER NOT NULL,
country TEXT NOT NULL,
phone TEXT NOT NULL,
balance INTEGER NOT NULL
);

-- 테이블 확인 --users
.tables 

-- csv 파일 정보를 테이블에 적용하기
-- 같은디렉토리에 csv파일 있어야 함
$ .mode csv
$.import users.csv users

-- 들어갔나 확인
select count(*) from users;
--count(*)
--1000

--Q. users 테이블에서 age가 30 이상인 유저의 모든 컬럼 정보 조회
select * from users where age >= 30;

--Q. users 테이블에서 age가 30 이상인 유저의 이름만 조회하려면?
select first_name from users where age >= 30;

--Q. users 테이블에서 age가 30 이상, 성이 ‘김’인 사람의 나이와 이름만 조회하려면?
select age, first_name from users where age >= 30 and last_name ='김';

-- 주의
--Q. 키가 175이거나, 키가 183이면서 몸무게가 80인 사람
-- WHERE HEIGHT = 175 OR HEIGHT = 183 AND WEIGHT = 80
--Q. 키가 175 또는 183인 사람 중에서 몸무게가 80인 사람
-- WHERE (HEIGHT = 175 OR HEIGHT = 183) AND WEIGHT = 80

--레코드 개수 조회 count
select count(*) from users;

--• Q. 30살 이상인 사람들의 평균 나이는?
select avg(age) from users where age >= 30;
 --Q. 계좌 잔액(balance)이 가장 높은 사람과 그 액수를 조회하려면?
select first_name, max(balance) from users ;

--Q. 나이가 30 이상인 사람의 계좌 평균 잔액을 조회하려면?
select avg(balance) from users where age >= 30;

--Q. users 테이블에서 나이가 20대인 사람만 조회한다면?
select * from users where age like '2_';

--Q. users 테이블에서 지역 번호가 02인 사람만 조회한다면?
select * from users where phone like '02-%';

--Q. users 테이블에서 이름이 ‘준’으로 끝나는 사람만 조회한다면?
select * from users where first_name like '%준';

--Q. users 테이블에서 중간 번호가 5114인 사람만 조회한다면?
select * from users where phone like '%-5114-%';

--Q. users 에서 나이 순으로 오름차순 정렬하여 상위 10개만 조회한다면?
select * from users order by age asc limit 10;

--Q. 나이 순, 성 순으로 오름차순 정렬하여 상위 10개만 조회한다면?
select * from users order by age, last_name asc limit 10;

--Q. 계좌 잔액 순으로 내림차순 정렬하여 해당 유저의 성과 이름을 10개만 조회한다면?
select last_name, first_name from users order by balance desc limit 10;