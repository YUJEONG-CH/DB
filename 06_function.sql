-- SQLite
--0818 복습

-- 문자열 합치기 ||
-- (성+이름)출력, 5명만
select last_name || first_name 
from users
limit 5;


-- 문자열 길이 LENGTH
select length(first_name), first_name 이름 
from users
limit 5;

-- 문자열 변경 REPLACE
-- phone 에서 - 없애기
select first_name, phone, REPLACE(phone, '-', '')
from users
limit 5;

-- 숫자 활용
-- 나머지
select mod(5,2);

-- 올림, 내림, 반올림
select ceil(3.14), floor(3.14), round(3.14);

--9의 제곱근
select sqrt(9);

--9^2
select power(9,2);
