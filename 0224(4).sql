--�ó��
--���̺��� �� �ٸ� �̸��� ��Ÿ���� ��ü 

--1.����
--create [ or replace ] [public] synonym ��Ī 
--                               for �������̺��;
--or replace : ����� �ɼ�
--public : �ó���� ������ ���� �ܿ��� ��밡���ϰ��� 

--�ó�� �׽�Ʈ
--scott  ������  student ���̺��� hr �������� ��ȸ�ϵ���
--1. ���Ѻο�(scott �������� ����) 
grant select on scott.student to hr; 

--2. hr�������� ���̺� ��ȸ �õ�
select * from student; -- ���Ѻο��������� ��ȸ�� �������� 
select * from scott.student; --scott������ student ���̺��� ��ȸ 

--3. �ó�� ���� (SCOTT�������� ����) 
create public synonym student for scott.student; 

--4. hr �������� ���̺� ��ȸ �õ� 
select * from student;

--�ٸ����������� ���� �̸��� ���̺� ���� ���� �ε����� ��� ����� ���� �̸��� ���ϴ°� ���� 

--2. ����
drop [public] synonym �ó�Ը�;

--3. ��ȸ
select *
  from all_synonyms
 where synonym_name = 'STUDENT'; --owner : public // dblink : a �����ڰ� b�������� �����Ϳ� ���Ӱ����ϰ� ��������ִ� �� 
 
 --����
 --1. �ο�
 --1) ������Ʈ ���� 
 grant select, update, delete, insert on ���̺��
       to user��
 --2)�ý��۱��� 
 grant ���Ѹ� to ������;
 grant create public synonym to hr; --hr�� ������ �ް� ���� public synonym�� ���� �� �ִ� ���� ���� 
 
 --2. ȸ��
 revoke ���Ѹ� from ������;
 revoke select on scott.student from hr; --hr�κ��� �ο��� ������ �ٽ� ȸ����Ŵ 
 revoke create public synonym from hr; 
 
 --���� �� �ó�� ���� �ǽ�1
 
 --1. hr �������� scott������ ��� ���̺��� ��ȸ�� �� �ֵ��� ���� �ο�
 grant select on emp to hr;
 
 select 'grant select on '||table_name||' to hr;' 
    from user_tables;
    
grant select on EMP_BACKUP222 to hr;
grant select on JUMUN to hr;
grant select on EMP_T3 to hr;
grant select on DEPT_T2 to hr;
grant select on EMP_T2 to hr;
grant select on DEPT_T1 to hr;
grant select on EMP_T1 to hr;
grant select on STUDENT_TEST to hr;
grant select on MEMBER_SECOND to hr;
grant select on MEMBER_FORTH to hr;
grant select on MEMBER_THIRD to hr;
grant select on MEMBER2 to hr;
grant select on DEPT_BACK to hr;
grant select on EMP_BACK22 to hr;
grant select on STUDENT33 to hr;
grant select on STUDENT44 to hr;
grant select on STUDENT4T to hr;
grant select on EMP_BACK2 to hr;
grant select on STUDENT3 to hr;
grant select on STUDENT4 to hr;
grant select on STUDENT2 to hr;
grant select on STUDENT_BACKUP to hr;
grant select on STUDENT_BACK to hr;
grant select on EMP_BACKUP22 to hr;
grant select on EMP_BACKUP3 to hr;
grant select on TEST1 to hr;
grant select on EMP_BACKUP to hr;
grant select on REG_TEST2 to hr;
grant select on MEMBER to hr;
grant select on PANMAE to hr;
grant select on PRODUCT to hr;
grant select on TEST_ENABLE to hr;
grant select on TEST_VALIDATE to hr;
grant select on TEST_NOVALIDATE to hr;
grant select on DML_ERR_TEST to hr;
grant select on P_TOTAL to hr;
grant select on PT_02 to hr;
grant select on PT_01 to hr;
grant select on P_02 to hr;
grant select on P_01 to hr;
grant select on REG_TEST to hr;
grant select on P_GRADE to hr;
grant select on EXAM_01 to hr;
grant select on HAKJUM to hr;
grant select on GOGAK to hr;
grant select on GIFT to hr;
grant select on CAL to hr;
grant select on DEPT2 to hr;
grant select on EMP2 to hr;
grant select on STUDENT to hr;
grant select on DEPARTMENT to hr;
grant select on PROFESSOR to hr;
grant select on TRIM_TEST to hr;
grant select on SALGRADE to hr;
grant select on BONUS to hr;
grant select on EMP to hr;
grant select on DEPT to hr;   
--2. scott ������ ��� ���̺�  public synonym ����
 create public synonym emp for scott.emp; 
 
 select 'create or replace public synonym '||table_name||' for scott.'||table_name||';'
   from user_tables; 
   
 create or replace public synonym EMP_BACKUP222 for scott.EMP_BACKUP222;
