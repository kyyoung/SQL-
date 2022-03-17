----��������
--1. not null --> modify �� ���� 
--2. primary key
--3. unique --> �ߺ��� ���� ������� �ʴ´�. (������, not null ���α����� üũ���� ����) 
--4. foreign key --> �θ�Ű Ȯ�� 
--5. check 

--���������� Ȯ���ϴ� ��, ���������� ���� �÷��� �� �� ����  
select * from user_constraints;
select * from user_cons_columns; 

select u1.table_name, u2.column_name,
       u1.constraint_name, u1.constraint_type 
   from user_constraints u1,
        user_cons_columns u2
  where  u1.constraint_name =  u2.constraint_name;  --���������̸��� �� �ý��۸��� �ٸ� �� ����
  
 -- foreign key ������ ��� �÷� ����
 --emp_t1(deptno) - dept_t1(deptno)
 -- foreign key      reference key 
 create table emp_t1 as select * from emp;
 create table dept_t1 as select * from dept;
 
 alter table dept_t1 add constraints 
       dept1_deptno_pk primary key (deptno); --�θ� Ű ����!! 
         
 alter table emp_t1 add constraints empt1_deptno_fk 
       foreign key(deptno) references dept_t1(deptno); --����Ű ������ �� �θ�Ű�� ���� �����Ǿ��־����  
       
 alter table dept_t1 drop column deptno; --�θ� Ű �÷��� ������ �� ���� 
 alter table dept_t1 drop column deptno
       cascade constraints; --�������� ���ְ� �÷����� �����ش޶�� ��ɾ� ����ؾ��� 
       
 select * 
    from user_constraints
   where table_name = 'DEPT_T1'; --Ȯ���غ��� ���������� ���� ���� Ȯ���� �� ���� 
 
 select * 
    from user_constraints
   where table_name = 'EMP_T1'; --Ȯ���غ��� ���������� ���� ���� Ȯ���� �� ���� 
   
 alter table emp_t1 drop column deptno; -- ����Ű ���������� �־ �ڽ��� �÷��� ���� �� ����  
 
 select * 
    from user_constriants --�������� �Բ� ����
  where table_name in ('EMP_T1', 'DEPT_T1'); 
  
  
  
  --foreign key �ɼ� (�θ����͸� ���� �� �ڽĵ����͸� ��� �Ұ��ΰ��� ���� �ɼ�) 
--  1. on delete cascade : reference key ������ ���� �� foreign key �����͵� �Բ� ����
  create table emp_t2 as select * from emp;
  create table dept_t2 as select * from dept;
  alter table dept_t2 add constraint deptt2_deptno_pk 
              primary key(deptno);
            
  alter table emp_t2 add constraint empt2_deptno_fk 
        foreign key(deptno) references dept_t2(deptno)
        on delete cascade; --reference key���� �� foreign key�� �Բ� �������ִ� ��ɾ� 
  delete from dept_t2 where deptno = 10; 
  select * from dept_t2;
 --�ڽ��� ������ update,insert (�ڽ����� delete ���� ����) 
 --�θ��� ������ delete ( �θ����� update, insert ���� ����)
 
 
-- 2. on delete set null :  reference key ������ ���ﶧ foreign key ������ �� ó��, foreign key�� not null ������ ó�� ����
  alter table emp_t2 drop constraint empt2_deptno_fk; 
  alter table emp_t2 add constraint empt2_deptno_fk 
              foreign key(deptno) references dept_t2(deptno)
              on delete set null; --�ڽķ��ڵ� ������ �ʰ�  null ó���� 
              
  delete from dept_t2 where deptno = 20 ;
  select * from emp_t2;
  
  --�������� ����
  alter table : ���̺�� disable/enable [�ɼ�] constraint �������Ǹ�;
  
    1.disable : �������� ���� ��� ��� ����
    - validate : disable �Ŀ��� ���Ἲ üũ
    - novalidate(�⺻) : ���Ἲ üũ ���� ���� 
    create table emp_t3 as select * from emp;
    alter table emp_t3 add constraint empt3_empno_pk 
                       primary key(empno);
    insert into emp_t3
    select * from emp where empno = 7369; --���Ἲ ���������̱� ������ �����Ͱ� �־����� ���� 
    
    alter table emp_t3 disable constraint empt3_empno_pk; --�����̸Ӹ�Ű ���� ��� ���� , �ݺ��Ǵ� ������ �Է� ��� 
    
    insert into emp_t3
    select * from emp where empno = 7369; --disable ���� 7369 ������ �Է� ������
    commit;
    
    select * from emp_t3;
    
    2.enable : �������� ��� Ȱ��ȭ
    - validate(�⺻) : enable �� ���� ������ ���Ἲ üũ --enable ���� ������ ������ ���Ἲ üũ 
    - novalidate : ���Ἲ üũ���� ���� 
    
    --validate �ɼ��� �ε��� ������ ������� ���� 
    alter table emp_t3 enable validate 
                       constraint empt3_empno_pk; --������ �� ����, �߸��� �⺻Ű�Դϴ�. ������ �ߺ��� �����͸� �Է��߱� ������  pk�� Ȱ��ȭ ���� ���� 
    alter table emp_t3 enable novalidate
                       constraint empt3_empno_pk; 
                       
    drop table emp_t3;
    create table emp_t3 as select * from emp;
    alter table emp_t3 modify ename
                constraint empt3_ename_nn not null;
    insert into emp_t3(empno,ename)
                values(9999,null); --�ԷºҰ�, �������ǿ� ����Ǵ� �������̱� ������, null ������ �� ���� 
    alter table emp_t3 disable constraint empt3_ename_nn; --�������� ��� ���� 
    insert into emp_t3(empno, ename) 
                values(9999,null); --�Է���� 
    select * from emp_t3;
    
    alter table emp_t3 enable 
                       constraint empt3_ename_nn; --�����߻�, ������ ���� ������ ���Ἲ�� üũ�Ǳ� ������ ����� �����Ͱ� �����ϸ� �����߻��� 
    alter table emp_t3 enable novalidate 
                       constraint empt3_ename_nn; --���� novalidate�� Ȱ���Ͽ� ���������Ϳ� ���� ���Ἲ üũ�� ���� ����, ������ enable�� ������ ���� ���Ἲ ���ǿ� ����Ǵ� �����ʹ� ���Ե��� ����. ������ ���������� Ȱ��ȭ ���ױ� ������ �������ǿ� ����Ǵ� �����ʹ� ���� �� ���� 
    insert into emp_t3(empno, ename)
                values(9998, null) ; --�ԷºҰ�, enable ���� ���� ������ �ԷµǴ� �����Ϳ� ���� ���Ἲ üũ�� 
                       
    
                       
    --�������� Ȱ��ȭ ���� Ȯ��
    select table_name, 
           constraint_name.
           status,  --disable ����
           validated --validate ���� 
      from user_constriants
    where constraint_name = 'EMPT3_EMPNO_PK'; 
    
    
  
 select u1.table_name, u2.column_name,
       u1.constraint_name, u1.constraint_type, u1.delete_rule --delete_rule : delete_cascade Ȥ�� set null�� ���ΰ� ǥ�õǾ� ���� 
   from user_constraints u1,
        user_cons_columns u2
  where  u1.constraint_name =  u2.constraint_name;
  