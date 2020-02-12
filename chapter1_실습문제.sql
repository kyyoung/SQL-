
--실습예제(어려웠음) 
select *
  from student;
 
select name || '의' || '키는' || height || 'cm,' || '몸무게는' || weight || 'kg' || '입니다' as "학생의 키와 몸무게"
  from student ;
 
select *
  from professor ;
 
select name || ' (' || position || ')' || ',' , name || ' ''' || position || '''' as "교수님" --싱글따옴표가 문자열이 되려면 짝수로 써야함, 공백들은 '' 사이에 있는 문자열에서 공백을 만들어야함  
  from professor ;
  
--실습문제1
select empno,
       ename,
       job,
       sal
  from emp
 where sal>=3000 ;
 
--실습문제2
select empno,
       ename,
       job,
       sal,
       deptno
  from emp
 where job = 'MANAGER' ;
 
select *
  from emp
--실습문제3
select empno,
       ename,
       job sal,
       hiredate,
       deptno
  from emp
 where to_char(hiredate, 'YYYYMMDD') >'19820101' ; --to_char date 자료형을 문자열로 변경
 
 select empno,
       ename,
       job sal,
       hiredate,
       deptno
  from emp
 where hiredate >to_date('19820101') ; --to_date 문자열을 date형으로 변경 
 
 --선생님
 select empno,
       ename,
       job sal,
       hiredate,
       deptno
  from emp
 where hiredate >'1982/01/01' ;
 
 select *
  from EMP
 where hiredate between '1982/01/01' and '1982/12/31' ;

--실습문제1
select ename,
       job,
       sal,
       deptno
  from EMP
 where sal between 1300 and 1700 ;

--실습문제2
select empno,
       ename,
       job,
       sal,
       hiredate
  from emp
 where empno in (7902, 7788, 7566) ;
 


--실습문제3 
 select *
  from EMP
 where hiredate like '1982%' ; --출력불가
 
  select *
  from EMP
 where hiredate like '82%' ; --출력됨 이유는 실제 데이터는 82년 이렇게 되있는데 오렌지에 출력되있는 날짜 포맷은 1982년 이렇게 되있음 그렇기에 like 연산자를 사용하려면 원본의 날짜 형식을 사용해야함 
 
--조회되는 현 시점에 날짜 형식을 원하는 포맷으로 변경 
alter session set nls_date_format ='YYYY/MM/DD'; --세션에 대한 변경을 허락함, 오렌지를 다시 껐다가 키면 형식이 원 상태로 돌아옴 

 
--실습문제4
select ename, 
       SAL
  from emp
 where ename like 'M%' ;
 
--실습문제5
select ename,
       job
  from EMP
 where ename like '_L%' ;
 
--실습문제6
select empno,
       ename,
       sal,
       hiredate,
       deptno,
       comm
  from emp
 where comm is null
--실습문제7
select empno,
       ename,
       job,
       sal,
       hiredate,
       deptno
  from emp
 where sal>=1100
   and job = 'MANAGER'
--실습문제8
select empno,
       ename,
       job,
       sal,
       hiredate,
       deptno
  from emp
 where sal>=1100
   and ename not like 'M%' ;
 
--실습문제9
select empno,
       ename,
       job,
       sal,
       deptno
  from emp
 where job != 'MANAGER'
   and job != 'CLERK'
   and job != 'ANALYST'
   
--실습문제10
select empno,
       ename,
       job,
       sal
  from emp
 where job ='PRESIDENT'
   and sal >=1500
    or job ='SALESMAN' ;
 