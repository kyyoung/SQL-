 
--where절 구문 : 행을 선택하기 위한 조건 나열
select *
  from student
 where grade = 4
   and studno=9411;
 
select *
  from student
 where name = '서재수' ;
 문자는 '' 필요 
--예제) student table에서 1학년이면서 키가 170이상인 학생의 이름, 학년, 키 정보 출력 
select name,
       grade,
       height
  from student
 where grade=1
   and height>=170 ;
 
select *
  from EMP
 where ename = 'SMITH' ;
 
--고정된 데이터 안의 대소문자는 구분함, 그렇기에 ename 안에 있는 데이터인 스미스의 철자는 대문자를 입력해야 값이 출력됨 문법은 구분할 필요가 없음 

-- between A and B : A이상 B이하 범위 선택 
select *
  from EMP
 where sal >= 2000
   and sal <= 3000 ;
 
select *
  from EMP
 where sal between 2000 and 3000;
 
--위에와 밑의 출력값은 같다 (이상, 이하일 때) 

--in 연산자 : A 또는 B 또는 .... 포함 연산자
select *
  from student
 where grade = 1
    or grade = 2 ;
 
select *
  from student
 where grade in (1,
               2) ;
 
--위에와 밑의 출력값은 같다 (이상, 이하일 때) 

--연습문제) emp table에서 부서번호가 10번이 아니면서 salary가 3000이상인 직원의 모든 정보 출력
select *
  from EMP
 where deptno !=10
   and sal>=3000 ;
 
--실습예제
select *
  from student;
 
select name || '의' || '키는' || height || 'cm,' || '몸무게는' || weight || 'kg' || '입니다' as "학생의 키와 몸무게"
  from student ;
 
select *
  from professor ;
 
select name || '(' || position || ')' || ',' , name || '''' || position || '''' as "교수님"
  from professor ;
 
select name || || position ||
  from professor ;
 
--like 연산자 : 패턴연산자
select *
  from EMP
 where ENAME like 'S%' ;
 
--대문자 S로 시작하는 이름 -%는 글자수 상관없이 무엇
select *
  from EMP
 where ENAME like '%T' ;
 
--대문자 T로 끝나는 이름
select *
  from EMP
 where ENAME like '%A%' ;
 
--대문자 A를 포함하고 있는 이름 

--예제) emp 테이블에서 이름의 두번째 글자가 A인 직원출력 
select *
  from emp
 where ename like '_A%';
 
--이름의 글자수에 제한이 없음, 둘 째자리가 A인 경우 모두
select *
  from emp
 where ename like '_A___';
 
--이름의 글자수가 제한이 있음, 이름의 길이가 5글자 즉 _ 하나당 글자수 하나임 

--not 연산자 : 부정 연산자

--not between A and B --between A and B를 완전히 부정함, 완전히 반대, a와 b값 포함하지 않음 a미만 b초과 

--not in ('A', 'B' ) --A와 B를 제외

--not like 'A%' --A로 시작하는 
select *
  from EMP
 where sal not between 2000 and 3000;
 
select *
  from student
 where grade not in (1,
               2) ;
 
--null : 공간을 차지하지 않은 데이터, 아직 입력되지 않은 데이터 
       ' ' '  '
--예제) emp 테이블에서  comm이 null인 사원 정보 출력
select *
  from emp
 where comm is null;
 
--아직 입력되지 않은 데이터 null은 대명사라서 '' 안씀
select *
  from emp
 where comm is not null;
 
----참고 : 단축키 정리

--ctrl + - : 드래그 영역 주석설정

--ctrl + shift +- : 주석해제

--ctrl + u :  소문자 변경

--ctrl + shift + u :  대문자 변경

--ctrl + o : 파일열기

--ctrl + t : 새탭열기

--ctrl + enter : 라인단위 실행

--ctrl + shift + f : sql문장(쿼리)의 포맷 변경; sql 문장으로 작성해야 성능에 문제가 없음 
select *
  from professor;
 