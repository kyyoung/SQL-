--group by ���� ����
--1. where ���� �׷��Լ� ��� �Ұ�
select avg(sal)
   from EMP
 where avg(sal) > 0 ;  --��հ��� Ȯ���� �� ���� ������ ����
 
 select deptno, avg(sal)
   from EMP
 where avg(sal) > 2500 
 group by deptno; --��հ��� Ȯ���� �� ���� ������ ����
 
 select deptno, avg(sal)
   from EMP
  group by deptno
 having avg (sal) > 2500;  --where�� ��� ��� 
 
 --2. where��, havgin���� �Ѵ� ��� ������ ������ where���� ����ϴ� ���� ���ɻ� ���� 
 select deptno, avg(sal)
   from EMP
    where deptno! =10 
  group by deptno
 --having avg deptno != 10; having���� where�� ��� ��� �� �� ������, where���� ����ϴ� ���� ���ɻ� ������
 
 --3. group by���� ��õ��� ���� �÷��� �����÷� ���·� select���� ����� �� ���� 
 --(�׷��Լ� ���·θ� ����) 
 select grade, max(height), max(name) -- ���ڳ� ��¥�� max, min ���� ��� ������ max(�ѱ�) = �� ��, max(����) = z ��  
    from student 
   group by grade; 
   
 select grade, max(height), name -- ������� ����� ������ ���������� ������ִ� ���� ��Ȯ�� ��ɹ� 
    from student 
   group by grade, name; 
   
select name, height, grade from student order by grade, height desc;   

--���տ����� : �������� select ���(����)�� ���� ������, ������, �������� ����, ������ �÷��� ���� ��ġ�� ������ Ÿ���� ��ġ�ʿ� 
--1. union/ union all : ������
--union : �ߺ����Ÿ� ���� ���� ���� ����
--union all : �ߺ����� ���� ��� ���(���� �������)
--union/ union all�� ����� ���� ����  union all ��� 
--����) emp ���̺��� 10��, 20�� �μ����� ���� ���, ���տ����ڸ� ����Ͽ� �ϳ��� �������� ���Ͽ� ��� 
select * 
   from EMP
 where deptno =10
  union
select *
  from EMP
 where deptno =20; --�� ������ ��� ��ü ������ �ߺ��� ���ɼ��� ����, �ߺ����� ���� ������ ��� ���� ��ĥ�ʿ� ���� ������ �������� �ް��� �϶�, ��ɹ� ��ü�� ���� ������ �����ϱ� ����  
 
--����) emp ���̺��� 10��, 20�� �μ����� job�� ���� ���, ���տ����ڸ� ����Ͽ� �ϳ��� �������� ���Ͽ� ��� 
select job
   from EMP
 where deptno =10 
 union all --union�� ����ϸ� �ߺ��� ���� ���� 
select job 
  from EMP
 where deptno =20; 
 
--���ǻ��� 1�� : ������ Ÿ���� ��ġ 
select ename 
   from EMP
 where deptno =10 
 union all
select sal --����Ұ� : ������ Ÿ�� ����ġ 
--select to_char(sal) --���� sal�̶� job�� ��ġ�� �ʹٸ� sal�� �������·� ��ȯ   
  from EMP
 where deptno =20;  
 
--���ǻ��� 2�� : ��ɹ� �ۼ��� �� job�� sal�� ���� ��ġ 
select job, sal
   from EMP
 where deptno =10 
 union all --union�� ����ϸ� �ߺ��� ���� ���� 
select sal, job 
  from EMP
 where deptno =20; 


--2. intersect : ������
select job
   from EMP
 where deptno =10 
 intersect
select job 
  from EMP
 where deptno =20; 

--3. minus : ������
select job
   from EMP
 where deptno =10 
 minus
select job 
  from EMP
 where deptno =20; 

--scott���� hr������ employees ���̺� ��ȸ ������ �۾�, �ϴ� system �������� �� �� �Ʒ� ��ɾ� ����, �� �پ� �����ؾ��� 
create public synonym employeess for hr.employees; --synonym ��Ī�� ���� ���� ���̺��̸��� hr.employees ���� employeess ��� ��ȸ�ص� �����Ϳ� ���� �����ϰ� �� 
grant select on hr.employees to scott; -- scott �������� ������ �ο��Ͽ� employees ���̺� ��ȸ �����ϰ� ����

select* 
  from employeess; --scott �������� �����غ��� 

--��������) emp ���̺�� employees ���̺��� ���� �����ȣ, �̸�, job, sal ���� ����ϱ�
--employees���� �����ȣ�� employee_id, �̸��� first_name, job�� job_id, sal�� salary���, 
--�� �����ȣ�� ��� 4�ڸ��� ����

select lpad(employee_id,4,7) as empno, first_name as ename, job_id as job, salary as sal
 from employeess
union all 
select lpad(empno,4,0) , ename, job, sal 
 from emp;
 
--������
select empno, ename, job, sal as ���� --alias�� ���� �ִ� �࿡ �Է��ؾ��� ��µ�  
  from EMP
 union all
select to_number(rpad(employee_id,4,0)), upper(first_name), job_id, salary  
  from employeess;

