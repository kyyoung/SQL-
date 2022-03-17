-- dml(������ ���� ���) : insert / update / delete / merge 
-- merge : insert, update, delete ���� ���� ����
-- merge into ���̺��(�����Ϸ���)
--    using ���̺��(�������̺�)
--       on ��������(��������) 
--   when matched then
--        update / insert / delete
--   when not matched then
--        update / insert / delete; 
        
 select * from pt_02; 
 
 --������ ��ųʸ� : �����ͺ��̽� ���������� �߻��ϴ� ��� ������ ����� �ý��� ���ɰ� ���õ� �ڷḦ ���� �� �����ϴ� ���� 
-- base table + data dictionary view 
-- (raw data)   (raw data ������ ��� ���ִ� ���)
-- 
-- 1. base table : ���� �Ұ� 
-- 
-- 2. data dictionary view
-- 1) static dictionary view : ���������� ����
--   -dba_xxxx : dba������ ���� �� ��ȸ ���� (dba ���� �ʿ�) 
--   -all_xxxx : ���� ������ ������ �ִ� ��ü ��ȸ ����
--   -user_xxxx : ���� ������ ��ü�� ��ȸ ����

select * from user_tables; -- scott���μ����� ���̺��� ��� ��µ� 
select * from all_tables; --scott �������� ������ �� �ִ� ���̺� ��� ��µ�
select * from dba_tables; --system���� ��� �����Ϳ� ���Ӱ����� 
select count(*) from dba_tables; 

--** �߿� ������Ʈ ���� �� 
select * from user_tables; --���̺� ����
select * from user_tab_columns; --���̺� �÷� ����
select * from user_views; --������
select * from user_constraints; --�������� ����
select * from user_indexes; --�ε��� ���� 

-- 2)dynamic performance view : ���������� ����
--   -v$xxxx
   
 select * from v$session; --v$session(���̺��� �ƴ� view)�� system������ ���� ���� ����, �ҷ����ǵ� ��Ƴ� osuser�� ���� ��� ��ǻ�Ϳ� ���� �۾��ϴ°� �� ����  
 
 create view abcd --view�� ��������� ���� ����  
 as
 select * from scott.emp e, scott.dept d where e.deptno = d.deptno;   --create ~ �ý��۰������� ��������. 
 
 select * from abcd; --view�� ���̺�ó�� �����. ������ �������� �ʾ����� ���̺�ó�� ��� ���� 
 