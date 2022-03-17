----outer join : 조인조건을 만족하지 않는 대상까지 추출
--기준이 되는 테이블 위치에 따라 left outer join, right outer join, full outer join으로 구분

--예제) student, professor 테이블을 사용하여 각 학생의 이름, 학년, 지도교수명 출력(단 지도교수가 없는 학생의 정보는 생략) 

select * from student;
select * from professor;

select s.name as 학생이름, p.profno as 교수이름  
  from student s, professor p 
 where s.profno = p.profno; --지도교수가 없는 사람들은 null처리되어 나타나지 않음 
 
 --left outer join 왼쪽이 기준이 되어 조인하는법: 오라클 표준, 기준이 되는 조건 반대 컬럼에 ( + )를 붙임 
 select s.name as 학생이름, p.profno as 교수이름  
  from student s, professor p 
 where s.profno = p.profno(+); -- 기준이 되는 조건인 student 테이블의 반대쪽인 prfessor table에 +를 붙임 
 
 --연습문제) student, professor 테이블을 사용하여 교수이름, pay, 각 교수의 지도학생 이름과 학년 출력
 --단 지도학생이 없는 교수이름도 출력 
 
 select p.name as 교수이름, p.pay, s.name as 지도학생, s.grade as 학년 
   from student s, professor p 
  where s.profno(+) = p.profno
  order by 1; 
 
 --연습문제) 위 결과에서 지도교수별 지도학생수를 출력 단, 지도학생이 없는 교수도 출력 
 select count(s.studno) as 지도학생수, p.profno, p.name, p.pay
   from student s, professor p
  where s.profno(+) = p.profno 
 group by p.profno, p.name, p.pay; --지도교수별로 묶어서 확인, 그룹별로 묶었을 때 정보가 추가된다고 해서 더 세분화되는지 아니면 생략되는지 확인해야함 
 
 --참고 :  full outer join :  성능이 엄청 떨어지기 때문에 사용 거의 안함 
 --1) ANSI 표준 
 select s.name as 학생이름,
        p.name as 교수이름
   from student s full outer join professor p 
     on s.profno = p.profno; 
     
-- --2) 오라클 표준
-- select s.name as 학생이름,
--        p.name as 교수이름
--   from student s, professor p 
--  where s.profno(+) = p.profno(+); 불가, 연산오류 
--full outer join을 쓰려면 union사용하여 데이터 연결 
select s.name as 학생이름,
        p.name as 교수이름
   from student s, professor p 
  where s.profno(+) = p.profno
  union
select s.name as 학생이름,
        p.name as 교수이름
   from student s, professor p 
  where s.profno = p.profno(+); 
  
 --예제) emp2 테이블과 p_grade 테이블을 조회하여 사원들의 이름과 나이, 현재직급, 예상직급을 출력하세요. 
 --단, 예상직급이 없는 직원도 모두 출력 
  
 select e.name, trunc(months_between(sysdate,birthday)/12), 
        e.position, nvl(p.position, '사장')
    from emp2 e, p_grade P
  where trunc(months_between(sysdate,birthday)/12) between p.s_age(+) and p.e_age(+) ; --테이블 기준은 emp2, 그리고 컬럼이 여러개이면 모두 (+) 붙여야 outerjoin 성립

--연습문제) student, professo, department테이블을 사용하여 각 학생의 이름, 지도교수명, 지도교수의 학과명 출력 
--(단, 지도교수가 없는 학생 정보도 출력) 
--student 테이블이 기준이 됨, 그렇기 때문에 지도교수가 없는 학생들도 출력이되려면 professor 테이블에 (+) 붙임
--또한 지도교수가 없는 학생들은 지도교수의 학과명도 출력될 수 없기 때문에 지도 교수 학과명에 연결되는 department테이블에도 (+)를 붙여야 지도교수가 없는 학생들이 출력될 수 있음 

select s.name, p.name, p.deptno, d.dname
   from student s, professor p, department d 
 where s.profno = p.profno(+) 
   and p.deptno = d.deptno(+); 
   
--self join :  하나의 테이블이 여러번 조인되는 경우, 한번의 scan으로 표현할 수 없는 정보를 똑같은 테이블을 재사용(scan) 해야만 출력 가능한 경우
--예제) emp 테이블에서 각 직원의 이름, 연봉과 해당 직원의 매니저 이름 및 연봉을 함께 출력하세요  !!!!!!!!!!!!시험문제!!!!!!!!!!!!!!!!

select * from emp;

select e1.ename as 이름,
       e1.sal,
       e2.ename as 매니저이름,
       e2.sal as 매니저연봉
   from emp e1, emp e2 
  where e1.mgr = e2.empno(+); --  !!!!!!!!!!!!시험문제!!!!!!!!!!!!!!!!, 순서중요 
--혹은 
select e2.ename as 이름,
       e2.sal,
       e1.ename as 매니저이름,
       e1.sal as 매니저연봉
   from emp e1, emp e2 
  where e2.mgr = e1.empno; 
  
--예제) 위 정보를 사용하여 매니저보다 연봉이 높은 직원 출력

select e1.ename as 이름,
       e1.sal,
       e2.ename as 매니저이름,
       e2.sal as 매니저연봉
   from emp e1, emp e2 
  where e1.mgr = e2.empno(+)
    and e1.sal > e2.sal;
    
--연습문제) department에서 각 학과명과 상위학과명을 동시 출력, 단 상위학과가 없는 경우에도 함께 출력 
select *
   from department; 
   
select d1.dname as 학과명,
       d2.dname as 상위학과
  from department d1, department d2
 where d1.part= d2.deptno(+); 

 
