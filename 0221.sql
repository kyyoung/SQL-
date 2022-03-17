-- dml(데이터 수정 언어) : insert / update / delete / merge 
-- merge : insert, update, delete 동시 수행 가능
-- merge into 테이블명(수정하려는)
--    using 테이블명(기준테이블)
--       on 병합조건(연결조건) 
--   when matched then
--        update / insert / delete
--   when not matched then
--        update / insert / delete; 
        
 select * from pt_02; 
 
 --데이터 딕셔너리 : 데이터베이스 내부적으로 발생하는 모든 구조적 변경과 시스템 성능과 관련된 자료를 수집 및 저장하는 공간 
-- base table + data dictionary view 
-- (raw data)   (raw data 접근을 대신 해주는 대상)
-- 
-- 1. base table : 접근 불가 
-- 
-- 2. data dictionary view
-- 1) static dictionary view : 구조정보와 관련
--   -dba_xxxx : dba권한을 갖은 자 조회 가능 (dba 권한 필요) 
--   -all_xxxx : 현재 유저에 권한이 있는 객체 조회 가능
--   -user_xxxx : 본인 소유의 객체만 조회 가능

select * from user_tables; -- scott본인소유의 테이블이 모두 출력됨 
select * from all_tables; --scott 계정에서 접속할 수 있는 테이블 모두 출력됨
select * from dba_tables; --system안의 모든 데이터에 접속가능함 
select count(*) from dba_tables; 

--** 중요 오브젝트 관련 뷰 
select * from user_tables; --테이블 정보
select * from user_tab_columns; --테이블내 컬럼 정보
select * from user_views; --뷰정보
select * from user_constraints; --제약조건 정보
select * from user_indexes; --인덱스 정보 

-- 2)dynamic performance view : 성능정보와 관련
--   -v$xxxx
   
 select * from v$session; --v$session(테이블이 아닌 view)은 system계정에 들어가야 접근 가능, 불량세션들 잡아냄 osuser를 통해 어느 컴퓨터에 무슨 작업하는거 다 나옴  
 
 create view abcd --view는 저장공간을 갖지 않음  
 as
 select * from scott.emp e, scott.dept d where e.deptno = d.deptno;   --create ~ 시스템계정에서 만들어야함. 
 
 select * from abcd; --view를 테이블처럼 사용함. 실제로 저장하진 않았지만 테이블처럼 사용 가능 
 