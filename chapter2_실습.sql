select * from emp

--연습문제1 emp 테이블에서 커미션(comm)을 받지 않는 사원의 급여를 10% 인상하여 표시하되, 다음의 형식으로 출력하려
-- The salary of SMITH after a 10% raise is 880
select 'the ' || 'salary ' || 'of ' || ename || ' after ' || 'a ' || 10 || '% ' || 'raise ' || 'is ' ||  sal*1.1 
  from emp 
 where comm is null or comm = 0 ; 

select * from professor
alter session set nls_date_format ='YYYY/MM/DD'; 
--연습문제2 professor 테이블에서 상반기에 입사한 교수의 이름, pay,  email_id 출력 (email 컬럼에서 추출) 
select name, pay, email || id, hiredate
  from professor
 where substr(hiredate, 6, 2) <='06' 

 
--연습문제3. student 테이블에서 각 학생의 지역번호 추출
select * from student;
select tel, substr(tel, 1,3)
  from student; 

--연습문제4. student 테이블에서 성이 'ㅅ'인 학생의 
--학번, 이름, 학년을 출력하여라
select studno, name, grade 
  from student 
 where substr(name,1,1) ='서' or substr(name,1,1)='신' ;
 
--연습문제5. EMPLOYEES 테이블에서 대소를 구분하지 않고 email에 last_name이 포함되어 있지 않은 사람의 EMPLOYEE_ID, FIRST_NAME, EMAIL을 출력하여라.
--(EMPLOYEES 테이블은 hr 계정에서 조회 가능)
select * from employees ;
select employee_id, first_name, email, last_name 
  from EMPLOYEES
 where substr(last_name,1) >= substr(email,1); --포함되있는 사람 
 
select email, upper(last_name) from employees ;

select employee_id, first_name, email, last_name
  from EMPLOYEES
 where not last_name; 

--실습1
select job, sal, ename, lpad(ename, 15, '*')
  from emp;
--실습2
select ename, deptno, sal, rpad(sal, 8, 0) 
  from emp
  where sal >1000;

--실습3
select job, ltrim(job, 'A'), sal, ltrim(sal, 1)
  from emp;
--실습4 
select job, rtrim(job, 'T'), sal, replace (sal, substr(sal, -1, 1), '')
  from emp ;
--실습5
select translate(job, 'A', '$') 
  from emp ;