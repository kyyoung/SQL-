--decode(���, ����1, ġȯ1, else��) 
--����)
--deptno�� 10�� ������ job�� clerk�� ������ A�μ���, ������ ������ B�μ���, 20�� ������ C�μ���, 30�� ������ D�μ��� �̵�
select ename, job, deptno,
       decode(deptno, 10, decode(job, 'CLERK', 'A', 'B'),
                      20, 'C',
                      30, 'D')
  from emp; 
  
----2 case �� decode �� �� ���°� ���� case ���°� �� ������ ���� ������ �������� decode�� �� ���� 
--case when ����1 then ġȯ1 
--     when ����2 then ġȯ2 
--     -----
--                else "elseġȯ��" 
--  end 
--**����� �� ���ǰ� ġȯ���� ���� ������ ���������� ���� Ȯ���ؾ���, ��¥-��¥, ����-����, ����-���� ��������!!!!!!(desc�� Ȯ��) 

--����) deptno�� 10�̸� A, 20 �̸� B, 30�̸� C�� ġȯ
select ename, deptno, 
       case when deptno=10 then 'A'
            when deptno=20 then 'B'
            when deptno=30 then 'C'
   end as ���μ���
  from emp; 
  
 --��డ��(�÷��� ���� ������ ��) 
 select ename, deptno, 
    case deptno when 10 then 'A'
                when 20 then 'B'
                when 30 then 'C'
   end as ���μ���2
  from emp; 
  
 --�׷��Լ�(�������Լ�) : ������ ������ �Է�, �� �� ���
 --1. count
 select count(*), count(empno), count(comm)
   from emp; --null�� ���� �ʱ� ������ comm�� ���� �ִ� 4���� ��µ�
 desc emp; -- not null�� �����Ǿ� �ִ� �÷��� Ȯ���� �� count(empno)�� �ϴ� ���� �������� ���� 
 
--2. sum
select sum(sal), sum(comm)
  from emp;

--3. avg
select avg(sal), 
       avg(comm), --null ������ 4�� ���� ���
       sum(comm)/count(*), avg(nvl(comm,0)) --��ü �÷��� ������ 14�� ���� ��� 
   from emp;

--4. min/max
select min(sal), max(sal), sal -- �׷��Լ��� �׷��Լ��� �ƴ� ���� ���� �� �� ����, �׷��Լ������� ����� �� ����   
  from emp; 
  
--group by ���� : Ư�� �׷캰 �׷��Լ��� ������ ��� 
--����) emp ���̺��� �μ��� �ִ뿬�� ��� 
select max(sal), deptno --�׷��Լ����� ��°����ϱ� ������, �׷��Լ��� �ƴ� �÷��� �ܵ���� �Ұ������� group by�� ���� �÷����� ���� �� ���� �÷��� ���� �±� ������ 
  from emp
 group by deptno; 
 
 --����)student ���̺��� �г⺰, ���� Ű�� ���
 select grade,  decode(substr(jumin, 7,1), '1', '��', '��') as ���� , 
                round(avg(height),1) as ���Ű,
                max(height) as �ִ�Ű 
   from student
  group by grade, substr(jumin, 7,1) 
  order by grade, ����;
 
--having �� :  group by ���� ����� ���� �߰� �� �� ���
--������ ����
--select 
--   from
--  where
--  group by
--having
-- order

--������ ���� 
--from 
--where
--group by
--having --group by ������ �������� �����ϱ� ���ؼ�
--select
--order by -- ������ ���� ���� �� ����� ����ڰ� ���ϴ� ��� ������ִ� ���� 

--����) �μ��� ��տ����� 2500�̻��� �μ� ���-- where ���� ����ϸ� ��ɹ��� ������� ���� ������  where�� ���� ����ǰ� �״��� group by�� ����Ǳ� ���� 
--select avg(sal) 
--  from EMP
--  where avg(sal) >= 2500
-- group by deptno   ---- ������� ���� ����
--having ���� ����ؾ��� ��µ� 
select avg(sal) 
 from EMP
  group by deptno
having avg(sal) >= 2500; 

--����) �μ��� ��տ��� ���, 10�� �μ� ���� 
 
select avg(sal), deptno 
 from EMP
  group by deptno
having deptno != 10 ; 

select avg(sal), deptno 
   from EMP
  where deptno !=10
 group by deptno; 

--where���� having�� ��� ���Ǵ� ��쿡�� where���� ���� ���� �� ������ ���� 
