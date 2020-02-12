 --order by ���� : ����

--select�� �����ִ� ��ɹ� from, where, group by, having, order by �׸��� �� ������� ��ɹ��� �ۼ��Ǿ���� (�� ��ɹ��� ������ ����) 
select *
  from emp
 order by sal ;
 
--��������(���� �� ���� ū ��), order by�� �⺻�� 
select *
  from emp
 order by sal desc ;
 
--�������� 

--����) EMP ���̺��� �μ���ȣ��, ������ ���� (ū�������)
select *
  from emp
 order by deptno asc,
       sal desc;
 
select empno as eno,
       ename,
       deptno,
       sal as salary
  from emp
 order by deptno asc,
       salary desc;
 
--alias ��뿹��, order by�������� alias ��� ����, ������ ������ ������(from, where ���)�� select ������ ��������� order by���� select ���Ŀ� ����Ǳ� ������ alias���� ��µ� Į���� �̸��� ���� 
select empno as eno,
       ename,
       deptno,
       sal as salary
  from emp
 where salary >= 1000 --select���� ��õ� alias�� order by�������� ��� ����, �ٸ� ��ɹ������� ���� ��� �Ұ� 
 order by deptno asc,
       sal desc;
 
--alias ��뿹�� 

--dual table : ���̺��� �ʿ���� select�� �ϼ��� ���, dual�̶�� ���̺��� ����Ͽ� ����, ���糯¥�� �ð� ���� ������ �� ���� 
select 24*65
  from dual;
 
select sysdate
  from dual ;
 
select round(1234.56) --round �ݿø� 
  from dual ;
 
--�Լ� :  input�� �Լ��� Ư���� �°� ��ȯ�Ǿ� ���(output)

--initcap : ù ���ڸ� �빮�ڷ� ��ȯ, ���ڿ��� ���� 
select 'abcd',
       initcap('abcd') --camel ǥ��� 
  from dual;
 
select ename,
       initcap(ename)
  from emp;
 
--lower : �ҹ��� ġȯ

--upper : �빮�� ġȯ
select ename,
       lower(ename),
       upper(ename)
  from emp;
 
--length, lengthb : ������ ũ�� ���
select 'abcd',
       length('abcd'),
       lengthb('abcd'),
       '�ѱ�',
       length('�ѱ�'),
       lengthb('�ѱ�')
  from dual ;
 
--�ѱ��� �� ���ڴ� 4����Ʈ, ����� �� ���ڴ� 1����Ʈ, length�� ���ڼ� ��� lengthb�� ����Ʈ ��� 

--substr : �����Լ�(�߿�) 

--substr(�������ڿ�, ������ ����(����)�� ������ġ[, ����]) select�� where������ �ַ� ���, order by������ �� �� ���� [] �κ��� ������ �� �ְ� ������ ��� ������ ��µ� 
select 'abcdefg',
       substr('abcdefg', 1, 2)
  from dual;
 
select 'abcdefg',
       substr('abcdefg', 3) -- [] �κ��� ������ �� �ְ� ������ ��� ������ ��µ� 
  from dual;
 
select 'abcdefg',
       substr('abcdefg', -2, 2) -- ���̳ʽ��� ���̸� �ڿ������� 2��°�� �������� ���������� ��µ� �̰�� fg�� ��� 
  from dual;
 
--�������� student ���̺��� �ֹι�ȣ�� ���� ���л� ������ ���  
select *
  from student ;
 
select *
  from student
 where substr(jumin, 7, 1) =2 ;
 select *
  from student
 where jumin like '______2%' ;
 
--��¥������ Ȯ��! �ý��ۿ� ���� ��¥ ������ �ٲ�� �ֱ� ������ ���� ������ ��ɾ�� �ƴ� 
       alter session
   set nls_date_format = 'YYYY/MM/DD' ;
 
select sysdate,
       substr(sysdate, 1, 4) as "year",
       substr(sysdate, 6, 2) as "month",
       substr(sysdate, -2) as "day"
  from dual ;
 
--�������� student table���� 2���� �¾ �л��� ���
select name,
       birthday
  from student
 where substr(jumin, 3, 2) ='02';
 select name,
       birthday
  from student
 where substr(birthday, 6, 2) ='02';
 
--��¥������ Ȯ��!, /�� ���ԵǾ� ������� 
select name,
       birthday
  from student
 where birthday like '____/02%' ;
 
select name,
       birthday
  from student;
 
--instr : �������ڿ����� Ư�������� ��ġ���� ��� 

--instr(�������ڿ�, ã�����ڿ�[, ������ġ, �߰ߵǴ� ����])
select 'abcab',
       instr('abcab', 'a', 1, 1)
  from dual;
 
--abcab�� ù��° a �� ��ġ��
select 'abcab',
       instr('abcab', 'a', 2, 1)
  from dual;
 
