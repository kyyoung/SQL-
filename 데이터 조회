데이터 조회 방법 

DESC 테이블명 
해당 테이블의 정보를 조회할 수 있음 

SELECT 변수 (* | 컬럼명 | 표현식 )
  from 테이블명 | 뷰명
SELECT 문장을 이용하여 원하는 데이터를 가져올 수 있음 

SELECT empno, ename, sal 
  from emp; 
SQL 명령문은 대소문 구분을 하지 않음 

SELECT empno, sal, sal*1.1, 1111, 'abcd' 
  from emp; 
SQL 명령문은 변수에 곱하기를 할 수 있고, 숫자와 문자를 바로 출력할 수 있음. 단 문자의 경우 ''를 붙여야함 

SELECT *
  from employees; employees의 데이터는 hr계정에 있는 데이터이기에 scott계정에서 불러오면 출력할 수 없음 
  **스키마개념

***ALIAS : 칼럼의 이름을 출력시 변경하여 출력, 단 원 데이터는 변하지 않고 출력값만 변한다
select empno as 사원번호, ename as 사원이름, sal as 급여 
  from emp; 
  (단, as 는 생략 가능하지만 헷갈릴 수 있기 때문에 사용하는 것이 좋음)
  *사원 번호 라고 공백을 넣고 싶으면 "사원 번호" 
   사원이름! 이라고 느낌표(특수문자)를 넣고 싶으면 "사원이름!"
   소문자(대 소문자)를 그대로 출력하고 싶으면 "salary" 
   위와 같은 경우에는 겹 따옴표 " " 를 사용하고 이외의 것은 홑 따옴표 ' ' 
--연습문제1
select deptno as 부서 #, dname as 부서명, loc as 위치
 from dept; --#은 숫자로 인식되기 때문에 "" 사용안해도됨 
   
***연결연산자 ( || ) 칼럼과 칼럼, 칼럼과 표현식을 연결하고자 하는 대상 사이에 사용한다
select empno || ename 
  from emp;
empno와 ename이 붙여져 하나의 칼럼으로 합쳐 나온다. 

7369-smith 이렇게 bar를 붙이는 형식을 출력하려면 '' 사용
select empno || '-' || ename 
  from emp; 
  
***distinct : 중복행 제거, 뒤에 나열된 칼럼 데이터의 유일한 값만 출력, 즉 유니크한 값만 보고 싶을 때 사용
distinct는 무조건 select 뒤에 와야함, 칼럼 뒤에 쓰는 것은 아님 
select distinct deptno
  from emp; --부서가 같은값은 생략됨 
select distinct deptno, job
  from emp; --부서와 직업이 같은값은 생략됨

--연습문제1
select distinct deptno, job
  from emp; 

***where절 구문 : 행을 선택하기 위한 조건 나열 
select *
  from student 
 where grade = 4 and studno = 9411;

select * 
  from student
 where name = '서재수'; --문자는 '' 필요

select *
  from emp
 where ename ='SMITH'; 
 --고정된 데이터 안의 데이터 대소문자는 구분함, 그렇기에 ename안에 있는 데이터인 스미스의 철자는 대문자를 입력해야 값이 출력됨
                         (cf: 명령어 상의 대소문자는 구분할 필요는 없음) 
 
예제)student table에서 1학년이면서 키가 170이상인 학생의 이름, 학년, 키 정보 출력
select name, grade, height 
  from student
 where grade=1 and height >=170;

*** between A and B : A이상 B이하 범위 선택 
select * 
  from EMP 
 where sal >= 2000 
   and sal <= 3000 ;
 
select * 
  from EMP 
 where sal between 2000 and 3000; 
  
*** in 연산자: A 또는 B 또는 ... 포함 연산자 
select *
  from student 
 where grade = 1 
    or grade = 2 ; 
  
select * 
  from student 
 where grade in (1, 2) ; 
   
--연습문제) emp table에서 부서번호가 10번이 아니면서 salary가 3000이상인 직원의 모든 정보 출력
select * 
  from EMP 
 where deptno != 10 
   and sal >= 3000 ; 
   
 *** like 연산자 : 패턴연산자 
 select * 
   from EMP 
  where ENAME like 'S%' ; 
-- 대문자 S로 시작하는 이름  

select *
  from EMP 
 where ENAME like '%A%' ; 
-- 대문자 A를 포함하고 있는 이름 

--예제) EMP 테이블에서 이름의 두번째 글자가 A인 직원 출력 
select * 
  from emp 
 where ename like '_A%';  
-- 이름의 글자수에 제한이 없음, 둘 째 자리가 A인 경우  

select *
  from emp 
 where ename like '_A__'; 
--이름의 글자수가 제한이 있음, 이름의 길이가 5글자 _ 하나 당 글자수 하나! 
 
*** not 연산자 : 부정연산자 
 not between A and B : between A and B를 완전히 부정, a 미만 b 초과 
 
 not in ('A', 'B') : A와 B를 제외 
 
 not like 'A%' : A로 시작하는 것 제외 
 
*** null : 입력되지 않는 데이터, 공간을 차지하지 않는 데이터 
select * 
  from emp 
 where comm is null 
-- emp 테이블에서 comm이 null인 사원 정보 출력 

select * 
  from emp 
 where comm is not null; 
-- comm이 null이 아닌 데이터 출력 
 
 
 
  
  
  
  
