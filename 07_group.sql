-- SQLite
-- 0818 복습

-- GROUP BY

-- 성(last_name)별 갯수
-- 기존 순서와 다르게 출력됨
select last_name, count(*) 
from users
group by last_name;

-- GROUP BY 활용 칼럼 제외, 집계함수 쓰기
select last_name, avg(age), count(*)
from users
group by last_name;

-- GROUP BY WHERE를 쓰고 싶다.
-- 100번 이상 등장한 성만 출력
select last_name, count(last_name)
from users
where count(last_name) >= 100
group by last_name;
-- >>> Parse에러

-- 조건에 따른 GROUP 하려면 HAVING절을 쓴다.
select last_name, count(last_name)
from users
group by last_name
HAVING count(last_name) >= 100;