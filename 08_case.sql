-- SQLite
-- 0819 복습

--ELSE 생략하는 경우 NULL값 지정됨

-- Q. gender가 1인 경우는 남자를 gender가 2인 경우에는 여자를 출력하시오.
select 
  id,
  CASE
    WHEN gender = 1 THEN '남자'
    WHEN gender = 2 then '여자'
  END
from healthcare
limit 3;

--• Q. 나이에 따라 청소년(~18), 청년(~30), 중장년(~64)로 출력하시오.
select id, age,
  CASE
    WHEN age <= 18 THEN '청소년'
    WHEN age <= 30 THEN '청년'
    WHEN age <= 64 THEN '중장년'
  END
FROM healthcare
limit 10;