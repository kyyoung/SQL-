--뷰(view)
--실제 테이블이 아니지만 테이블처럼 활용가능
--저장공간 할당 X
--뷰를 생성하면 뷰에 연결된 쿼리가 그때마다 실행
--뷰를 통한 dml 작업도 가능
--뷰 생성하려면 create view 권한 필요 
--단순뷰/복합뷰/인라인뷰로 구분 복합뷰--조인, 인라인뷰-서브쿼리 


--1. 뷰생성
create [or replace] view 뷰이름 
as
subquery; --인라인뷰 

--2. 뷰삭제
drop view 뷰이름

--3. 뷰 조회 
select * from user_views = '뷰이름'; 

[뷰 생성/조회/수정 테스트]

1.scott 계정에 뷰 생성 권한 부여(system 계정 수행) 
grant dba to scott; --dba 권한에 대한 묶음 , 시스템 계정에서 명령어 시행이후 scott계정으로 재접속해야 권한이 생성됨 

--2. 뷰생성
create view emp_view
as 
select empno, ename
  from emp;
  
--3. 뷰를 통한 조회
 select * from emp_view; --단순뷰 

--4. 뷰를 통한 수정
select from emp_view --원본이 수정되었으면 수정된 대로 조회가됨 
  where empno =7369; --이걸 시행하면 view의 원본인 emp 테이블의 7369가 삭제됨 
 rollback; 
 
--5. 생성된 뷰 확인
select * from user_views where view_name = 'EMP_VIEW'; --text에서 보여줌 

create or replace view emp_view
as
select empno, ename, sal --sal 을 추가하고 싶을땐 or replace 사용 
  from emp; 
  
--[연습문제]
--학생의 이름, 학번, 학년, 학과이름, 시험성적을 한 테이블처럼 조회가능하도록 뷰 생성
select * from student;
select * from DEPARTMENT;
select * from EXAM_01;

create or replace view student_view
as select s.name, s.studno, s.grade, d.dname, e.total 
    from student s, department d, exam_01 e
   where s.studno = e.studno
     and s.deptno1 = d.deptno; 
    
select * from student_view;
