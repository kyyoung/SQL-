--decode(대상, 조건1, 치환1, else값) 
--예제)
--deptno가 10인 직원중 job이 clerk인 직원은 A부서로, 나머지 직원은 B부서로, 20인 직원은 C부서로, 30인 직원은 D부서로 이동
select ename, job, deptno,
       decode(deptno, 10, decode(job, 'CLERK', 'A', 'B'),
                      20, 'C',
                      30, 'D')
  from emp; 
  
----2 case 문 decode 두 번 쓰는거 보다 case 쓰는게 더 성능이 좋음 하지만 가독성은 decode가 더 좋음 
--case when 조건1 then 치환1 
--     when 조건2 then 치환2 
--     -----
--                else "else치환값" 
--  end 
--**사용할 때 조건과 치환값이 동일 데이터 형태인지를 먼저 확인해야함, 날짜-날짜, 문자-문자, 숫자-숫자 형식으로!!!!!!(desc로 확인) 

--예제) deptno가 10이면 A, 20 이면 B, 30이면 C로 치환
select ename, deptno, 
       case when deptno=10 then 'A'
            when deptno=20 then 'B'
            when deptno=30 then 'C'
   end as 새부서명
  from emp; 
  
 --축약가능(컬럼과 동일 조건일 때) 
 select ename, deptno, 
    case deptno when 10 then 'A'
                when 20 then 'B'
                when 30 then 'C'
   end as 새부서명2
  from emp; 
  
 --그룹함수(복수행함수) : 여러행 데이터 입력, 한 건 출력
 --1. count
 select count(*), count(empno), count(comm)
   from emp; --null은 세지 않기 때문에 comm은 값이 있는 4개만 출력됨
 desc emp; -- not null이 설정되어 있는 컬럼을 확인한 후 count(empno)로 하는 것이 가동성이 좋음 
 
--2. sum
select sum(sal), sum(comm)
  from emp;

--3. avg
select avg(sal), 
       avg(comm), --null 제외인 4명에 대한 평균
       sum(comm)/count(*), avg(nvl(comm,0)) --전체 컬럼의 개수인 14명에 대한 평균 
   from emp;

--4. min/max
select min(sal), max(sal), sal -- 그룹함수와 그룹함수가 아닌 것은 같이 쓸 수 없음, 그룹함수끼리만 사용할 수 있음   
  from emp; 
  
--group by 구문 : 특정 그룹별 그룹함수의 연산결과 출력 
--예제) emp 테이블에서 부서별 최대연봉 출력 
select max(sal), deptno --그룹함수끼리 출력가능하기 때문에, 그룹함수가 아닌 컬럼은 단독사용 불가하지만 group by에 쓰인 컬럼절은 쓰일 수 있음 컬럼의 수가 맞기 때문에 
  from emp
 group by deptno; 
 
 --예제)student 테이블에서 학년별, 성별 키의 평균
 select grade,  decode(substr(jumin, 7,1), '1', '남', '여') as 성별 , 
                round(avg(height),1) as 평균키,
                max(height) as 최대키 
   from student
  group by grade, substr(jumin, 7,1) 
  order by grade, 성별;
 
--having 절 :  group by 연산 결과에 조건 추가 할 때 사용
--문법의 순서
--select 
--   from
--  where
--  group by
--having
-- order

--연산의 순서 
--from 
--where
--group by
--having --group by 이후의 조건절을 수행하기 위해서
--select
--order by -- 데이터 값을 만든 후 출력은 사용자가 원하는 대로 출력해주는 것임 

--예제) 부서별 평균연봉이 2500이상인 부서 출력-- where 절을 사용하면 명령문이 수행되지 않음 이유는  where가 먼저 수행되고 그다음 group by가 수행되기 때문 
--select avg(sal) 
--  from EMP
--  where avg(sal) >= 2500
-- group by deptno   ---- 시행되지 않은 구문
--having 절을 사용해야지 출력됨 
select avg(sal) 
 from EMP
  group by deptno
having avg(sal) >= 2500; 

--예제) 부서별 평균연봉 출력, 10번 부서 제외 
 
select avg(sal), deptno 
 from EMP
  group by deptno
having deptno != 10 ; 

select avg(sal), deptno 
   from EMP
  where deptno !=10
 group by deptno; 

--where절과 having절 모두 사용되는 경우에는 where절을 쓰는 것이 더 성능이 좋음 
