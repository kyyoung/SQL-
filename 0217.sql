----outer join : ���������� �������� �ʴ� ������ ����
--������ �Ǵ� ���̺� ��ġ�� ���� left outer join, right outer join, full outer join���� ����

--����) student, professor ���̺��� ����Ͽ� �� �л��� �̸�, �г�, ���������� ���(�� ���������� ���� �л��� ������ ����) 

select * from student;
select * from professor;

select s.name as �л��̸�, p.profno as �����̸�  
  from student s, professor p 
 where s.profno = p.profno; --���������� ���� ������� nulló���Ǿ� ��Ÿ���� ���� 
 
 --left outer join ������ ������ �Ǿ� �����ϴ¹�: ����Ŭ ǥ��, ������ �Ǵ� ���� �ݴ� �÷��� ( + )�� ���� 
 select s.name as �л��̸�, p.profno as �����̸�  
  from student s, professor p 
 where s.profno = p.profno(+); -- ������ �Ǵ� ������ student ���̺��� �ݴ����� prfessor table�� +�� ���� 
 
 --��������) student, professor ���̺��� ����Ͽ� �����̸�, pay, �� ������ �����л� �̸��� �г� ���
 --�� �����л��� ���� �����̸��� ��� 
 
 select p.name as �����̸�, p.pay, s.name as �����л�, s.grade as �г� 
   from student s, professor p 
  where s.profno(+) = p.profno
  order by 1; 
 
 --��������) �� ������� ���������� �����л����� ��� ��, �����л��� ���� ������ ��� 
 select count(s.studno) as �����л���, p.profno, p.name, p.pay
   from student s, professor p
  where s.profno(+) = p.profno 
 group by p.profno, p.name, p.pay; --������������ ��� Ȯ��, �׷캰�� ������ �� ������ �߰��ȴٰ� �ؼ� �� ����ȭ�Ǵ��� �ƴϸ� �����Ǵ��� Ȯ���ؾ��� 
 
 --���� :  full outer join :  ������ ��û �������� ������ ��� ���� ���� 
 --1) ANSI ǥ�� 
 select s.name as �л��̸�,
        p.name as �����̸�
   from student s full outer join professor p 
     on s.profno = p.profno; 
     
-- --2) ����Ŭ ǥ��
-- select s.name as �л��̸�,
--        p.name as �����̸�
--   from student s, professor p 
--  where s.profno(+) = p.profno(+); �Ұ�, ������� 
--full outer join�� ������ union����Ͽ� ������ ���� 
select s.name as �л��̸�,
        p.name as �����̸�
   from student s, professor p 
  where s.profno(+) = p.profno
  union
select s.name as �л��̸�,
        p.name as �����̸�
   from student s, professor p 
  where s.profno = p.profno(+); 
  
 --����) emp2 ���̺�� p_grade ���̺��� ��ȸ�Ͽ� ������� �̸��� ����, ��������, ���������� ����ϼ���. 
 --��, ���������� ���� ������ ��� ��� 
  
 select e.name, trunc(months_between(sysdate,birthday)/12), 
        e.position, nvl(p.position, '����')
    from emp2 e, p_grade P
  where trunc(months_between(sysdate,birthday)/12) between p.s_age(+) and p.e_age(+) ; --���̺� ������ emp2, �׸��� �÷��� �������̸� ��� (+) �ٿ��� outerjoin ����

--��������) student, professo, department���̺��� ����Ͽ� �� �л��� �̸�, ����������, ���������� �а��� ��� 
--(��, ���������� ���� �л� ������ ���) 
--student ���̺��� ������ ��, �׷��� ������ ���������� ���� �л��鵵 ����̵Ƿ��� professor ���̺� (+) ����
--���� ���������� ���� �л����� ���������� �а��� ��µ� �� ���� ������ ���� ���� �а��� ����Ǵ� department���̺��� (+)�� �ٿ��� ���������� ���� �л����� ��µ� �� ���� 

select s.name, p.name, p.deptno, d.dname
   from student s, professor p, department d 
 where s.profno = p.profno(+) 
   and p.deptno = d.deptno(+); 
   
--self join :  �ϳ��� ���̺��� ������ ���εǴ� ���, �ѹ��� scan���� ǥ���� �� ���� ������ �Ȱ��� ���̺��� ����(scan) �ؾ߸� ��� ������ ���
--����) emp ���̺��� �� ������ �̸�, ������ �ش� ������ �Ŵ��� �̸� �� ������ �Բ� ����ϼ���  !!!!!!!!!!!!���蹮��!!!!!!!!!!!!!!!!

select * from emp;

select e1.ename as �̸�,
       e1.sal,
       e2.ename as �Ŵ����̸�,
       e2.sal as �Ŵ�������
   from emp e1, emp e2 
  where e1.mgr = e2.empno(+); --  !!!!!!!!!!!!���蹮��!!!!!!!!!!!!!!!!, �����߿� 
--Ȥ�� 
select e2.ename as �̸�,
       e2.sal,
       e1.ename as �Ŵ����̸�,
       e1.sal as �Ŵ�������
   from emp e1, emp e2 
  where e2.mgr = e1.empno; 
  
--����) �� ������ ����Ͽ� �Ŵ������� ������ ���� ���� ���

select e1.ename as �̸�,
       e1.sal,
       e2.ename as �Ŵ����̸�,
       e2.sal as �Ŵ�������
   from emp e1, emp e2 
  where e1.mgr = e2.empno(+)
    and e1.sal > e2.sal;
    
--��������) department���� �� �а���� �����а����� ���� ���, �� �����а��� ���� ��쿡�� �Բ� ��� 
select *
   from department; 
   
