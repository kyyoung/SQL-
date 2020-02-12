--연습문제) student 테이블에서 jumin 컬럼을 사용하여 학생의 생년월일의 그 다음주 일요일의 날짜 출력
  select jumin, next_day(to_date(substr(jumin,1,6),'RR/MM/DD'),1)
    from student;
  
  alter session set nls_date_format ='YY/MM/DD'; 
  select jumin, next_day(to_date(substr(jumin,1,6)),1)
    from student;
  
  
  select birthday, next_day(birthday,1)
    from student;

--P44(pdf) 
--문제1) EMP 테이블에서 현재까지 근무일수가 몇 주, 몇 일인가를 출력하여라. 
--단, 근무일수가 많은 사람 순으로 출력하여라. 
select trunc((sysdate-hiredate)/7) as 근무주수, --sys와 hire 모두 날짜형식이니까 바로 뺄 수 있음 
       trunc(sysdate-hiredate) as 근무일수 
  from emp
 order by trunc(sysdate-hiredate) desc;

select trunc((sysdate-hiredate)/7) as 근무주수,
       trunc(sysdate-hiredate) as 근무일수 
  from emp
 order by 근무일수 desc; --order by절에서는 지정한 alias 사용가능 

--문제3) EMP 테이블에서 입사한 달의 남은 근무 일수를 계산하여 출력하여라.     
--단, 토요일과 일요일도 근무일수에 포함한다. 
select hiredate, last_day(hiredate), last_day(hiredate) -hiredate --시간정보가 없어서 일수가 딱 떨어짐 
  from EMP ;
  
  
--문제2) 
select trunc(months_between(sysdate, hiredate))
  from emp
 where deptno=10;

--문제4) 
select next_day( hiredate, 6)
   from EMP
  where deptno=10;

--p54(pdf) 
--문제1) EMP 테이블에서 10번 부서원의 입사 일자를 1 MAY 1981와 
--1998년 01월 01일의 형태로 각각 출력하여라. 
alter session set nls_date_language = 'american' 
select to_char(hiredate, 'dd MON yyyy') --월 약자
  from emp 
 where deptno=10 ;

select to_char(hiredate, 'dd MONTH yyyy') --월 풀네임 
  from emp 
 where deptno=10 ;

 select to_char(hiredate, 'YYYY"년" MM"월" dd"일"'), --포멧안의 텍스트를 삽입하고 싶다면 " " 사용 
        to_char(hiredate, 'YYYY - MM - dd') -- /, - 같은 것은 그냥 사용 가능 
   from emp 
 where deptno=10 ;
 
-- 문제3) february 22, 1981에 입사한 사원의 이름, 업무, 입사일자를 출력하여라.   
alter session set nls_date_language=american 

select ename, job, hiredate 
  from emp
 where hiredate = to_date( 'february 22 1981', 'MONTH DD YYYY');

select ename, job, hiredate 
  from emp
 where hiredate = to_date( 'february 22, 1981', 'MONTH DD, YYYY');
 
--문제2) 
select sal, to_char(sal, '$99,999') 
   from emp
  where deptno = 20
  
--p63(pdf)
--문제1)
select ename, job, deptno, decode(deptno, 10, 'A',
                                          20, 'B',
                                          30, 'C') AS 부서명 
   from emp; 

--문제2)
select empno, ename, job, sal, decode( job, 'ANALYST', decode( sal,sal,sal*1.1),  
                                            'CLERK', decode( sal,sal,sal*1.5),
                                            'MANAGER', decode( sal,sal,sal*2.0))
  from emp; 
  
select empno, ename, job, sal, decode( job, 'ANALYST', sal*1.1,  
                                            'CLERK', sal*1.5,
                                            'MANAGER', sal*2.0) AS 새연봉 
  from emp; 
       
--문제3)
select empno, MGR, decode(MGR, null, '상위관리자', mgr || '담당')
  from emp; 
  
select empno, MGR, nvl2(MGR, mgr || '담당', '상위관리자')
  from emp; 
  
--1. professor 테이블에서 각 교수의 이메일 아이디를 
--출력하되, 특수기호를 제거한 형태로 출력하여라.
select email, translate(email, '@.-_/', '  ')
  from professor;

--2. STUDENT 테이블을 사용하여 주민번호, 생년월일 
--각각을 사용하여 각 학생의 태어난 날의 요일을 출력
select JUMIN, to_char(to_date(substr(jumin,1,6), 'rr/mm/dd'), 'DAY')
  from student; 
select birthday, to_char(birthday, 'DAY')
  from student; 
select jumin from student;
--3. EMP 테이블을 이용하여 사원이름, 입사일 및 급여검토일을 표시합니다. 
--급여검토일은 여섯달 근무후 해당되는 첫번째 월요일 
--날짜는 "Sunday the Seventh of September, 1981" 
--형식으로 표시. 열 이름은 check로 한다.

select ename, hiredate, to_char(next_day(add_months(hiredate,6),2), 'Day "the" DDTH "of" MONTH, YYYY')
  from emp;

--4. student 테이블에서 jumin 컬럼을 사용하여 생년월일이 다음 사이인 학생의 정보를 출력하세요.
--(19760205 ~ 19760924)
select jumin, to_date(substr(jumin,1,6), 'rr/mm/dd')
  from student
 where to_date(substr(jumin,1,6), 'rr/mm/dd') between '1976/02/05' and '1976/09/24' ;
 
select * from student; 
--5. emp 테이블을 이용하여 현재까지 근무일수를 
--XX년 XX개월 XX일 형태로 출력하세요.
   
select trunc(trunc(months_between(sysdate, hiredate))/12) || '년' as "year",  
       mod(trunc(months_between(sysdate, hiredate)),12) || '개월' as month,
       mod(round(sysdate) - round(hiredate),365) 
     from emp;
select round(sysdate, 'month') from emp; 