--join : ���� �ٸ� ���̺� �л�Ǿ� �ִ� ������ �ϳ��� �ٽ� ��ġ�� ���(Ư�� �÷��� ���� �߰� ������ Ÿ ���̺��� ����) 

select * from emp;
select * from dept; 

select *
  from EMP, dept;
--     emp 14��, dept 4�� �� 14*4������ �� 56���� �߻� : īƼ�þȰ��� �߻��� 

--īƼ�þȰ� �ذ���, 
select empno, ename, dname, emp.deptno --deptno �� ����� �� where���� ���� ��� 
   from emp, dept
  where emp.deptno = dept.deptno; -- emp�� dept �������� ������ deptno�� �� 
  
select empno, ename, dname, emp.deptno --deptno �� ����� �� where���� ���� ��� 
   from emp e, dept d --alias ���� 
  where e.deptno = d.deptno; -- alias�� �����ߴٸ� where������ alias�� ���������� 

--��������) student�� department ���̺��� ����Ͽ� �л���ȣ, �̸�, �г�, �а��̸� ���
select studno, name, grade, dname
   from student s, department d
  where s.deptno1 = d.deptno ;
  
--������ 
select s.studno, s.name, s.grade, d.dname --alias �ٿ������ 
   from student s, department d
  where s.deptno1 = d.deptno ;
  
  
--��������) student�� exam_01 ����Ͽ� �л���ȣ, �̸�, �г�, ���輺�� ���
select s.studno, name, grade, total
  from student s, exam_01 e 
 where s.studno = e.stuno ; 

--������
select s.studno, s.name, s.grade, e.total --alias �ٿ������ 
  from student s, exam_01 e 
 where s.studno = e.studno ; 

--����) �� ������ Ȱ���Ͽ� �г⺰ ���輺�� ��� ��� 
select s.grade, avg(e.total)
    from student s, exam_01 e 
  where s.studno = e.STUDNO
 group by s.grade; 
 
 
 
--�������� emp���̺��� �μ��� ��տ����� ���ϰ� �μ���, ��տ��� ���·� ��� 
select d.dname,avg(e.sal), d.deptno, d.loc --�׷�������� ���̴� �÷��� �ø� �� ����
   from emp e, dept d 
  where e.deptno = d.deptno 
 group by d.deptno, d.dname, d.loc; --detpno, dname, loc�� ����ȭ�ؼ� �� �ʿ䰡 ����, ������ �ߺ��Ǵ� �÷��� ��� ����� ���� ���� �� ���� 
 
-- --���� deptno   loc
--         A      ����
--         A      �λ�
--         B      ����
--deptno�� ����� ��� �÷� 2�� , deptno�� loc �� �÷� 3�� ��Ÿ��
  
--��������) student�� exam_01, department ����Ͽ� �л���ȣ, �̸�, �г�, ���輺��, �а��� ��� 3�� ���̺��� ���������� �� �ľ�

select s.studno, s.name, s.grade, e.total, d.dname
   from student s, exam_01 e, DEPARTMENT d
  where s.studno = e.STUDNO 
    and s.deptno1= d.deptno;

--2. non equi join
--����) gogak, gift ���̺��� ����Ͽ� �� ���� ��������Ʈ�� �޾ư� �� �ִ� ���� ���� ��ǰ 1���� ���
select g1.gname as ����, g1.point as ����Ʈ, g2.gname as ��ǰ��
   from gogak g1, gift g2
  where g1.point between g2.G_START and g2.G_END;
  
--��������) �� ���̺��� ����Ͽ� �� ���� ������ �� �ִ� ��� ��ǰ�� ��� 
select g1.gname as ����, g1.point as ����Ʈ, g2.gname as ��ǰ��
  from gogak g1, gift g2
 where g1.point >  g2.G_START 
 order by ���� ;
 
 --�������� )  gogak, gift ���̺��� ����Ͽ� �̺�Ʈ�� �غ��ؾ� �� �� ��ǰ�� �ִ� ���� ��� 
select  g2.gname as ��ǰ��,
        count(*)
     from gogak g1, gift g2
 where g1.point >=  g2.G_START 
 group by g2.name; --join�� ���� �����ϰ�, group�� ������! 
 
 --��������) student, exam_01, Hakjum ���̺��� ����Ͽ� �� �л��� �̸�, �г�, ��������, ���� ��� 
 select s.name, s.grade, e.total, h.grade
        from student s, exam_01 e, hakjum H
   where s.studno =  e.studno 
     and e.total between h.min_point and h.max_point; 
 
 --��������) student, exam_01, hakjum���̺��� ����Ͽ� �� ������(A,B,C,D// +�� 0 �ϳ��� ��ħ), 
 --�л���, �������, �ִ�����, �ּ����� ��� 
 select substr(h.grade,1,1) as ����,
        count(s.studno) as �л���,
        avg(e.total) as �������, 
        min(e.total) as �ּ�����,
        max(e.total) as �ִ�����
        from student s, exam_01 e, hakjum H
   where s.studno =  e.studno 
     and e.total between h.min_point and h.max_point 
   group by substr(h.grade,1,1)
   order by 1; --�÷��� ������� ù��° �÷��� ���� ������� ����
   
--�������� 1�� 2�� 5�� 
select * from p_grade;
 
