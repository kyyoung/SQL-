--��¥�Լ�
--5 last_day(��¥) : �ش糯¥�� ���� ���� ������ ��¥
select sysdate, last_day(sysdate)
  from dual;
  
--6. round(��¥, ����)
--7. trunc(��¥, ����)
select sysdate,
       round(sysdate), --�ϴ��� �ݿø�
       round(sysdate, 'month'), --������ �ݿø�
       round(sysdate, 'month') --������ ���� 
    from dual; 
 
 --�� ��ȯ �Լ� : ������ Ÿ�� ���� 
 --1. to_char : ����, ��¥�� ����Ÿ������ ����
 --2. to_number : ���ڴ� ���ڷ� ��ȯ  
 select to_number('1') + 1
   from dual; -- ������ ����ȯ, ����Ŭ DB�� Ư¡�� 
 
 --3. to_date : ����, ���ڸ� ��¥Ÿ������ ����************************�߿� 
 select '2020/02/05' + 100 --'2020/02/05'�� ��¥�� �ν����� ���ϱ� ������ ���� ���� 
   from dual; 
 select to_date('2020/02/05') + 100 --'2020/02/05'�� ��¥�� �ν����� ���߱� ������ ��¥Ÿ������ �ٲ��ִ� ��ɾ� ���
   from dual; 
   
  select to_date('02/05/2020', 'MM/DD/YYYY')  --������ �����������, ��¥�� ������ �ٲ�°� �ƴ�, ������ �״�� YYYY/MM/DD�̰� ��¥�� �ý��ۿ� ���� �ν��Ͽ� ����Ŭ ���˿� �°� �������  
   from dual; 
   
  select to_date('02/05/2020', 'DD/MM/YYYY')  --������ ����������� 
   from dual; 
   
  select to_date('89/12/05','YY/MM/DD')  --YY��� �������ָ� 2000���� ��ȯ�� 
   from dual; 
  select to_date('89/12/05','RR/MM/DD')  --RR��� �������ָ� 90���� ��ȯ�� 
   from dual; 
  select to_date('89/12/05')  --���������ָ� �ڵ����� ������, 0089�� ���
   from dual; 
  select to_date('17/12/05')  --���������ָ� �ڵ����� ������, 0017�� ���  
   from dual; 
  
  --��������) student ���̺��� jumin �÷��� ����Ͽ� �л��� ��������� �� ������ �Ͽ����� ��¥ ���
  select jumin, next_day(to_date(substr(jumin,1,6),'RR/MM/DD'),1)
    from student;
    
 
  
   
   