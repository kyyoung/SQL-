--��(view)
--���� ���̺��� �ƴ����� ���̺�ó�� Ȱ�밡��
--������� �Ҵ� X
--�並 �����ϸ� �信 ����� ������ �׶����� ����
--�並 ���� dml �۾��� ����
--�� �����Ϸ��� create view ���� �ʿ� 
--�ܼ���/���պ�/�ζ��κ�� ���� ���պ�--����, �ζ��κ�-�������� 


--1. �����
create [or replace] view ���̸� 
as
subquery; --�ζ��κ� 

--2. �����
drop view ���̸�

--3. �� ��ȸ 
select * from user_views = '���̸�'; 

[�� ����/��ȸ/���� �׽�Ʈ]

1.scott ������ �� ���� ���� �ο�(system ���� ����) 
grant dba to scott; --dba ���ѿ� ���� ���� , �ý��� �������� ��ɾ� �������� scott�������� �������ؾ� ������ ������ 

--2. �����
create view emp_view
as 
select empno, ename
  from emp;
  
--3. �並 ���� ��ȸ
 select * from emp_view; --�ܼ��� 

--4. �並 ���� ����
select from emp_view --������ �����Ǿ����� ������ ��� ��ȸ���� 
  where empno =7369; --�̰� �����ϸ� view�� ������ emp ���̺��� 7369�� ������ 
 rollback; 
 
--5. ������ �� Ȯ��
select * from user_views where view_name = 'EMP_VIEW'; --text���� ������ 

create or replace view emp_view
as
select empno, ename, sal --sal �� �߰��ϰ� ������ or replace ��� 
  from emp; 
  
--[��������]
--�л��� �̸�, �й�, �г�, �а��̸�, ���輺���� �� ���̺�ó�� ��ȸ�����ϵ��� �� ����
select * from student;
select * from DEPARTMENT;
select * from EXAM_01;

create or replace view student_view
as select s.name, s.studno, s.grade, d.dname, e.total 
    from student s, department d, exam_01 e
   where s.studno = e.studno
     and s.deptno1 = d.deptno; 
    
select * from student_view;
