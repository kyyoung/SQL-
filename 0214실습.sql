--p76
--문제3) emp 테이블을 이용하여 업무별(JOB), 부서별(DEPTNO)로 그룹화하여 각각의 인원수와 급여평균을 구하고 
--급여평균이 많은 순으로 정렬하여라

select count(job), count(deptno), avg(sal)
    from emp
  group by job, deptno order by avg(sal) desc;

--선생님  Sql 시행 과정 그룹분리, 연산, 결합  
select job, deptno, count(empno) as 인원수, avg(sal) --인원수 셀 때 empno를 사용하는 이유는 notnull인 칼럼
    from emp
  group by job, deptno order by avg(sal) desc;
  
--문제4
select sum(sal), count(deptno), deptno 
   from EMP
  group by deptno
 having count(deptno) >4;
 
--선생님
select sum(sal), count(empno), deptno 
   from EMP
  group by deptno
 having count(deptno) >4;
 
--문제5
select avg(sal,0) as 급여평균, sum(sal), job --sal에 nvl을 사용해서 null이 있는 경우 0으로 치환하여 환산 
   from EMP
  group by job
 having avg(sal,0) >=3000; 
 
--선생님 
select avg(nvl(sal,0)) as 급여평균, sum(sal), job --sal에 nvl을 사용해서 null이 있는 경우 0으로 치환하여 환산 
   from EMP
  group by job
 having avg(nvl(sal,0)) >=3000; 
 
 --pdf(p18)
-- 1. emp2 테이블과 p_grade 테이블을 조회하여 사원의 이름과 직급, 현재 연봉,     
-- 해당 직급의 연봉의 하한금액과 상한 금액을 출력하세요. 
select e.name, e.position, e.pay, p.position, p.s_pay, p.e_pay
  from emp2 e, p_grade p 
  where e.position = p.position;
  
 --2. 1전공(deptno1)이 101번인 학생들의 학생 이름과 지도교수 이름을 출력하세요.  
select s.name, p.name, p.deptno  
  from student s, professor P
 where s.deptno1 = p.DEPTNO 
   and p.deptno=101; 

select * 
  from professor;

select * 
  from student;
  
 --5. emp2 테이블과 p_grade 테이블을 조회하여 사원들의 이름과 나이, 현재직급, 예상직급을 출력하세요. 
 --예상직급은 나이로 계산하며 소수점이하는 생략하세요.
  
  select e.name, trunc(months_between(sysdate,birthday)/12), e.position, p.position
    from emp2 e, p_grade P
    where trunc(months_between(sysdate,birthday)/12) between p.s_age and p.e_age ; --네츄럴 조인, where절 조건만 만족하는 결과값만 나타남 
    
 --선생님 
select name, trunc((sysdate - birthday)/365) as 나이1,
             trunc(months_between(sysdate, birthday)/12) as 나이2,
             e.position as 이전직급,
             p.position as 현재직급
             from emp2 e, p_grade p
    where trunc(months_between(sysdate,birthday)/12) between p.s_age and p.e_age ;  
  

--1) Student 테이블의 jumin 컬럼을 참조하여 학생들의 이름과 태어난 달, 그리고 분기를 출력하라.
--태어난 달이 01-03월 은 1/4분기, 04-06월은 2/4 분기, 07-09 월은 3/4 분기, 10-12월은 4/4 분기로 출력하라.
select name, to_number(substr(jumin,3,2)), --묵시적 형변이 일어났기 때문에 to_number 처리해주는 것이 좋음 
       case when to_number(substr(jumin,3,2)) between 1 and 3 then '1/4분기'
            when to_number(substr(jumin,3,2)) between 4 and 6 then '2/4분기'
            when to_number(substr(jumin,3,2)) between 7 and 9 then '3/4분기'
            else '4/4분기' 
       end
       from student;
       
 --선생님 
 select name, substr(jumin,1,6),
              to_char(to_date(substr(jumin,1,6)), 'Q'),
              decode(to_char(to_date(substr(jumin,1,6)), 'Q'), 
              '1', '1/4분기',
              '2', '2/4분기',
              '3', '3/4분기', '4/4분기') as 분기1,
              to_char(to_date(substr(jumin,1,6)), 'Q') || '/4분기' as 분기2
              --q는 분기를 구함                                                    
    from student;

  


--2) EMP2 테이블에서 출생년도(1960,1970,1980,1990)별로 평균연봉을 구하라.
 alter session
   set nls_date_format = 'YYYY/MM/DD' ;
 
select * from emp2;
select rpad(to_char(substr(birthday,1,3)),4,'0'), avg(pay) 
  from emp2
 group by to_char(substr(birthday,1,3)); 

--선생님 
select round(avg(pay)),
       trunc(to_number(to_char(birthday, 'YYYY')),-1)
  from emp2
 group by trunc(to_number(to_char(birthday, 'YYYY')),-1);      


--3) emp 테이블에서 인상된 연봉을 기준으로 2000 미만은 'C', 2000이상 4000미만은 'B', 4000이상은 'A' 등급을 부여하여 각 직원의 현재 연봉과 함께 출력
--**인상된 연봉 = 기존 연봉 15% 인상 + 보너스(comm)
select * from emp ;

select ename, sal, sal*1.5+nvl(comm,0) as 인상된연봉,
       case when sal*1.5+nvl(comm,0)<2000 then 'C' 
            when sal*1.5+nvl(comm,0)>=2000 and sal*1.5+nvl(comm,0)<4000 then 'B'
            when sal*1.5+nvl(comm,0)>4000 then 'A'
       end
  from emp;


--선생님 
select ename, sal, sal*1.5+nvl(comm,0) as 인상된연봉,
       case when sal*1.5+nvl(comm,0)<2000 then 'C' 
            when sal*1.5+nvl(comm,0)<4000 then 'B' 
            else 'A'
       end
  from emp;


--4) emp 테이블을 사용하여 연봉기준 등급을 아래의 기준에 맞게 표현하세요.
--2000미만 'C', 2000이상 3000이하 'B', 3000초과 'A' decode문 작성

select ename, sal, decode(sign(2000-sal),-1, decode(sign(3000-sal),-1,'A', 'B'), 'C')     
   from emp; 
   
--선생님
select ename, sal, decode(sign(sal-2000),-1,'C', decode(sign(sal-3000),1,'A', 'B'))     
   from emp; 