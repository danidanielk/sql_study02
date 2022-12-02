-- default : �ƹ��� �����͸� �Է����� ������� ������ �����Ͱ� �ڵ����� �Էµȴ�.
create table example9(
col1 number(4) default 999
);
insert into example9 values(default);




-- �а� ���̺�� �̰��� �����ϴ� �л� ���̺��� ������
-- �а� ���̺� : �а��ڵ�(4�ڸ� ����), �а��̸�(10 ���� �̳�)
-- �л� ���̺� : �л���ȣ (3�ڸ� ����), �л��̸�, �л��� �ҼӵǾ��ִ� �а����ڵ�
-- �� �а��� �������� �� �л� ������ ��������.

create table department(
department_num number(4)primary key,
department_name varchar2(10 char) not null
);

insert into department values(1001,'���ؿ�ȭ��');
insert into department values(1002,'��ȸ������');
insert into department values(1003,'�ǳ������ΰ�');

create table student(

s_no number(3) primary key,
s_name varchar(30 char) not null,
s_code number(4) not null,
	constraint fk_student foreign key(s_code)
	references department(department_num)
	on delete cascade
);

insert into student values(101,'�ٴ�',1001);
insert into student values(102,'���',1002);
insert into student values(103,'����',1001);
insert into student values(104,'����',1002);
insert into student values(105,'�ҿ�',1005);
select *from student

delete from department where department_num = 1001;
--�а� �ڵ� ����� ���а� �л��鵵 ��������
drop table department;
--���̺� ������ �ȵ� (������ ���̺��� �־)
drop table department cascade constraint purge;
--���̺� ���� ���� (�����ϰ��ִ°� ���� ���� �� �����ؼ� ���̺� ������) 
--��ġ�� ��Ʃ��Ʈ ���̺��� �������.
drop table student;









--���̺� ���� ������ü (�����뿡�ֱ�)
drop table [���̺��] cascade constraint;









--�����뿡 ���ڸ��� ���� (��������)
drop table [���̺��] cascade constraint purge;
drop table aug29_coffee cascade constraint purge;
drop table example9 cascade constraint purge;
drop table person cascade constraint purge; 







-- ���̺� Ȯ���ϱ�
select * from tab;





-------------------------���� ��� ���� ����---------------------------
create table department (
d_class_no number(5) primary key,
d_name varchar2(30 char)not null
);

insert into department values(1000,'���ؿ�ȭ��');
insert into department values(1001,'��ȸ������');
insert into department values(1002,'�ǳ������ΰ�');

create table student (
s_school varchar2(30 char) default '�������б�',
s_no number(5) primary key,
s_name varchar2(30 char)not null,
s_lv number(5) not null,
s_class_no number(5) not null,
	constraint code foreign key (s_class_no)
	references department (d_class_no)
	on delete cascade
);

insert into student values(default,001,'�ٴ�',2,1000);
insert into student values(default,002,'���',3,1001);
insert into student values(default,003,'����',3,1002);
insert into student values(default,004,'����',4,1000);
insert into student values(default,005,'����',6,1001);
insert into student values(default,006,'�ҿ�',1,1000);

select * from department;
select * from student
order by s_class_no asc;

drop table department cascade constraint purge;
drop table student cascade constraint purge;
--------------------------------------------------------------------
-----------------------�ѹ���..---------------------------------------

create table department(
d_school_name varchar2(30 char) default '�������а�', 
d_code number(5) primary key,
d_class varchar(30 char) not null
); 

insert into department values(default,1000,'���ؿ�ȭ��');
insert into department values(default,1001,'��ȸ������');
insert into department values(default,1002,'�ǳ������ΰ�');
insert into department values(default,1003,'���а�');
insert into department values(default,1004,'���Ű�');
insert into department values(default,1005,'�Ƶ��а�');

create table student (
s_school_name varchar2(30 char) default '�������а�',
s_name varchar2(30 char) not null,
s_no number(5) primary key,
s_code number(5) not null,
	constraint code foreign key (s_code)
	references department (d_code)
	on delete cascade

);
insert into student values(default,'�ٴ�',100,1000);
insert into student values(default,'���',101,1001);
insert into student values(default,'����',102,1002);
insert into student values(default,'����',103,1003);
insert into student values(default,'����',104,1004);
insert into student values(default,'�ҿ�',105,1005);


select * from department;
select * from student;

drop table department cascade constraint purge;
drop table student cascade constraint purge;