--p76
--����3) emp ���̺��� �̿��Ͽ� ������(JOB), �μ���(DEPTNO)�� �׷�ȭ�Ͽ� ������ �ο����� �޿������ ���ϰ� 
--�޿������ ���� ������ �����Ͽ���

select count(job), count(deptno), avg(sal)
    from emp
  group by job, deptno order by avg(sal) desc;

--������  Sql ���� ���� �׷�и�, ����, ����  
select job, deptno, count(empno) as �ο���, avg(sal) --�ο��� �� �� empno�� ����ϴ� ������ notnull�� Į��
    from emp
  group by job, deptno order by avg(sal) desc;
  
--����4
select sum(sal), count(deptno), deptno 
   from EMP
  group by deptno
 having count(deptno) >4;
 
--������
select sum(sal), count(empno), deptno 
   from EMP
  group by deptno
 having count(deptno) >4;
 
--����5
select avg(sal,0) as �޿����, sum(sal), job --sal�� nvl�� ����ؼ� null�� �ִ� ��� 0���� ġȯ�Ͽ� ȯ�� 
   from EMP
  group by job
 having avg(sal,0) >=3000; 
 
--������ 
select avg(nvl(sal,0)) as �޿����, sum(sal), job --sal�� nvl�� ����ؼ� null�� �ִ� ��� 0���� ġȯ�Ͽ� ȯ�� 
   from EMP
  group by job
 having avg(nvl(sal,0)) >=3000; 
 
 --pdf(p18)
-- 1. emp2 ���̺�� p_grade ���̺��� ��ȸ�Ͽ� ����� �̸��� ����, ���� ����,     
-- �ش� ������ ������ ���ѱݾװ� ���� �ݾ��� ����ϼ���. 
select e.name, e.position, e.pay, p.position, p.s_pay, p.e_pay
  from emp2 e, p_grade p 
  where e.position = p.position;
  
 --2. 1����(deptno1)�� 101���� �л����� �л� �̸��� �������� �̸��� ����ϼ���.  
select s.name, p.name, p.deptno  
  from student s, professor P
 where s.deptno1 = p.DEPTNO 
   and p.deptno=101; 

select * 
  from professor;

select * 
  from student;
  
 --5. emp2 ���̺�� p_grade ���̺��� ��ȸ�Ͽ� ������� �̸��� ����, ��������, ���������� ����ϼ���. 
 --���������� ���̷� ����ϸ� �Ҽ������ϴ� �����ϼ���.
  
  select e.name, trunc(months_between(sysdate,birthday)/12), e.position, p.position
    from emp2 e, p_grade P
    where trunc(months_between(sysdate,birthday)/12) between p.s_age and p.e_age ; --���� ����, where�� ���Ǹ� �����ϴ� ������� ��Ÿ�� 
    
 --������ 
select name, trunc((sysdate - birthday)/365) as ����1,
             trunc(months_between(sysdate, birthday)/12) as ����2,
             e.position as ��������,
             p.position as ��������
             from emp2 e, p_grade p
    where trunc(months_between(sysdate,birthday)/12) between p.s_age and p.e_age ;  
  

--1) Student ���̺��� jumin �÷��� �����Ͽ� �л����� �̸��� �¾ ��, �׸��� �б⸦ ����϶�.
--�¾ ���� 01-03�� �� 1/4�б�, 04-06���� 2/4 �б�, 07-09 ���� 3/4 �б�, 10-12���� 4/4 �б�� ����϶�.
select name, to_number(substr(jumin,3,2)), --������ ������ �Ͼ�� ������ to_number ó�����ִ� ���� ���� 
       case when to_number(substr(jumin,3,2)) between 1 and 3 then '1/4�б�'
            when to_number(substr(jumin,3,2)) between 4 and 6 then '2/4�б�'
            when to_number(substr(jumin,3,2)) between 7 and 9 then '3/4�б�'
            else '4/4�б�' 
       end
       from student;
       
 --������ 
 select name, substr(jumin,1,6),
              to_char(to_date(substr(jumin,1,6)), 'Q'),
              decode(to_char(to_date(substr(jumin,1,6)), 'Q'), 
              '1', '1/4�б�',
              '2', '2/4�б�',
              '3', '3/4�б�', '4/4�б�') as �б�1,
              to_char(to_date(substr(jumin,1,6)), 'Q') || '/4�б�' as �б�2
              --q�� �б⸦ ����                                                    
    from student;

  


--2) EMP2 ���̺��� ����⵵(1960,1970,1980,1990)���� ��տ����� ���϶�.
 alter session
   set nls_date_format = 'YYYY/MM/DD' ;
 
select * from emp2;
select rpad(to_char(substr(birthday,1,3)),4,'0'), avg(pay) 
  from emp2
 group by to_char(substr(birthday,1,3)); 

--������ 
select round(avg(pay)),
       trunc(to_number(to_char(birthday, 'YYYY')),-1)
  from emp2
 group by trunc(to_number(to_char(birthday, 'YYYY')),-1);      


--3) emp ���̺��� �λ�� ������ �������� 2000 �̸��� 'C', 2000�̻� 4000�̸��� 'B', 4000�̻��� 'A' ����� �ο��Ͽ� �� ������ ���� ������ �Բ� ���
--**�λ�� ���� = ���� ���� 15% �λ� + ���ʽ�(comm)
select * from emp ;

select ename, sal, sal*1.5+nvl(comm,0) as �λ�ȿ���,
       case when sal*1.5+nvl(comm,0)<2000 then 'C' 
            when sal*1.5+nvl(comm,0)>=2000 and sal*1.5+nvl(comm,0)<4000 then 'B'
            when sal*1.5+nvl(comm,0)>4000 then 'A'
       end
  from emp;


--������ 
select ename, sal, sal*1.5+nvl(comm,0) as �λ�ȿ���,
       case when sal*1.5+nvl(comm,0)<2000 then 'C' 
            when sal*1.5+nvl(comm,0)<4000 then 'B' 
            else 'A'
       end
  from emp;


--4) emp ���̺��� ����Ͽ� �������� ����� �Ʒ��� ���ؿ� �°� ǥ���ϼ���.
--2000�̸� 'C', 2000�̻� 3000���� 'B', 3000�ʰ� 'A' decode�� �ۼ�

select ename, sal, decode(sign(2000-sal),-1, decode(sign(3000-sal),-1,'A', 'B'), 'C')     
   from emp; 
   
--������
select ename, sal, decode(sign(sal-2000),-1,'C', decode(sign(sal-3000),1,'A', 'B'))     
   from emp; 