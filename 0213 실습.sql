--��������1) studentt ���̺��� �����÷� ����(����, ����) 
select name, jumin,
    case when substr(JUMIN, 7,1) = '1' then '����'
         when substr(JUMIN, 7,1) = '2' then '����'
    end as ���� 
  from student; 
  
--���
select name, jumin,
    case substr(JUMIN, 7,1) when '1' then '����'
                                     else '����' 
    end as ���� 
  from student; 
  
--decode���
select name, jumin, substr(jumin,7,1), decode(substr(jumin,7,1),'1', '����', '����') as ����1 --jumin �÷� ���ڿ��̱� ������ 1�� ''

desc student;

--��������2) emp ���̺��� sal�� ��� �ο�, sal�� 3000 �ʰ��� ��� 'A', �� �� 'B' 
select ename, sal,
    case when sal >3000  then 'A'
         when sal <=3000 then 'B'
     end as sal���
   from emp;

--decode 
select ename,sal, decode(sign(sal-3000), 1, 'A', 'B') --sign�Լ��� �̿��ϴ� ���� �ٽ�! 
  from emp; 
