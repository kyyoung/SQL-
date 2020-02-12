select * from emp

--��������1 emp ���̺��� Ŀ�̼�(comm)�� ���� �ʴ� ����� �޿��� 10% �λ��Ͽ� ǥ���ϵ�, ������ �������� ����Ϸ�
-- The salary of SMITH after a 10% raise is 880
select 'the ' || 'salary ' || 'of ' || ename || ' after ' || 'a ' || 10 || '% ' || 'raise ' || 'is ' ||  sal*1.1 
  from emp 
 where comm is null or comm = 0 ; 

select * from professor
alter session set nls_date_format ='YYYY/MM/DD'; 
--��������2 professor ���̺��� ��ݱ⿡ �Ի��� ������ �̸�, pay,  email_id ��� (email �÷����� ����) 
select name, pay, email || id, hiredate
  from professor
 where substr(hiredate, 6, 2) <='06' 

 
--��������3. student ���̺��� �� �л��� ������ȣ ����
select * from student;
select tel, substr(tel, 1,3)
  from student; 

--��������4. student ���̺��� ���� '��'�� �л��� 
--�й�, �̸�, �г��� ����Ͽ���
select studno, name, grade 
  from student 
 where substr(name,1,1) ='��' or substr(name,1,1)='��' ;
 
--��������5. EMPLOYEES ���̺��� ��Ҹ� �������� �ʰ� email�� last_name�� ���ԵǾ� ���� ���� ����� EMPLOYEE_ID, FIRST_NAME, EMAIL�� ����Ͽ���.
--(EMPLOYEES ���̺��� hr �������� ��ȸ ����)
select * from employees ;
select employee_id, first_name, email, last_name 
  from EMPLOYEES
 where substr(last_name,1) >= substr(email,1); --���Ե��ִ� ��� 
 
select email, upper(last_name) from employees ;

select employee_id, first_name, email, last_name
  from EMPLOYEES
 where not last_name; 

--�ǽ�1
select job, sal, ename, lpad(ename, 15, '*')
  from emp;
--�ǽ�2
select ename, deptno, sal, rpad(sal, 8, 0) 
  from emp
  where sal >1000;

--�ǽ�3
select job, ltrim(job, 'A'), sal, ltrim(sal, 1)
  from emp;
--�ǽ�4 
select job, rtrim(job, 'T'), sal, replace (sal, substr(sal, -1, 1), '')
  from emp ;
--�ǽ�5
select translate(job, 'A', '$') 
  from emp ;