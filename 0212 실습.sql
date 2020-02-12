--��������) student ���̺��� jumin �÷��� ����Ͽ� �л��� ��������� �� ������ �Ͽ����� ��¥ ���
  select jumin, next_day(to_date(substr(jumin,1,6),'RR/MM/DD'),1)
    from student;
  
  alter session set nls_date_format ='YY/MM/DD'; 
  select jumin, next_day(to_date(substr(jumin,1,6)),1)
    from student;
  
  
  select birthday, next_day(birthday,1)
    from student;

--P44(pdf) 
--����1) EMP ���̺��� ������� �ٹ��ϼ��� �� ��, �� ���ΰ��� ����Ͽ���. 
--��, �ٹ��ϼ��� ���� ��� ������ ����Ͽ���. 
select trunc((sysdate-hiredate)/7) as �ٹ��ּ�, --sys�� hire ��� ��¥�����̴ϱ� �ٷ� �� �� ���� 
       trunc(sysdate-hiredate) as �ٹ��ϼ� 
  from emp
 order by trunc(sysdate-hiredate) desc;

select trunc((sysdate-hiredate)/7) as �ٹ��ּ�,
       trunc(sysdate-hiredate) as �ٹ��ϼ� 
  from emp
 order by �ٹ��ϼ� desc; --order by�������� ������ alias ��밡�� 

--����3) EMP ���̺��� �Ի��� ���� ���� �ٹ� �ϼ��� ����Ͽ� ����Ͽ���.     
--��, ����ϰ� �Ͽ��ϵ� �ٹ��ϼ��� �����Ѵ�. 
select hiredate, last_day(hiredate), last_day(hiredate) -hiredate --�ð������� ��� �ϼ��� �� ������ 
  from EMP ;
  
  
--����2) 
select trunc(months_between(sysdate, hiredate))
  from emp
 where deptno=10;

--����4) 
select next_day( hiredate, 6)
   from EMP
  where deptno=10;

--p54(pdf) 
--����1) EMP ���̺��� 10�� �μ����� �Ի� ���ڸ� 1 MAY 1981�� 
--1998�� 01�� 01���� ���·� ���� ����Ͽ���. 
alter session set nls_date_language = 'american' 
select to_char(hiredate, 'dd MON yyyy') --�� ����
  from emp 
 where deptno=10 ;

select to_char(hiredate, 'dd MONTH yyyy') --�� Ǯ���� 
  from emp 
 where deptno=10 ;

 select to_char(hiredate, 'YYYY"��" MM"��" dd"��"'), --������� �ؽ�Ʈ�� �����ϰ� �ʹٸ� " " ��� 
        to_char(hiredate, 'YYYY - MM - dd') -- /, - ���� ���� �׳� ��� ���� 
   from emp 
 where deptno=10 ;
 
-- ����3) february 22, 1981�� �Ի��� ����� �̸�, ����, �Ի����ڸ� ����Ͽ���.   
alter session set nls_date_language=american 

select ename, job, hiredate 
  from emp
 where hiredate = to_date( 'february 22 1981', 'MONTH DD YYYY');

select ename, job, hiredate 
  from emp
 where hiredate = to_date( 'february 22, 1981', 'MONTH DD, YYYY');
 
--����2) 
select sal, to_char(sal, '$99,999') 
   from emp
  where deptno = 20
  
--p63(pdf)
--����1)
select ename, job, deptno, decode(deptno, 10, 'A',
                                          20, 'B',
                                          30, 'C') AS �μ��� 
   from emp; 

--����2)
select empno, ename, job, sal, decode( job, 'ANALYST', decode( sal,sal,sal*1.1),  
                                            'CLERK', decode( sal,sal,sal*1.5),
                                            'MANAGER', decode( sal,sal,sal*2.0))
  from emp; 
  
select empno, ename, job, sal, decode( job, 'ANALYST', sal*1.1,  
                                            'CLERK', sal*1.5,
                                            'MANAGER', sal*2.0) AS ������ 
  from emp; 
       
--����3)
select empno, MGR, decode(MGR, null, '����������', mgr || '���')
  from emp; 
  
select empno, MGR, nvl2(MGR, mgr || '���', '����������')
  from emp; 
  
--1. professor ���̺��� �� ������ �̸��� ���̵� 
--����ϵ�, Ư����ȣ�� ������ ���·� ����Ͽ���.
select email, translate(email, '@.-_/', '  ')
  from professor;

--2. STUDENT ���̺��� ����Ͽ� �ֹι�ȣ, ������� 
--������ ����Ͽ� �� �л��� �¾ ���� ������ ���
select JUMIN, to_char(to_date(substr(jumin,1,6), 'rr/mm/dd'), 'DAY')
  from student; 
select birthday, to_char(birthday, 'DAY')
  from student; 
select jumin from student;
--3. EMP ���̺��� �̿��Ͽ� ����̸�, �Ի��� �� �޿��������� ǥ���մϴ�. 
--�޿��������� ������ �ٹ��� �ش�Ǵ� ù��° ������ 
--��¥�� "Sunday the Seventh of September, 1981" 
--�������� ǥ��. �� �̸��� check�� �Ѵ�.

select ename, hiredate, to_char(next_day(add_months(hiredate,6),2), 'Day "the" DDTH "of" MONTH, YYYY')
  from emp;

--4. student ���̺��� jumin �÷��� ����Ͽ� ��������� ���� ������ �л��� ������ ����ϼ���.
--(19760205 ~ 19760924)
select jumin, to_date(substr(jumin,1,6), 'rr/mm/dd')
  from student
 where to_date(substr(jumin,1,6), 'rr/mm/dd') between '1976/02/05' and '1976/09/24' ;
 
select * from student; 
--5. emp ���̺��� �̿��Ͽ� ������� �ٹ��ϼ��� 
--XX�� XX���� XX�� ���·� ����ϼ���.
   
select trunc(trunc(months_between(sysdate, hiredate))/12) || '��' as "year",  
       mod(trunc(months_between(sysdate, hiredate)),12) || '����' as month,
       mod(round(sysdate) - round(hiredate),365) 
     from emp;
select round(sysdate, 'month') from emp; 