--abcab�� �׹�° a �� ��ġ��
select 'abcab',
       instr('abcab', 'a')
  from dual;
 
--[]�� ���� ���� ����, �� ��� ���� ��ġ�� ��µ� 
select 'abcab',
       instr('abcab', 'd')
  from dual;
--���� ���ڴ� 0 , � ���ڰ� ���ԵǾ��ִ��� �������� ���� Ȱ�� ���� 
select 'abcab',
       instr('abcab', 'a', -3, 1)
  from dual;
 
--substr�� �ٸ��� instr�� ��������� ������ �׷��� ������ a�� ��ġ�� ù ��° ���� a�� ��ġ���� ��µ� 
select instr('abcababcad', 'a', -6, 2) --6��° ���������� ���۵Ǵ� 2��° �߰ߵǴ� a�� ��ġ 
  from dual ;
 
--�ǽ�����1
select empno,
       ename,
       lower(job),
       upper(job),
       initcap(job)
  from emp
 where ename ='SCOTT';
 
--�ǽ�����2
select empno,
       ename,
       job,
       SUBSTR(ENAME, 1, 1)
  from emp
 where substr(ename, 1, 1)>'K';
 
--���ڵ� ��� ������ ������ 

--�ǽ�����3
select ename,
       job
  from emp
 where length(ename)>=6 ;
 
--�ǽ�����4
select ENAME,
       instr(ename, 'L', 1, 1)
  from EMP ;
 
--pad���� : �����Լ�, ����, ������ ���� ���� ����� ������ �Ұ� 

--pad(�������ڿ�, ���ڸ���, ä�﹮�ڿ�) ������ �ڸ���(����Ʈ��) ��ŭ ä�﹮�ڿ��� �ڸ��� �޲� 
select lpad(ename, 10, '*'), --���ʻ��� 
       rpad(ename, 10, '*') --�����ʻ���
  from emp;
 
select lpad(name, 10, '*'), --������, �̹� 6����Ʈ�̹Ƿ� ������ 4����Ʈ�� *�� 4���� ��
       rpad(name, 10, '*')
  from student;
 
--trim : �����Լ�, ���ع��� ������ ���� ������ �� ����, ����, ������

--trim(�������ڿ�[, ���Ź��ڿ�]) --**************************************������ ���忡�� ������ ���Ե� ���ڿ��� ����(cmd â���� ������ �� Ȯ���ϱ�), ���� �����******************************
select 'abcba',
       ltrim('abcba', 'a'), --��������
       rtrim('abcbaaa', 'a'), --����������
       trim( ' abcd  ') --�������Ŵ� ���鸸 ���� ���� 
  from dual;
 
--trim test

--1)test table ����
       create table trim_test(col1 varchar2(5), col2 varchar2(5));
 
--2)test data ����
insert
  into trim_test
values('a',
               'a  ');
 
--3)test data ���� 
       commit;
 
--4)��ȸ 
select *
  from trim_test
 where COL1 ='a';
 
select *
  from trim_test
 where trim(COL2) = 'a';
 
--**ġȯ�Լ�*** �ſ��߿�

--1) replace(�������ڿ�, ã���ܾ�, �ٲܴܾ�)

--2) translate(�������ڿ�, ã������, ��Ī�ȹٲܱ���)
select 'abcda',
       replace ('abcda', 'a', 'A'),
       replace ('abcda', 'ab', 'AB'), --ab�� AB�� ġȯ��, ��Ȯ�ϰ� ab�� ��Ī���ִ� �ܾ ġȯ�̵� 
       translate ('abcda', 'a', 'A'),
       translate ('abcda', 'ab', 'AB') --�ڿ��ִ� a�� A�� ġȯ�� 
  from dual;
 
--replace ������ ���
select 'abcda',
       replace('abcda', 'a', ''),
       translate('abcda', 'a', '') -- translate ������ ��, ������ �ν����� ���� 
  from dual;
 
select 'abcda',
       replace('abcda', 'a', ''),
       translate('abcda', '1a', '1') -- 1�� �ƿ� �����ϱ� ��Ÿ���� �ʰ�, ã�������� a�� �������� �س����� ������ 
  from dual;
 
select 'abcda',
       replace('abcda', 'a', ''),
       translate('abcda', '1ac', '1') --1�� �ƿ� �����ϱ� ��Ÿ���� �ʰ�, ã�������� a�� c�� �������� �س����� ������ 
  from dual;

select translate ('abcda', '!ac', '!'), --�������
       translate ('abcda', 'ac','acv') --�ƹ���ȭ���� 
   from dual;
