-- ���� lock ����
alter user scott account unlock;

--���� �н����� ����
alter user scott identified by oracle;

--ctrl + enter : Ŀ�� ��ġ ���� ����
--ctrl + n : ���ο� ���� ȭ�� 

select * from emp;
desc emp ; 
--����� �ĺ� ������ �ֹι�ȣ�� �й�, �����ȣ ���� ���� not null
--�ϳ��� �÷����� �ϳ��� Ÿ�Ը� �Է°���, ����Į���̸� ����, varchar2(����)�� varchar2 ������
-- Number(7,2) 7�ڸ����� �� 2�ڸ��� �Ҽ����ڸ� (10) 10�ڸ�

select *
 from emp ;
 
select empno, ename, SAL
 from emp ; --sql�� ��ҹ� ���� ����
 
select empno, sal, sal*1.1, 1111 --1111 ������ ��� ���� 
 from emp ;
select empno, sal, 1111, 'abcd' --���ڿ��� �ݵ��� ''�� �ʿ��� 
 from emp ;
 
 select *
  from EMPLOYEES; --��Ű��: hr��Ű�� hr������ �ִ� ���̺� Ȥ�� ��� ������ 
  
6.
�÷� ��Ī (alias) : �÷��� �̸��� ��½� �����Ͽ� ��� (������ ���� ������ �ʰ�, ����� ������ ���Ѵ�)
select empno as �����ȣ, ename as ����̸�, sal as �޿�
from emp;
"AS" �� ���� �����ϴ�.  ��κ� ���������� �������� ���� ���� ��찡 ����.
<��� ��ȣ> ��� ����(����)�� �ϰ� ������? �׳� ��� ��ȣ ��� ���� ������ �����.
�� ����ǥ�� ��߸� ������ ������ �ʴ´�. "��� ��ȣ"
<����̸�!> �̶�� ����ǥ(Ư������)�� ���� ������? �׳� ���� ������ ��.
�����ǥ�� ��߸� ������ ���� ����.  "��� �̸�"
�ҹ���(�� �ҹ���)�� �״�� ǥ���ϰ� �ʹٸ�? 
�����ǥ�� ��߸� ������ ���� ����.  "salary"
 
**AS �� ���� �� ����ǥ ����, �������� ��� Ȭ ����ǥ��!**
 
select empno as "��� ��ȣ"
ename "����̸�!"
sal as "salary"
from emp;
 
 
7. 
���� ������ (||) <- shit & \ ������ ���� : �÷��� �÷�, �÷��� ǥ������ ����. �����ϰ����ϴ� ��� ���̿� ����.
select empno||ename
from emp;
�ϳ��� �÷����� �������� ���´�. 
 
����)
emp ���̺��� �����ȣ�� �̸��� �Ʒ� �������� ���
7369-smith
>>
select empno||'-'||ename
from emp;
 
**������ �����ҰŸ� �ƿ� sql�ܿ��� �ϰ�, �߰������� �ʿ��� ������ r�� ���̽㿡�� �ϴ°� �� ������.
 
8.
distinct: �ߺ��� ����, �ڿ� ������ �÷� �������� ������ ���� ���.  ����ũ�� ���� ���� �ʹ�.
distinct �� ������ select �ڿ� �;���. �÷� �� X
select distinct deptno
from emp;
����� 3��
 
select distinct deptno, ename
from emp;
���� �μ��� ���������� �־��ٸ� �������� ��.
����� 14�� 
 
select distinct deptno, job
from emp;
���� �μ��� ���� ������ ���� ����� �ִٸ� �������� ��.
 
 
===============
 
Alias �������� 1 
 
select deptno as �μ�#, dname as �μ���, loc as ��ġ
from dept;
 
#�� ���������� �ֵ���ǥ�� ���� �ʾƵ� �ȴ�.
 
Distinct �������� 1 
 
select distinct deptno, job
from emp;
 
 
======================
 
ctrl + T = �� ������
 
save workspace as .... = sql ��������. �� ������
open workspace .... =sql �������� �� ��
 
open = �Ϲ� ���� �� ��.
 
======================
 
primary key �ߺ��� �� ���°�.
 
insert into professor values (....) <- ���̺� ������ �����ؾ� �Ѵ�. 
 
SCOTT ������ datebase_test ������ ����.
 
=====================


