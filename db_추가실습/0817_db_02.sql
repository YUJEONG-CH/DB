-- SQLite
--실습2_0817

select * from healthcare limit 3;

--.sqlite랑 csv같은 폴더에있어야함
.import health.csv healthcare 

.schema healthcare

-- 문1.추가되어 있는 모든 데이터의 수를 출력하시오.
select count(*) from healthcare;

--2. 연령 코드(age)의 최대, 최소 값을 모두 출력하시오.
select max(age), min(age) from healthcare;

--3. 신장(height)과 체중(weight)의 최대, 최소 값을 모두 출력하시오.
select max(height), min(height), max(weight), min(weight) from healthcare;

--4. 신장(height)이 160이상 170이하인 사람은 몇 명인지 출력하시오.
select count(*) from healthcare where height >=160 and height <= 170;

--5. 음주(is_drinking)를 하는 사람(1)의 허리 둘레(waist)를 높은 순으로 5명 출력하시오.
select waist from healthcare where is_drinking = 1 and waist <> '' order by waist desc limit 5;
select waist, id from healthcare where is_drinking = 1 and waist != '' order by waist desc limit 5;
-->'' 값으로나옴...

--6. 시력 양쪽(va_left, va_right)이 1.5이상이면서 음주(is_drinking)를 하는 사람의 수를 출력하시오.
select count(*) from healthcare where va_left >= 1.5 and va_right >= 1.5 and is_drinking =1;

--7. 혈압(blood_pressure)이 정상 범위(120미만)인 사람의 수를 출력하시오.
select count(*) from healthcare where blood_pressure < 120;

--8. 혈압(blood_pressure)이 140이상인 사람들의 평균 허리둘레(waist)를 출력하시오.
select avg(waist) from healthcare where blood_pressure >= 140;

--9. 성별(gender)이 1인 사람의 평균 키(height)와 평균 몸무게(weight)를 출력하시오.
select avg(height), avg(weight) from healthcare where gender = 1;

--10. 키가 가장 큰 사람 중에 두번째로 무거운 사람의 id와 키(height), 몸무게(weight)를 출력하시오.
select id, height, weight from healthcare where height = 195 order by weight desc  limit 1 offset 1;
-----------------------------------------------------



--11. BMI가 30이상인 사람의 수를 출력하시오. BMI는 체중/(키*키)의 계산 결과이다.
select count(*)
from healthcare 
where weight/((height*0.01)*(height*0.01)) >= 30;

--12. 흡연(smoking)이 3인 사람의 BMI지수가 제일 높은 사람 순서대로 5명의 id와 BMI를 출력하시오.
select id, weight/((height*height)/100) BMI
from healthcare where smoking = 3 order by BMI limit 5;