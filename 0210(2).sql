 
--where�� ���� : ���� �����ϱ� ���� ���� ����
select *
  from student
 where grade = 4
   and studno=9411;
 
select *
  from student
 where name = '�����' ;
 ���ڴ� '' �ʿ� 
--����) student table���� 1�г��̸鼭 Ű�� 170�̻��� �л��� �̸�, �г�, Ű ���� ��� 
select name,
       grade,
       height
  from student
 where grade=1
   and height>=170 ;
 
select *
  from EMP
 where ename = 'SMITH' ;
 
--������ ������ ���� ��ҹ��ڴ� ������, �׷��⿡ ename �ȿ� �ִ� �������� ���̽��� ö�ڴ� �빮�ڸ� �Է��ؾ� ���� ��µ� ������ ������ �ʿ䰡 ���� 

-- between A and B : A�̻� B���� ���� ���� 
select *
  from EMP
 where sal >= 2000
   and sal <= 3000 ;
 
select *
  from EMP
 where sal between 2000 and 3000;
 
--������ ���� ��°��� ���� (�̻�, ������ ��) 

--in ������ : A �Ǵ� B �Ǵ� .... ���� ������
select *
  from student
 where grade = 1
    or grade = 2 ;
 
select *
  from student
 where grade in (1,
               2) ;
 
--������ ���� ��°��� ���� (�̻�, ������ ��) 

--��������) emp table���� �μ���ȣ�� 10���� �ƴϸ鼭 salary�� 3000�̻��� ������ ��� ���� ���
select *
  from EMP
 where deptno !=10
   and sal>=3000 ;
 
--�ǽ�����
select *
  from student;
 
select name || '��' || 'Ű��' || height || 'cm,' || '�����Դ�' || weight || 'kg' || '�Դϴ�' as "�л��� Ű�� ������"
  from student ;
 
select *
  from professor ;
 
select name || '(' || position || ')' || ',' , name || '''' || position || '''' as "������"
  from professor ;
 
select name || || position ||
  from professor ;
 
--like ������ : ���Ͽ�����
select *
  from EMP
 where ENAME like 'S%' ;
 
--�빮�� S�� �����ϴ� �̸� -%�� ���ڼ� ������� ����
select *
  from EMP
 where ENAME like '%T' ;
 
--�빮�� T�� ������ �̸�
select *
  from EMP
 where ENAME like '%A%' ;
 
--�빮�� A�� �����ϰ� �ִ� �̸� 

--����) emp ���̺��� �̸��� �ι�° ���ڰ� A�� ������� 
select *
  from emp
 where ename like '_A%';
 
--�̸��� ���ڼ��� ������ ����, �� °�ڸ��� A�� ��� ���
select *
  from emp
 where ename like '_A___';
 
--�̸��� ���ڼ��� ������ ����, �̸��� ���̰� 5���� �� _ �ϳ��� ���ڼ� �ϳ��� 

--not ������ : ���� ������

--not between A and B --between A and B�� ������ ������, ������ �ݴ�, a�� b�� �������� ���� a�̸� b�ʰ� 

--not in ('A', 'B' ) --A�� B�� ����

--not like 'A%' --A�� �����ϴ� 
select *
  from EMP
 where sal not between 2000 and 3000;
 
select *
  from student
 where grade not in (1,
               2) ;
 
--null : ������ �������� ���� ������, ���� �Էµ��� ���� ������ 
       ' ' '  '
--����) emp ���̺���  comm�� null�� ��� ���� ���
select *
  from emp
 where comm is null;
 
--���� �Էµ��� ���� ������ null�� ����� '' �Ⱦ�
select *
  from emp
 where comm is not null;
 
----���� : ����Ű ����

--ctrl + - : �巡�� ���� �ּ�����

--ctrl + shift +- : �ּ�����

--ctrl + u :  �ҹ��� ����

--ctrl + shift + u :  �빮�� ����

--ctrl + o : ���Ͽ���

--ctrl + t : ���ǿ���

--ctrl + enter : ���δ��� ����

--ctrl + shift + f : sql����(����)�� ���� ����; sql �������� �ۼ��ؾ� ���ɿ� ������ ���� 
select *
  from professor;
 