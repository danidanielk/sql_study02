	
create table test(		--���̺� ����
t_name varchar2(5)
);
create table test2(		--���̺�2 ����
t_name varchar2(5 char)
);
insert into test values('������');	--���̺� �÷� ����ֱ� (���� ���ڼ��ʰ�)
insert into test2 values('������');	--���̺� �÷� ����ֱ�
drop table test cascade constraint purge;	--���̺� ����
drop table test2 cascade constraint purge;	--���̺�2 ����




create table testnum(
t_num number(5), --12345����
t_flo float (5)  --12000���� �Ⱦ�.
);

insert into testnum values(12345,12345);
select * from testnum;
drop table testnum cascade constraint purge;


--------------�ܷ�Ű ����-------------
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
--���⼭ ex6_id�� 10 �� Į���� ����� ��� �ɱ�?
delete from example6 where ex6_id = '10';
select * from example7; 


-------------------------------------------------------------------------
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
--------------------------------------------------------------------------
-- check : �������� ���� ������ ������ �����ؼ� ���ǿ� �ش��ϴ� �����͸� ����Ѵ�.
create table example8(
col1 number(3) constraint ex8_check check (col1 between 1 and 9)
);

insert into example8 values(3);
--����
insert into example8 values(10);
--�Ұ���
drop table example8





-- default : �ƹ��� �����͸� �Է����� ������� ������ �����Ͱ� �ڵ����� �Էµȴ�.
create table example9(
col1 number(4) default 999
);

insert into example9 values(default);
insert into example9 values(null);
insert into example9 values(0);
insert into example9 values(11);
select * from example9;