-- SQLite
-- 0819 복습

-- 서브쿼리
-- 특정한 값을 메인 쿼리에 반환하여 활용하는 것
-- 메인 쿼리는 서브 쿼리의 칼럼을 이용할 수 었음


-- 1. 단일행 서브쿼리
-- where에서의 활용
-- Q. users에서 가장 나이가 작은 사람의 수는?
select count(*) 
from users
where age = (select min(age)
            from users);

-- Q. users에서 평균 계좌 잔고가 높은 사람의 수는?
select count(*)
from users
where balance > (select avg(balance)
                from users);

-- Q. users에서 유은정과 같은 지역에 사는 사람의 수는?
select count(*)
from users
where country = (select country
                from users
                where first_name = '은정' and last_name = '유');  

-- Q. 전체 인원과 평균 연봉, 평균 나이를 출력하세요.
select count(*), avg(balance), avg(age)
from users;

SELECT  
  (select count(*) from users) AS 총인원,
  (select avg(balance) from users) as 평균연봉,
  (select avg(age) from users) as 평균나이
;

-- 다중행 서브쿼리
-- Q. users에서 이은정과 같은 지역에 사는 사람의 수는?
select country, count(*)
from users
where country IN (select country from users where first_name = '은정' and last_name ='이')
GROUP BY country;

select count(*)
from users
where country = '전라북도'; --115
select count(*)
from users
where country = '경상북도'; --103

-- 다중칼럼 서브쿼리
-- Q. 특정 성씨에서 가장 어린 사람들의 이름과 나이
select last_name, first_name, age
from users
where (last_name, age) in(
        select last_name, min(age)
        from users
        group by last_name);