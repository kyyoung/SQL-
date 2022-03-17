----제약조건
--1. not null --> modify 로 수정 
--2. primary key
--3. unique --> 중복된 값을 허용하지 않는다. (하지만, not null 여부까지는 체크하지 않음) 
--4. foreign key --> 부모키 확인 
--5. check 

--제약조건을 확인하는 식, 제약조건이 없는 컬럼은 볼 수 없음  
select * from user_constraints;
select * from user_cons_columns; 

select u1.table_name, u2.column_name,
       u1.constraint_name, u1.constraint_type 
   from user_constraints u1,
        user_cons_columns u2
  where  u1.constraint_name =  u2.constraint_name;  --제약조건이름은 매 시스템마다 다를 수 있음
  
 -- foreign key 설정된 경우 컬럼 삭제
 --emp_t1(deptno) - dept_t1(deptno)
 -- foreign key      reference key 
 create table emp_t1 as select * from emp;
 create table dept_t1 as select * from dept;
 
 alter table dept_t1 add constraints 
       dept1_deptno_pk primary key (deptno); --부모 키 설정!! 
         
 alter table emp_t1 add constraints empt1_deptno_fk 
       foreign key(deptno) references dept_t1(deptno); --포린키 설정할 때 부모키가 먼저 설정되어있어야함  
       
 alter table dept_t1 drop column deptno; --부모 키 컬럼은 삭제할 수 없음 
 alter table dept_t1 drop column deptno
       cascade constraints; --제약조건 없애고 컬럼까지 삭제해달라는 명령어 사용해야함 
       
 select * 
    from user_constraints
   where table_name = 'DEPT_T1'; --확인해보니 제약조건이 날라간 것을 확인할 수 있음 
 
 select * 
    from user_constraints
   where table_name = 'EMP_T1'; --확인해보니 제약조건이 날라간 것을 확인할 수 있음 
   
 alter table emp_t1 drop column deptno; -- 포린키 제약조건이 있어도 자식은 컬럼을 지울 수 있음  
 
 select * 
    from user_constriants --제약조건 함께 삭제
  where table_name in ('EMP_T1', 'DEPT_T1'); 
  
  
  
  --foreign key 옵션 (부모데이터를 지울 때 자식데이터를 어떻게 할것인가에 대한 옵션) 
--  1. on delete cascade : reference key 데이터 지울 때 foreign key 데이터도 함께 삭제
  create table emp_t2 as select * from emp;
  create table dept_t2 as select * from dept;
  alter table dept_t2 add constraint deptt2_deptno_pk 
              primary key(deptno);
            
  alter table emp_t2 add constraint empt2_deptno_fk 
        foreign key(deptno) references dept_t2(deptno)
        on delete cascade; --reference key지울 때 foreign key도 함께 삭제해주는 명령어 
  delete from dept_t2 where deptno = 10; 
  select * from dept_t2;
 --자식쪽 제한은 update,insert (자식쪽은 delete 제한 없음) 
 --부모쪽 제한은 delete ( 부모쪽은 update, insert 제한 없음)
 
 
-- 2. on delete set null :  reference key 데이터 지울때 foreign key 데이터 널 처리, foreign key에 not null 설정시 처리 오류
  alter table emp_t2 drop constraint empt2_deptno_fk; 
  alter table emp_t2 add constraint empt2_deptno_fk 
              foreign key(deptno) references dept_t2(deptno)
              on delete set null; --자식레코드 지우지 않고  null 처리함 
              
  delete from dept_t2 where deptno = 20 ;
  select * from emp_t2;
  
  --제약조건 관리
  alter table : 테이블명 disable/enable [옵션] constraint 제약조건명;
  
    1.disable : 제약조건 삭제 대신 기능 중지
    - validate : disable 후에도 무결성 체크
    - novalidate(기본) : 무결성 체크 하지 않음 
    create table emp_t3 as select * from emp;
    alter table emp_t3 add constraint empt3_empno_pk 
                       primary key(empno);
    insert into emp_t3
    select * from emp where empno = 7369; --무결성 제약조건이기 때문에 데이터가 넣어지지 않음 
    
    alter table emp_t3 disable constraint empt3_empno_pk; --프라이머리키 제약 기능 중지 , 반복되는 데이터 입력 허용 
    
    insert into emp_t3
    select * from emp where empno = 7369; --disable 이후 7369 데이터 입력 가능함
    commit;
    
    select * from emp_t3;
    
    2.enable : 제약조건 기능 활성화
    - validate(기본) : enable 시 기존 데이터 무결성 체크 --enable 설정 이전의 데이터 무결성 체크 
    - novalidate : 무결성 체크하지 않음 
    
    --validate 옵션이 인덱스 때문에 시행되지 않음 
    alter table emp_t3 enable validate 
                       constraint empt3_empno_pk; --검증할 수 없다, 잘못된 기본키입니다. 이유는 중복된 데이터를 입력했기 때문에  pk가 활성화 되지 않음 
    alter table emp_t3 enable novalidate
                       constraint empt3_empno_pk; 
                       
    drop table emp_t3;
    create table emp_t3 as select * from emp;
    alter table emp_t3 modify ename
                constraint empt3_ename_nn not null;
    insert into emp_t3(empno,ename)
                values(9999,null); --입력불가, 제약조건에 위배되는 데이터이기 때문임, null 삽입할 수 없음 
    alter table emp_t3 disable constraint empt3_ename_nn; --제약조건 기능 중지 
    insert into emp_t3(empno, ename) 
                values(9999,null); --입력허용 
    select * from emp_t3;
    
    alter table emp_t3 enable 
                       constraint empt3_ename_nn; --에러발생, 이유는 기존 데이터 무결성이 체크되기 때문에 위배된 데이터가 존재하면 에러발생함 
    alter table emp_t3 enable novalidate 
                       constraint empt3_ename_nn; --가능 novalidate를 활성하여 기존데이터에 대한 무결성 체크를 하지 않음, 하지만 enable을 시행한 이후 무결성 조건에 위배되는 데이터는 삽입되지 않음. 이유는 제약조건을 활성화 시켰기 때문에 제약조건에 위배되는 데이터는 들어올 수 없음 
    insert into emp_t3(empno, ename)
                values(9998, null) ; --입력불가, enable 시행 이후 무조건 입력되는 데이터에 대한 무결성 체크함 
                       
    
                       
    --제약조건 활성화 여부 확인
    select table_name, 
           constraint_name.
           status,  --disable 여부
           validated --validate 여부 
      from user_constriants
    where constraint_name = 'EMPT3_EMPNO_PK'; 
    
    
  
 select u1.table_name, u2.column_name,
       u1.constraint_name, u1.constraint_type, u1.delete_rule --delete_rule : delete_cascade 혹은 set null의 여부가 표시되어 있음 
   from user_constraints u1,
        user_cons_columns u2
  where  u1.constraint_name =  u2.constraint_name;
  