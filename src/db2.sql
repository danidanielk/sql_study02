create table aug29_coffee(
c_name varchar2(10 char) primary key,
c_price number(5) not null,
c_kcal number(3) not null,
c_start date not null
);

insert into aug29_coffee values('아메리카노',3000,15,sysdate);
select*from aug29_coffee;
drop table aug29_coffee
--DDL 에서 Create 문을 다룰 수 있게 되었음!
--이제 비교적 쉬운 alter / drop / truncate 를 보자
--데이터 타입 변경 / 컬럼의 크기(용량) 변경 
alter table [테이블명] modify [컬럼명] [데이터타입(용량)];
alter table aug29_coffee modify c_name number(3); 
--값이 있는 상태에서 데이터 타입 변경하면 에러!
alter table aug29_coffee modify c_name varchar2(2 char); 
--값이 있는 상태에서 기존 값보다 용량을 적게 변경하면 에러!
-- 그래서 데이터 타입 변경 사항시 주의사항 : 해당 컬럼의 값을 모두 지워야 변경이 가능하다.

--컬럼명 변경
alter table [테이블명] rename column [기존컬럼명] to [바꿀 컬럼명];
alter table aug29_coffee rename column c_name to c_name2;

--컬럼 추가방법
alter table [테이블명] add [컬럼명] [데이터타입] [제약조건(생략가능)];
alter table aug29_coffee add c_taste varchar2(20 char); --not null 추가시에는 기존에 데이터가 없어야함.

--컬럼 삭제
alter table [테이블명] drop column [컬럼명];
alter table aug29_coffee drop column c_taste;
-------------------------------위 여기까지 얼터에대한 내용----------------------------

--테이블 내의 내용 지우기
truncate table [테이블명];
truncate table aug29_coffee; --테이블에 잇는 데이터를 삭제하지만 테이블의 구조 자체는 삭제하지 않음

--테이블 삭제 구조자체 (휴지통에넣기)
drop table [테이블명] cascade constraint;
drop table aug29_coffeecascade constraint;

--위에 휴지통에 넣은 테이블을 복원하기
flashback table [테이블명] to before drop;
flashback table aug_coffee to before drop;

--휴지통 비우기
purge recyclebin;

--휴지통에 넣자마자 비우기 (완전삭제)
drop table [테이블명] cascade constraint purge;
drop table aug29_coffee cascade constraint purge;
------------------------위 여기까지 DDL 정의어에대한 내용 사실상 신입한테 맡기지 않음! --------------------------
------------------------경력있는 DBA 들이 테이블을 만들어서 CRUD (DML)*** 정도만 하게끔 할 것---------------------------