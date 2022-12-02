create table aug29_coffee(
c_name varchar2(10 char) primary key,
c_price number(5) not null,
c_kcal number(3) not null,
c_start date not null
);

insert into aug29_coffee values('�Ƹ޸�ī��',3000,15,sysdate);
select*from aug29_coffee;
drop table aug29_coffee
--DDL ���� Create ���� �ٷ� �� �ְ� �Ǿ���!
--���� ���� ���� alter / drop / truncate �� ����
--������ Ÿ�� ���� / �÷��� ũ��(�뷮) ���� 
alter table [���̺��] modify [�÷���] [������Ÿ��(�뷮)];
alter table aug29_coffee modify c_name number(3); 
--���� �ִ� ���¿��� ������ Ÿ�� �����ϸ� ����!
alter table aug29_coffee modify c_name varchar2(2 char); 
--���� �ִ� ���¿��� ���� ������ �뷮�� ���� �����ϸ� ����!
-- �׷��� ������ Ÿ�� ���� ���׽� ���ǻ��� : �ش� �÷��� ���� ��� ������ ������ �����ϴ�.

--�÷��� ����
alter table [���̺��] rename column [�����÷���] to [�ٲ� �÷���];
alter table aug29_coffee rename column c_name to c_name2;

--�÷� �߰����
alter table [���̺��] add [�÷���] [������Ÿ��] [��������(��������)];
alter table aug29_coffee add c_taste varchar2(20 char); --not null �߰��ÿ��� ������ �����Ͱ� �������.

--�÷� ����
alter table [���̺��] drop column [�÷���];
alter table aug29_coffee drop column c_taste;
-------------------------------�� ������� ���Ϳ����� ����----------------------------

--���̺� ���� ���� �����
truncate table [���̺��];
truncate table aug29_coffee; --���̺� �մ� �����͸� ���������� ���̺��� ���� ��ü�� �������� ����

--���̺� ���� ������ü (�����뿡�ֱ�)
drop table [���̺��] cascade constraint;
drop table aug29_coffeecascade constraint;

--���� �����뿡 ���� ���̺��� �����ϱ�
flashback table [���̺��] to before drop;
flashback table aug_coffee to before drop;

--������ ����
purge recyclebin;

--�����뿡 ���ڸ��� ���� (��������)
drop table [���̺��] cascade constraint purge;
drop table aug29_coffee cascade constraint purge;
------------------------�� ������� DDL ���Ǿ���� ���� ��ǻ� �������� �ñ��� ����! --------------------------
------------------------����ִ� DBA ���� ���̺��� ���� CRUD (DML)*** ������ �ϰԲ� �� ��---------------------------