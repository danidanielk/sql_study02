-- default : 아무런 데이터를 입력하지 않은경우 지정한 데이터가 자동으로 입력된다.
create table example9(
col1 number(4) default 999
);
insert into example9 values(default);




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









--테이블 삭제 구조자체 (휴지통에넣기)
drop table [테이블명] cascade constraint;









--휴지통에 넣자마자 비우기 (완전삭제)
drop table [테이블명] cascade constraint purge;
drop table aug29_coffee cascade constraint purge;
drop table example9 cascade constraint purge;
drop table person cascade constraint purge; 







-- 테이블 확인하기
select * from tab;





-------------------------오늘 배운 내용 연습---------------------------
create table department (
d_class_no number(5) primary key,
d_name varchar2(30 char)not null
);

insert into department values(1000,'연극영화과');
insert into department values(1001,'사회복지과');
insert into department values(1002,'실내디자인과');

create table student (
s_school varchar2(30 char) default '조은대학교',
s_no number(5) primary key,
s_name varchar2(30 char)not null,
s_lv number(5) not null,
s_class_no number(5) not null,
	constraint code foreign key (s_class_no)
	references department (d_class_no)
	on delete cascade
);

insert into student values(default,001,'다니',2,1000);
insert into student values(default,002,'요셉',3,1001);
insert into student values(default,003,'병준',3,1002);
insert into student values(default,004,'세니',4,1000);
insert into student values(default,005,'수정',6,1001);
insert into student values(default,006,'소연',1,1000);

select * from department;
select * from student
order by s_class_no asc;

drop table department cascade constraint purge;
drop table student cascade constraint purge;
--------------------------------------------------------------------
-----------------------한번더..---------------------------------------

create table department(
d_school_name varchar2(30 char) default '멋진대학겨', 
d_code number(5) primary key,
d_class varchar(30 char) not null
); 

insert into department values(default,1000,'연극영화과');
insert into department values(default,1001,'사회복지과');
insert into department values(default,1002,'실내디자인과');
insert into department values(default,1003,'신학과');
insert into department values(default,1004,'정신과');
insert into department values(default,1005,'아동학과');

create table student (
s_school_name varchar2(30 char) default '멋진대학겨',
s_name varchar2(30 char) not null,
s_no number(5) primary key,
s_code number(5) not null,
	constraint code foreign key (s_code)
	references department (d_code)
	on delete cascade

);
insert into student values(default,'다니',100,1000);
insert into student values(default,'요셉',101,1001);
insert into student values(default,'병준',102,1002);
insert into student values(default,'수정',103,1003);
insert into student values(default,'세니',104,1004);
insert into student values(default,'소연',105,1005);


select * from department;
select * from student;

drop table department cascade constraint purge;
drop table student cascade constraint purge;