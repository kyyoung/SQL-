--시노님
--테이블의 또 다른 이름을 나타내는 객체 

--1.생성
--create [ or replace ] [public] synonym 별칭 
--                               for 원본테이블명;
--or replace : 재생성 옵션
--public : 시노님을 생성한 유저 외에도 사용가능하게함 

--시노님 테스트
--scott  계정의  student 테이블을 hr 계정에서 조회하도록
--1. 권한부여(scott 계정에서 수행) 
grant select on scott.student to hr; 

--2. hr계정에서 테이블 조회 시도
select * from student; -- 권한부여했음에도 조회는 되지않음 
select * from scott.student; --scott에서의 student 테이블을 조회 

--3. 시노님 생성 (SCOTT계정에서 수행) 
create public synonym student for scott.student; 

--4. hr 계정에서 테이블 조회 시도 
select * from student;

--다른계정에서의 같은 이름의 테이블 생성 가능 부득이한 경우 빼고는 같은 이름은 안하는게 좋음 

--2. 삭제
drop [public] synonym 시노님명;

--3. 조회
select *
  from all_synonyms
 where synonym_name = 'STUDENT'; --owner : public // dblink : a 접속자가 b접속자의 데이터에 접속가능하게 연결시켜주는 것 
 
 --권한
 --1. 부여
 --1) 오브젝트 권한 
 grant select, update, delete, insert on 테이블명
       to user명
 --2)시스템권한 
 grant 권한명 to 유저명;
 grant create public synonym to hr; --hr이 권한을 받고 나서 public synonym을 만들 수 있는 권한 생김 
 
 --2. 회수
 revoke 권한명 from 유저명;
 revoke select on scott.student from hr; --hr로부터 부여된 권한을 다시 회수시킴 
 revoke create public synonym from hr; 
 
 --권한 및 시노님 성생 실습1
 
 --1. hr 계정에서 scott계정의 모든 테이블을 조회할 수 있도록 권한 부여
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
--2. scott 계정의 모든 테이블에  public synonym 생성
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
 
 --3. hr 계정에서 조회시도 
 select * 
   from all_synonyms;