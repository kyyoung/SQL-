--1) STUDENT���̺��� �� �л��� �̸�, ��1�����а����� ����ϰ� ����������� �̸��� ���������� �Ҽ� �а��� �Բ� ����Ͽ���. ��, ���������� ���� �л��� ��� ���.
select * from student;
select * from professor; 
select * from DEPARTMENT;

select s.name as �л��̸�, d1.dname as ��1�����а���, 
       p.name as �����̸�, d2.dname as �Ҽ��а��� 
   from student s, professor p, department d1, department d2 
  where s.profno = p.profno(+)
  and s.deptno1 = d1.deptno -- �л��� �����а����� ���������� ������ ������ ������ (+) ���� �ʿ� ���� 
  and p.deptno = d2.deptno(+); -- �л��� ���� ���̺��� ���������� ������ ������ ������ ������ �а����� ����ϰ� �л��� ��� �������� (+) �ٿ�����  
  


--2) student ���̺�� exam_01, department ���̺��� 
--�̿��Ͽ� �� �а��� ��� ������ �ְ� ����, ���� ������ 
--��Ÿ���� �а��̸�, �а���ȣ�� �Բ� ���.
select * from student;
select * from DEPARTMENT;
select * from exam_01; 

select avg(total) as ���, max(total) as �ְ�, min(total) as ����, d.dname, s.deptno1
   from student s, department d , exam_01 e 
 where s.studno = e.studno 
 and d.deptno = s.deptno1 
group by s.deptno1, d.dname ;

--3) STUDENT���̺��� ���� �г⳻ �� �л����� Ű�� ū
--�л��� ���� ����ϵ�, �л��̸�, �а���ȣ, �г��� 
--�Բ� ����Ͽ���.
select * from student;

select s1.name, s1.deptno1, s1.grade, count(s2.studno)
  from student s1, student s2
 where s1.grade = s2.grade(+) and s1.height > s2.height(+) --�г��� ����, Ű�� s1 �л��� �� Ŀ����, ���� Ű�� ���� ū �л��� �������� ��µǾ��ϱ� ������ (+) ���̱� 
group by s1.grade, s1.name, s1.deptno1 --�׷����� ������ �л��� ������ �������� ���� 
order by s1.grade, s1.name; 



--4) professor ���̺��� Ȩ������ �ּҰ� ������ 
--�״�� ���, ������ �Ʒ��� ���� ���
--http://www.naver.com/email_id
--��, email_id�� email �ּ��� @ ���� ���ڶ� �����Ѵ�.

select nvl(hpage, 'http://www.naver.com/'||(replace(email, substr(email, instr(email, '@',-1)), ' '))) 
   from professor; 


--5) ����Ʈ�� �ۼ��ϰ��� �Ѵ�.
--emp ���̺��� �̿��Ͽ� �� �μ��� �������� ����ϵ� 
--������ ���� �������� �ۼ��Ͽ���.
--
--����Ʈ��	       10_������	 20_������	  30_�л���
----------------------------------------------------------
--�����̸� ����Ʈ	        3	         5           6


       
 select '����Ʈ' as  ����Ʈ��,
        max(decode(deptno,10, count(deptno)))as "10_������", 
        max(decode(deptno,20, count(deptno))) as "20_������", 
        max(decode(deptno,30, count(deptno))) as "30_������"
   from EMP
  group by deptno; --null���� ���ֱ����� max ��� 
  
select count(deptno) 
  from emp 
 group by deptno; 
  
  
--������
select deptno, count(empno)
   from EMP
 group by deptno; 
 
select '����Ʈ' as  ����Ʈ��,
        count(decode(deptno,10,1)) as "10_������",
        count(decode(deptno,20,1)) as "20_������",
        count(decode(deptno,30,1)) as "30_������"
   from emp;
   