select d1.dname as �а���,
       d2.dname as �����а�
  from department d1, department d2
 where d1.part= d2.deptno(+); 

 
--��������) �� �������� �� �а��� �Ҽ������� '����Ʈ������а��� �Ҽ��� ��ǻ�������к��Դϴ�.' �������� ��� ��, �Ҽ��а��� ���� ��쿡�� ���� �Ҽ����� ���

select d1.dname || '�� �Ҽ���'  as �а���,
       nvl(d2.dname, d1.dname) || '�Դϴ�'  as �����а�
  from department d1, department d2
 where d1.part= d2.deptno(+); 
 
--��������) employees ���̺��� ����Ͽ� �� ������ �̸�, �Ի���, ����, ������ ���, �� ������ �ټӳ�� ���� p_grade �����Ͽ� �ο�
select * from employeess;
select * from p_grade;

select e.first_name, e.hire_date, e.salary, trunc(months_between(sysdate, hire_date)/12), p.position
   from employeess e, p_grade p
  where trunc(months_between(sysdate, hire_date)/12) between p.s_year(+) and p.e_year(+);
  

  
--��������) professor ���̺��� ������ ��ȣ, �����̸�, �Ի���, �ڽź��� �Ի��� ���� ��� �ο����� ����ϼ���
select * from professor; 

select p1.profno, p1.name, p1.hiredate, p2.name, p2.hiredate
   from professor p1, professor p2
  where p1.hiredate > p2.hiredate(+)  --Ȯ�� 

select p1.profno, p1.name, p1.hiredate, count(p2.profno) --null�� ���� profno�� ���� ���� ��Ȯ 
   from professor p1, professor p2
  where p1.hiredate > p2.hiredate(+)
 group by p1.profno, p1.name, p1.hiredate  --�������� ������ ���ĵ� ������ �����Ǿ��ų� �������� ����
 order by count(p2.profno); 
 
 --�������� ���� �� ���� (����) 
-- select ... (select ...) :  ��Į�� �������� select ���� �� �ٸ� select ���� ���� ��, select ���� ����� �÷��� ��ü�� ���  
--   from ... (select ...) :  �ζ��� �� from ���� select ���� ���� �� : select ���� ����� ���̺��� ��ü�� ���  
--  where ... (select ...) :  �Ϲ� �������� where���� select ���� ���� �� , select ���� ����� ����� ��ü�� ���  

--����) emp ���̺��� ��ü ������ ��տ������� ���� ������ �޴� ������ �̸�, ����, �Ի��� ��� 
--step1) ��տ��� ���
select avg(sal) 
  from emp; --2073.2
--step2) ��տ���(2073.2)���� ���� ���� �޴� ��� ��� 
select *
  from EMP
 where sal >=2073.2; 
 
--total) 
select ename, hiredate, SAL
  from EMP
 where sal > = (select avg(sal) 
                      from emp); --������ �������� �޳� ���� ������ ���� ���� �� ���� 
 
select ename, sal, hiredate
  from emp
  where sal <(select avg(nvl(sal,0)) from emp); 


--����) scott�� ���� �μ��� �ִ� �������� ��� 
select deptno 
   from EMP
  where deptno = (select deptno 
                     from emp 
                   where ename = 'SCOTT'); --where ���� deptno �ϳ��̸� ���������� deptno �ϳ������� 

-- ������ ���� �������� �з� (�����) 
-- 1. ������ �������� :  ���������� ����� �ϳ��� ��, �������� ����� �ϳ��� ��  =, !=, >, < ����� �� ��︲  
--����) scott�� ���� �μ��� �ִ� �������� ��� 

-- 2. ������ �������� : =, !=,  >, < ����� �Բ� �� �� ����, in(not in), (max, min�� ����ϴ�) any, all 
--ex) �̸��� 'A'�� �����ϴ� ������ ���� �μ��� �ִ� ���� ���� ���
select deptno 
   from emp
 where deptno = (select deptno 
                      from emp 
                     where ename like 'A%'); -- ���� : ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵ� 
                     
 select deptno 
   from emp
 where deptno in (select deptno 
                      from emp 
                     where ename like 'A%'); --���������� ����� �������� ��� 
                     
--ex) �̸��� 'A'�� �����ϴ� ������ �������� ���� ������ ���� ���� ���� ��� 
select deptno
   from EMP
 where sal >  (select avg(sal) --min, max, avg ����ؼ� �ϳ��� ������� ���ϵǰ� ���� �� ������ ��� �� �ؾ��� 
                from EMP
               where ename like 'A%'); 
               
--  > all(1000, 2000) �̸� max���� ������ �����ִ� ������  1000���� ũ�� 2000���� ū�� ��������� 2000���� ū ���� ����  
--ex) �̸��� 'A'�� �����ϴ� ������ �������� ��� ���� ������ ���� ���� ���� ��� (1100 �̶� 1600)���� ū 
 where sal > all (select sal --max(sal)�̶� ���� �� 
                      from EMP
               where ename like 'A%'); 
-- > all (1100, 1600) => > 1600 : 1100���� ũ�� ���ÿ� 1600���� ū �� ��������� 1600���� ū �� ���� 
-- < all (1100, 1600) => <1100 1100���� �۰� 1600���� ������ min���� ������ �����ִ� ������ ��������� 1100���� ���� ���� ����          
-- > any(1100, 1600) => > 1100 �� �ּҰ� ����: 1100���� Ŀ�� �ǰ� 1600���� Ŀ����, 1100���� ū �� ����  
-- < any(1100, 1600) => <1600�� �ִ밪 ����: 1100���� �۾Ƶ� �ǰ� 1600���� �۾Ƶ���, 1600���� ���� �� ���� 

--3. �����÷� ��������
--4. ��ȣ���� ��������
  