select translate ('1234', '12', 'ab'), --12�� ab�� ġȯ
       translate ('123421', '12', 'ab'), --12�� 21�� ab�� ġȯ, �� ab ������ ����� ����
       translate ('123421', '12', 'abc'), --12�� 21�� ab�� ġȯ, ������ ������ ��Ī���� �ʾұ� ������ c�� ġȯ���� ���� 
       translate ('123421', '123', 'ab') --123�� 21�� ab�� ġȯ 
   from dual; 
--����) professor ���̺��� ���� ���̵𿡼� Ư������ ��� ������ ���
select id,
       replace(replace(ID, '-', '') , '*', '') --id ���� -�� �������� �ٲ� �Ŀ� *�� �� �������� �ٲٴ� ���� 
  from professor;
 
select id,
       translate(ID, '1!@#$%^&*-', '1') -- id���� 1�� ������ �����ϴ� Ư�����ڴ� �������� ��Ī�ǰ� �������� �ٲ��� 
  from professor;
 
--�������� emp ���̺��� �޿��� ��� ������ �ڸ����� ���
select lpad (sal, 4, '*')
  from emp ;
--�������� student ���̺��� �̸��� �ι�° ���ڸ� #ó��
select name, replace(name, substr(name,2,1), '#' )
  from student ; 

--�������� student ���̺��� ��ȭ��ȣ�� ������ ���� �������� ���� 055 381 2158
select tel,
       translate(tel, ')-', '  ') 
    from student ;  

select tel, replace( replace(tel, ')',' ') , '-', ' ')
  from student;

--�����Լ�
--1. round(����[,�ڸ���]) �ڸ���=�Ҽ��� �ڸ������� ���̴� �� 
select 1234.567, round(1234.567), 
                 round(1234.567, 1), --�Ҽ��� ù°�ڸ����� ���̱�(�ݿø�)
                 round(1234.567, 2), --�Ҽ��� ��°�ڸ����� ���̱�(�ݿø�)
                 round(1234.44,1),
                 round(1234.567, -1) --���� ù��° �ڸ����� �ݿø�, ������ ��ȯ��  
   from dual; 

--2. trunc(���� [,�ڸ���])
select 1234.567,
       trunc(1234.567),
       trunc(1234.567, 1), --�Ҽ��� ù°�ڸ����� ���̱�(����)
       trunc(1234.567, 2) --�Ҽ��� ��°�ڸ����� ���̱�(����)
    from dual; 

--3. mod(����, ����) : ������ ���ϴ� �� 
select mod(9,3), mod(9,2) --9�� 3���� ������ 0, 9�� 2�� ������ 1
  from dual; 
--4. ceil(����) :  (����)���� ũ�鼭 �ּ�����
--5. floor(����) : (����)���� �����鼭 �ִ�����

select 1.3,
       ceil(1.3), --2�� ��� 
       floor(1.3) --1�� ���
  from dual;

--6. abs(����) : ���밪 
select abs(-3) 
  from dual;

--7. sign(����) : ��ȣ�Ǻ� ����� 1, ������ -1, 0�̸� 0���� ����, ���ǹ��� �����Ͽ� ��� 
select sign(-10), sign(10), sign(0)
  from dual; 
--���� sal =3000�̻��̸� A, 
--decode(sign(sal-3000), 1, 'A', 'B'); 

--��¥�Լ� 
--1. sysdate
select sysdate
  from dual; --���糯¥ 
select sysdate + 2
  from dual; --���糯¥�κ��� 2�ϵ� 

  
--����) emp ���̺��� �� ������ �ٹ��ϼ� ��� 
select sysdate -hiredate
  from emp; --��µǴ� �Ҽ����� �ú��ʱ��� ���Ǵ� ��
select trunc(sysdate -hiredate) as �ٹ��ϼ�
  from emp;
select trunc((sysdate -hiredate) / 365) as �ټӳ��
  from emp;

--2. add_months(��¥, n) : n ������ ���
--����) ���� ��¥�κ��� 3���� �� ��¥ ��� 
select sysdate,
       sysdate +5*30, --���� ���� ������ ����Ȯ
       add_months(sysdate,5), --���� ���� ������ ��Ȯ
       add_months(sysdate, -5) --5���� ��
   from dual; 

--3. months_between(��¥1, ��¥2)
--����) emp ���̺��� �� ������ �ٹ������� ��� 
select ename, trunc(months_between(sysdate, hiredate) ) as �ٹ�������
  from emp;

--4. next_day(��¥, ����) : �ٷ� ������ ���� Ư������ �ϼ� ����
--1: �Ͽ��� 2: ������ 3: ȭ���� --- 
select next_day(sysdate, 1) 
  from dual;

alter session set nls_date_language = 'korean' ;
select next_day(sysdate, '��')
  from dual; 

alter session set nls_date_language = 'american' ;
select next_day(sysdate, 'mon')
  from dual; --����� ������ ������ set�� �ٲ���� 