create or replace public synonym JUMUN for scott.JUMUN;
create or replace public synonym EMP_T3 for scott.EMP_T3;
create or replace public synonym DEPT_T2 for scott.DEPT_T2;
create or replace public synonym EMP_T2 for scott.EMP_T2;
create or replace public synonym DEPT_T1 for scott.DEPT_T1;
create or replace public synonym EMP_T1 for scott.EMP_T1;
create or replace public synonym STUDENT_TEST for scott.STUDENT_TEST;
create or replace public synonym MEMBER_SECOND for scott.MEMBER_SECOND;
create or replace public synonym MEMBER_FORTH for scott.MEMBER_FORTH;
create or replace public synonym MEMBER_THIRD for scott.MEMBER_THIRD;
create or replace public synonym MEMBER2 for scott.MEMBER2;
create or replace public synonym DEPT_BACK for scott.DEPT_BACK;
create or replace public synonym EMP_BACK22 for scott.EMP_BACK22;
create or replace public synonym STUDENT33 for scott.STUDENT33;
create or replace public synonym STUDENT44 for scott.STUDENT44;
create or replace public synonym STUDENT4T for scott.STUDENT4T;
create or replace public synonym EMP_BACK2 for scott.EMP_BACK2;
create or replace public synonym STUDENT3 for scott.STUDENT3;
create or replace public synonym STUDENT4 for scott.STUDENT4;
create or replace public synonym STUDENT2 for scott.STUDENT2;
create or replace public synonym STUDENT_BACKUP for scott.STUDENT_BACKUP;
create or replace public synonym STUDENT_BACK for scott.STUDENT_BACK;
create or replace public synonym EMP_BACKUP22 for scott.EMP_BACKUP22;
create or replace public synonym EMP_BACKUP3 for scott.EMP_BACKUP3;
create or replace public synonym TEST1 for scott.TEST1;
create or replace public synonym EMP_BACKUP for scott.EMP_BACKUP;
create or replace public synonym REG_TEST2 for scott.REG_TEST2;
create or replace public synonym MEMBER for scott.MEMBER;
create or replace public synonym PANMAE for scott.PANMAE;
create or replace public synonym PRODUCT for scott.PRODUCT;
create or replace public synonym TEST_ENABLE for scott.TEST_ENABLE;
create or replace public synonym TEST_VALIDATE for scott.TEST_VALIDATE;
create or replace public synonym TEST_NOVALIDATE for scott.TEST_NOVALIDATE;
create or replace public synonym DML_ERR_TEST for scott.DML_ERR_TEST;
create or replace public synonym P_TOTAL for scott.P_TOTAL;
create or replace public synonym PT_02 for scott.PT_02;
create or replace public synonym PT_01 for scott.PT_01;
create or replace public synonym P_02 for scott.P_02;
create or replace public synonym P_01 for scott.P_01;
create or replace public synonym REG_TEST for scott.REG_TEST;
create or replace public synonym P_GRADE for scott.P_GRADE;
create or replace public synonym EXAM_01 for scott.EXAM_01;
create or replace public synonym HAKJUM for scott.HAKJUM;
create or replace public synonym GOGAK for scott.GOGAK;
create or replace public synonym GIFT for scott.GIFT;
create or replace public synonym CAL for scott.CAL;
create or replace public synonym DEPT2 for scott.DEPT2;
create or replace public synonym EMP2 for scott.EMP2;
create or replace public synonym STUDENT for scott.STUDENT;
create or replace public synonym DEPARTMENT for scott.DEPARTMENT;
create or replace public synonym PROFESSOR for scott.PROFESSOR;
create or replace public synonym TRIM_TEST for scott.TRIM_TEST;
create or replace public synonym SALGRADE for scott.SALGRADE;
create or replace public synonym BONUS for scott.BONUS;
create or replace public synonym EMP for scott.EMP;
create or replace public synonym DEPT for scott.DEPT;  
 
 --3. hr �������� ��ȸ�õ� 
 select * 
   from all_synonyms;