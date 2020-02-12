-- 계정 lock 해제
alter user scott account unlock;

--계정 패스워드 변경
alter user scott identified by oracle;

--ctrl + enter : 커서 위치 라인 실행
--ctrl + n : 새로운 접속 화면 

select * from emp;
desc emp ; 
--사용자 식별 데이터 주민번호나 학번, 사원번호 같은 경우는 not null
--하나의 컬럼에는 하나의 타입만 입력가능, 숫자칼럼이면 숫자, varchar2(문자)면 varchar2 식으로
-- Number(7,2) 7자리숫자 중 2자리는 소수점자리 (10) 10자리

select *
 from emp ;
 
select empno, ename, SAL
 from emp ; --sql은 대소문 구분 안함
 
select empno, sal, sal*1.1, 1111 --1111 데이터 출력 가능 
 from emp ;
select empno, sal, 1111, 'abcd' --문자열은 반듯이 ''가 필요함 
 from emp ;
 
 select *
  from EMPLOYEES; --스키마: hr스키마 hr계정에 있는 테이블 혹은 모든 데이터 
  
6.
컬럼 별칭 (alias) : 컬럼의 이름을 출력시 변경하여 출력 (원본은 절대 변하지 않고, 출력할 때에만 변한다)
select empno as 사원번호, ename as 사원이름, sal as 급여
from emp;
"AS" 는 생략 가능하다.  대부분 현업에서는 가독성을 위해 쓰는 경우가 많음.
<사원 번호> 라고 띄어쓰기(공백)를 하고 싶으면? 그냥 사원 번호 라고 쓰면 에러가 생긴다.
겹 따옴표를 써야만 에러가 생기지 않는다. "사원 번호"
<사원이름!> 이라고 느낌표(특수문자)를 쓰고 싶으면? 그냥 쓰면 에러가 남.
겹따옴표를 써야만 에러가 나지 않음.  "사원 이름"
소문자(대 소문자)를 그대로 표현하고 싶다면? 
겹따옴표를 써야만 에러가 나지 않음.  "salary"
 
**AS 할 때만 겹 따옴표 쓰고, 나머지는 모두 홑 따옴표다!**
 
select empno as "사원 번호"
ename "사원이름!"
sal as "salary"
from emp;
 
 
7. 
연결 연산자 (||) <- shit & \ 누르면 나옴 : 컬럼과 컬럼, 컬럼과 표현식을 연결. 연결하고자하는 대상 사이에 쓴다.
select empno||ename
from emp;
하나의 컬럼으로 합쳐져서 나온다. 
 
예제)
emp 테이블에서 사원번호와 이름을 아래 형식으로 출력
7369-smith
>>
select empno||'-'||ename
from emp;
 
**형식을 변경할거면 아예 sql단에서 하고, 추가적으로 필요한 행위를 r과 파이썬에서 하는게 더 빠르다.
 
8.
distinct: 중복행 제거, 뒤에 나열된 컬럼 데이터의 유일한 값만 출력.  유니크한 값만 보고 싶다.
distinct 는 무조건 select 뒤에 와야함. 컬럼 뒤 X
select distinct deptno
from emp;
결과값 3개
 
select distinct deptno, ename
from emp;
같은 부서에 동명이인이 있었다면 생략됐을 것.
결과값 14개 
 
select distinct deptno, job
from emp;
같은 부서에 같은 직업을 가진 사람이 있다면 생략됐을 것.
 
 
===============
 
Alias 연습문제 1 
 
select deptno as 부서#, dname as 부서명, loc as 위치
from dept;
 
#은 예외적으로 쌍따옴표를 쓰지 않아도 된다.
 
Distinct 연습문제 1 
 
select distinct deptno, job
from emp;
 
 
======================
 
ctrl + T = 탭 나누기
 
save workspace as .... = sql 묶음파일. 탭 여러개
open workspace .... =sql 묶음파일 열 때
 
open = 일반 파일 열 때.
 
======================
 
primary key 중복될 수 없는것.
 
insert into professor values (....) <- 테이블 순서와 동일해야 한다. 
 
SCOTT 계정에 datebase_test 파일을 넣음.
 
=====================


