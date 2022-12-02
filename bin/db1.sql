	
create table test(		--테이블 생성
t_name varchar2(5)
);
create table test2(		--테이블2 생성
t_name varchar2(5 char)
);
insert into test values('가나다');	--테이블에 컬럼 집어넣기 (오류 글자수초과)
insert into test2 values('가나다');	--테이블에 컬럼 집어넣기
drop table test cascade constraint purge;	--테이블 삭제
drop table test2 cascade constraint purge;	--테이블2 삭제




create table testnum(
t_num number(5), --12345나옴
t_flo float (5)  --12000나옴 안씀.
);

insert into testnum values(12345,12345);
select * from testnum;
drop table testnum cascade constraint purge;


--------------외래키 사용법-------------
create table example6(
ex6_id varchar(10 char) primary key
);
insert into example6 values('10');
insert into example6 values('20');
insert into example6 values('30');
select * from example6;

create table example7(
ex7_id varchar2(10 char),
constraint fk_ex7 foreign key(ex7_id)
	references example6(ex6_id) 
	on delete cascade 
);

insert into example7 values('10');
insert into example7 values('20');
insert into example7 values('30');
insert into example7 values('40'); 
--여기서 ex6_id가 10 인 칼럼을 지우면 어떻게 될까?
delete from example6 where ex6_id = '10';
select * from example7; 


-------------------------------------------------------------------------
-- 학과 테이블과 이것을 참조하는 학생 테이블을 만들어보자
-- 학과 테이블 : 학과코드(4자리 숫자), 학과이름(10 글자 이내)
-- 학생 테이블 : 학생번호 (3자리 숫자), 학생이름, 학생이 소속되어있는 학과의코드
-- 그 학과가 없어지면 이 학생 정보도 지워지게.

create table department(
department_num number(4)primary key,
department_name varchar2(10 char) not null
);

insert into department values(1001,'연극영화과');
insert into department values(1002,'사회복지과');
insert into department values(1003,'실내디자인과');

create table student(
s_no number(3) primary key,
s_name varchar(30 char) not null,
s_code number(4) not null,
	constraint fk_student foreign key(s_code)
	references department(department_num)
	on delete cascade
);

insert into student values(101,'다니',1001);
insert into student values(102,'요셉',1002);
insert into student values(103,'병준',1001);
insert into student values(104,'수정',1002);
insert into student values(105,'소연',1005);
select *from student

delete from department where department_num = 1001;
--학과 코드 지우면 그학과 학생들도 다지워짐
drop table department;
--테이블 삭제가 안됨 (참조된 테이블이 있어서)
drop table department cascade constraint purge;
--테이블 삭제 가능 (참조하고있는것 까지 전부 다 포함해서 테이블 지워라) 
--그치만 스튜던트 테이블은 살아있음.
drop table student;
--------------------------------------------------------------------------
-- check : 데이터의 값의 범위나 조건을 설정해서 조건에 해당하는 데이터만 허용한다.
create table example8(
col1 number(3) constraint ex8_check check (col1 between 1 and 9)
);

insert into example8 values(3);
--가능
insert into example8 values(10);
--불가능
drop table example8





-- default : 아무런 데이터를 입력하지 않은경우 지정한 데이터가 자동으로 입력된다.
create table example9(
col1 number(4) default 999
);

insert into example9 values(default);
insert into example9 values(null);
insert into example9 values(0);
insert into example9 values(11);
select * from example9;