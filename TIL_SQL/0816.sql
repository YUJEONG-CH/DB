-- SQLite

-- 데이터 입력
insert into classmates(name, age) values ('홍길동', 23);
insert into classmates(name, age, address) values ('홍길동', 30, '서울');
-- 테이블 삭제
drop table classmates;
-- 테이블 생성
create table classmates(
  id integer PRIMARY key,
  name text not null,
  age int not null,
  address text not NULL
);
-- 데이터 입력
INSERT into classmates values (1, '홍길동', 30, '서울');
INSERT into classmates (name, age, address) values ('홍길동', 30, '서울');
-- 데이터 여러개 입력
insert into classmates (name, age, address) values
('김철수', 30, '제주'),
('이호영', 26, '인천'),
('박민희', 29, '대구'),
('최혜영', 28, '전주');
-- 조회
select * from classmates;
select rowid, * from classmates;
select rowid, name from classmates limit 1 OFFSET 3;
select rowid, name from classmates limit 1 OFFSET 2;
select id, name from classmates where address='서울';
select DISTINCT age from classmates;
-- 데이터 삭제
delete from classmates where id =2;


insert into students (id, name, age) values (2, '홍길동', 13);
insert into students values (3, '박길동', 22);
insert into students (id, name) values (4, '이길동');
insert into students (id, name) values (5, '이길동');
select * from students;