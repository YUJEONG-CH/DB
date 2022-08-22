-- SQLite
-- 0819 추가실습

-- 1. 모든 테이블의 이름을 출력하세요.
.tables
--albums          employees       invoices        playlists
--artists         genres          media_types     tracks
--customers       invoice_items   playlist_track

-- 2. 모든 테이블의 데이터를 확인해보세요.
.schema

-- 3. 앨범(albums) 테이블의 데이터를 출력하세요.
-- 단, `Title`을 기준으로 내림차순해서 5개까지 출력하세요.
select * from albums
ORDER by Title desc limit 5;

-- 4. 고객(customers) 테이블의 행 개수를 출력하세요.
-- 단, 컬럼명을 `고객 수`로 출력하세요
select count(*) '고객 수' from customers;

-- 5. 고객(customers) 테이블에서 고객이 사는 나라가 `USA`인 고객의 `FirstName`, `LastName`을 출력하세요.
--  단, 각각의 컬럼명을 `이름`, `성`으로 출력하고, `이름`을 기준으로 내림차순으로 5개까지 출력하세요.
select FirstName 이름, LastName 성
from customers
where Country = 'USA'
order by 이름 desc limit 5;

-- 6. 송장(invoices) 테이블에서 `BillingPostalCode`가 `NULL` 이 아닌 행의 개수를 출력하세요.
-- 단, 컬렴명을 `송장수`로 출력하세요.
select count(*) 송장수
from invoices
where BillingPostalCode != 'NULL';

select DISTINCT BillingPostalCode
from invoices;

-- 7. 송장(invoices) 테이블에서 `BillingState`가 `NULL` 인 데이터를 출력하세요.
-- 단, `InvoiceDate`를 기준으로 내림차순으로 5개까지 출력하세요.
select BillingState, InvoiceDate
from invoices
where BillingState IS NULL
ORDER by InvoiceDate desc limit 5;

-- 8. 송장(invoices) 테이블에서 `InvoiceDate`의 년도가 `2013`인 행의 개수를 출력하세요.
--  `strftime`를 검색해서 활용해보세요.
select count(*)
from invoices
where substr(InvoiceDate,1,4) = '2013';

-- 9. 고객(customers) 테이블에서 `FirstName`이 `L` 로 시작하는 고객의 `CustomerId`, `FirstName`, `LastName`을 출력하세요.
-- 단, 각각의 컬럼명을 `고객ID`, `이름`,`성`으로 출력하고, `고객ID`을 기준으로 오름차순으로 출력하세요.
select CustomerId 고객ID, FirstName 이름, LastName 성
from customers
where substr(FirstName, 1,1) ='L';

-- 10. 고객(customers) 테이블에서 각 나라의 고객 수와 해당 나라 이름을 출력하세요.
-- 단, 각각의 컬렴명을 `고객 수`,`나라`로 출력하고, 고객 수 상위 5개의 나라만 출력하세요.
select count(*) '고객 수', Country 나라
from customers
GROUP BY Country
ORDER by count(*) DESC
limit 5;

-- 11. 앨범(albums) 테이블에서 가장 많은 앨범이 있는 Artist의 `ArtistId`와 `앨범 수`를 출력하세요.
select ArtistId, count(*)
from albums
group by ArtistId
ORDER by count(*) DESC limit 1;

-- 12. 앨범(albums) 테이블에서 보유 앨범 수가 10개 이상인 Artist의 `ArtistId`와 `앨범 수` 출력하세요
-- 단, 앨범 수를 기준으로 내림차순으로 출력하세요.
-- 집계함수를 where절에 사용 불가능 > 서브쿼리...
select ArtistId, count(*)
from albums
where count(*) = (select count(*) from albums  )

>= 10
group by ArtistId
ORDER by count(*) DESC;



select count(*), ArtistId
from albums
where count(*) = (select ArtistId, count(*)
                  from albums
                  group by ArtistId
                  ORDER by count(*) DESC;

-- 13. 고객(customers) 테이블에서 `State`가 존재하는 고객들을 
-- `Country` 와 `State`를 기준으로 그룹화해서 각 그룹의 `고객 수`, `Country`, `State` 를 출력하세요.
-- 단, `고객 수`, `Country` 순서 기준으로 내림차순으로 5개까지 출력하세요.

select Country, count(*), State
from customers
group by Country, State
ORDER by Country desc limit 5;