--연습문제) 위 문제에서 각 학과의 소속정보를 '소프트웨어공학과의 소속은 컴퓨터정보학부입니다.' 형식으로 출력 단, 소속학과가 없는 경우에는 본인 소속으로 출력

select d1.dname || '의 소속은'  as 학과명,
       nvl(d2.dname, d1.dname) || '입니다'  as 상위학과
  from department d1, department d2
 where d1.part= d2.deptno(+); 
 
--연습문제) employees 테이블을 사용하여 각 직원의 이름, 입사일, 연봉, 직급을 출력, 단 직급은 근속년수 기준 p_grade 참조하여 부여
select * from employeess;
select * from p_grade;

select e.first_name, e.hire_date, e.salary, trunc(months_between(sysdate, hire_date)/12), p.position
   from employeess e, p_grade p
  where trunc(months_between(sysdate, hire_date)/12) between p.s_year(+) and p.e_year(+);
  

  
--연습문제) professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요
select * from professor; 

select p1.profno, p1.name, p1.hiredate, p2.name, p2.hiredate
   from professor p1, professor p2
  where p1.hiredate > p2.hiredate(+)  --확인 

select p1.profno, p1.name, p1.hiredate, count(p2.profno) --null이 없는 profno를 세는 것이 정확 
   from professor p1, professor p2
  where p1.hiredate > p2.hiredate(+)
 group by p1.profno, p1.name, p1.hiredate  --세가지의 정보를 합쳐도 정보가 누락되었거나 더해진게 없음
 order by count(p2.profno); 
 
 --서브쿼리 종류 및 목적 (현업) 
-- select ... (select ...) :  스칼라 서브쿼리 select 절에 또 다른 select 절이 오는 것, select 절의 결과를 컬럼의 개체로 사용  
--   from ... (select ...) :  인라인 뷰 from 절에 select 절이 오는 것 : select 절의 결과를 테이블의 개체로 사용  
--  where ... (select ...) :  일반 서브쿼리 where절에 select 절이 오는 것 , select 절의 결과를 상수의 개체로 사용  

--예제) emp 테이블에서 전체 직원의 평균연봉보다 높은 연봉을 받는 직원의 이름, 연봉, 입사일 출력 
--step1) 평균연봉 출력
select avg(sal) 
  from emp; --2073.2
--step2) 평균연봉(2073.2)보다 높은 연봉 받는 사람 출력 
select *
  from EMP
 where sal >=2073.2; 
 
--total) 
select ename, hiredate, SAL
  from EMP
 where sal > = (select avg(sal) 
                      from emp); --쿼리를 고정시켜 메년 같은 쿼리로 값을 구할 수 있음 
 
select ename, sal, hiredate
  from emp
  where sal <(select avg(nvl(sal,0)) from emp); 


--예제) scott과 같은 부서에 있는 직원정보 출력 
select deptno 
   from EMP
  where deptno = (select deptno 
                     from emp 
                   where ename = 'SCOTT'); --where 절이 deptno 하나이면 서브쿼리도 deptno 하나여야함 

-- 문법에 따른 서브쿼리 분류 (시험용) 
-- 1. 단일행 서브쿼리 :  서브쿼리의 결과가 하나의 행, 연산자의 결과가 하나인 것  =, !=, >, < 연산과 잘 어울림  
--예제) scott과 같은 부서에 있는 직원정보 출력 

-- 2. 다중행 서브쿼리 : =, !=,  >, < 연산과 함께 쓸 수 없음, in(not in), (max, min을 출력하는) any, all 
--ex) 이름에 'A'로 시작하는 직원과 같은 부서에 있는 직원 정보 출력
select deptno 
   from emp
 where deptno = (select deptno 
                      from emp 
                     where ename like 'A%'); -- 오류 : 단일 행 하위 질의에 2개 이상의 행이 리턴됨 
                     
 select deptno 
   from emp
 where deptno in (select deptno 
                      from emp 
                     where ename like 'A%'); --서브쿼리의 결과가 여러개인 경우 
                     
--ex) 이름이 'A'로 시작하는 직원의 연봉보다 높은 연봉을 갖는 직원 정보 출력 
select deptno
   from EMP
 where sal >  (select avg(sal) --min, max, avg 사용해서 하나의 결과값만 리턴되게 만든 후 숫자의 대소 비교 해야함 
                from EMP
               where ename like 'A%'); 
               
--  > all(1000, 2000) 이면 max값의 리턴을 도와주는 연산자  1000보다 크고 2000보다 큰값 결과적으로 2000보다 큰 값을 리턴  
--ex) 이름이 'A'로 시작하는 직원의 연봉보다 모두 높은 연봉을 갖는 직원 정보 출력 (1100 이랑 1600)보다 큰 
 where sal > all (select sal --max(sal)이랑 같은 값 
                      from EMP
               where ename like 'A%'); 
-- > all (1100, 1600) => > 1600 : 1100보다 크고 동시에 1600보다 큰 값 결과적으로 1600보다 큰 값 리턴 
-- < all (1100, 1600) => <1100 1100보다 작고 1600보다 작은값 min값의 리턴을 도와주는 연산자 결과적으로 1100보다 작은 값을 리턴          
-- > any(1100, 1600) => > 1100 인 최소값 리턴: 1100보다 커도 되고 1600보다 커도됨, 1100보다 큰 값 리턴  
-- < any(1100, 1600) => <1600인 최대값 리턴: 1100보다 작아도 되고 1600보다 작아도됨, 1600보다 작은 값 리턴 

--3. 다중컬럼 서브쿼리
--4. 상호연관 서브쿼리
  

