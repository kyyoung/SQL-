
--�ǽ�����(�������) 
select *
  from student;
 
select name || '��' || 'Ű��' || height || 'cm,' || '�����Դ�' || weight || 'kg' || '�Դϴ�' as "�л��� Ű�� ������"
  from student ;
 
select *
  from professor ;
 
select name || ' (' || position || ')' || ',' , name || ' ''' || position || '''' as "������" --�̱۵���ǥ�� ���ڿ��� �Ƿ��� ¦���� �����, ������� '' ���̿� �ִ� ���ڿ����� ������ ��������  
  from professor ;
  
--�ǽ�����1
select empno,
       ename,
       job,
       sal
  from emp
 where sal>=3000 ;
 
--�ǽ�����2
select empno,
       ename,
       job,
       sal,
       deptno
  from emp
 where job = 'MANAGER' ;
 
select *
  from emp
--�ǽ�����3
select empno,
       ename,
       job sal,
       hiredate,
       deptno
  from emp
 where to_char(hiredate, 'YYYYMMDD') >'19820101' ; --to_char date �ڷ����� ���ڿ��� ����
 
 select empno,
       ename,
       job sal,
       hiredate,
       deptno
  from emp
 where hiredate >to_date('19820101') ; --to_date ���ڿ��� date������ ���� 
 
 --������
 select empno,
       ename,
       job sal,
       hiredate,
       deptno
  from emp
 where hiredate >'1982/01/01' ;
 
 select *
  from EMP
 where hiredate between '1982/01/01' and '1982/12/31' ;

--�ǽ�����1
select ename,
       job,
       sal,
       deptno
  from EMP
 where sal between 1300 and 1700 ;

--�ǽ�����2
select empno,
       ename,
       job,
       sal,
       hiredate
  from emp
 where empno in (7902, 7788, 7566) ;
 


--�ǽ�����3 
 select *
  from EMP
 where hiredate like '1982%' ; --��ºҰ�
 
  select *
  from EMP
 where hiredate like '82%' ; --��µ� ������ ���� �����ʹ� 82�� �̷��� ���ִµ� �������� ��µ��ִ� ��¥ ������ 1982�� �̷��� ������ �׷��⿡ like �����ڸ� ����Ϸ��� ������ ��¥ ������ ����ؾ��� 
 
--��ȸ�Ǵ� �� ������ ��¥ ������ ���ϴ� �������� ���� 
alter session set nls_date_format ='YYYY/MM/DD'; --���ǿ� ���� ������ �����, �������� �ٽ� ���ٰ� Ű�� ������ �� ���·� ���ƿ� 

 
--�ǽ�����4
select ename, 
       SAL
  from emp
 where ename like 'M%' ;
 
--�ǽ�����5
select ename,
       job
  from EMP
 where ename like '_L%' ;
 
--�ǽ�����6
select empno,
       ename,
       sal,
       hiredate,
       deptno,
       comm
  from emp
 where comm is null
--�ǽ�����7
select empno,
       ename,
       job,
       sal,
       hiredate,
       deptno
  from emp
 where sal>=1100
   and job = 'MANAGER'
--�ǽ�����8
select empno,
       ename,
       job,
       sal,
       hiredate,
       deptno
  from emp
 where sal>=1100
   and ename not like 'M%' ;
 
--�ǽ�����9
select empno,
       ename,
       job,
       sal,
       deptno
  from emp
 where job != 'MANAGER'
   and job != 'CLERK'
   and job != 'ANALYST'
   
--�ǽ�����10
select empno,
       ename,
       job,
       sal
  from emp
 where job ='PRESIDENT'
   and sal >=1500
    or job ='SALESMAN' ;
 