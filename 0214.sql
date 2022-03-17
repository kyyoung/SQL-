--group by 사용시 주의
--1. where 절에 그룹함수 사용 불가
select avg(sal)
   from EMP
 where avg(sal) > 0 ;  --평균값을 확인할 수 없기 때문에 에러
 
 select deptno, avg(sal)
   from EMP
 where avg(sal) > 2500 
 group by deptno; --평균값을 확인할 수 없기 때문에 에러
 
 select deptno, avg(sal)
   from EMP
  group by deptno
 having avg (sal) > 2500;  --where절 대신 사용 
 
 --2. where절, havgin절에 둘다 사용 가능한 조건은 where절에 사용하는 것이 성능상 유리 
 select deptno, avg(sal)
   from EMP
    where deptno! =10 
  group by deptno
 --having avg deptno != 10; having절도 where절 대신 사용 할 수 있지만, where절을 사용하는 것이 성능상 유리함
 
 --3. group by절에 명시되지 않은 컬럼은 단일컬럼 형태로 select절에 사용할 수 없다 
 --(그룹함수 형태로만 가능) 
 select grade, max(height), max(name) -- 문자나 날짜도 max, min 값이 출력 가능함 max(한글) = ㅎ 값, max(영문) = z 값  
    from student 
   group by grade; 
   
 select grade, max(height), name -- 결과값은 출력이 되지만 서브쿼리를 사용해주는 것이 정확한 명령문 
    from student 
   group by grade, name; 
   
select name, height, grade from student order by grade, height desc;   

--집합연산자 : 여러개의 select 결과(집합)에 대한 합집합, 교집합, 차집합을 연산, 데이터 컬럼의 순서 일치와 데이터 타입의 일치필요 
--1. union/ union all : 합집합
--union : 중복제거를 위해 내주 정렬 수행
--union all : 중복제거 없이 모두 출력(정렬 수행없음)
--union/ union all의 결과가 같은 경우는  union all 사용 
--예제) emp 테이블에서 10번, 20번 부서원을 각각 출력, 집합연산자를 사용하여 하나의 집합으로 합하여 출력 
select * 
   from EMP
 where deptno =10
  union
select *
  from EMP
 where deptno =20; --이 쿼리의 경우 전체 정보가 중복될 가능성이 없음, 중복되지 않은 정보의 경우 굳이 합칠필요 없음 이유는 가동성이 급격히 하락, 명령문 자체에 내부 정렬을 수행하기 때문  
 
--예제) emp 테이블에서 10번, 20번 부서원의 job을 각각 출력, 집합연산자를 사용하여 하나의 집합으로 합하여 출력 
select job
   from EMP
 where deptno =10 
 union all --union을 사용하면 중복된 값을 제거 
select job 
  from EMP
 where deptno =20; 
 
--주의사항 1번 : 데이터 타입의 일치 
select ename 
   from EMP
 where deptno =10 
 union all
select sal --연산불가 : 데이터 타입 불일치 
--select to_char(sal) --굳이 sal이랑 job을 합치고 싶다면 sal을 문자형태로 변환   
  from EMP
 where deptno =20;  
 
--주의사항 2번 : 명령문 작성할 때 job과 sal의 순서 일치 
select job, sal
   from EMP
 where deptno =10 
 union all --union을 사용하면 중복된 값을 제거 
select sal, job 
  from EMP
 where deptno =20; 


--2. intersect : 교집합
select job
   from EMP
 where deptno =10 
 intersect
select job 
  from EMP
 where deptno =20; 

--3. minus : 차집합
select job
   from EMP
 where deptno =10 
 minus
select job 
  from EMP
 where deptno =20; 

--scott에서 hr계정의 employees 테이블 조회 가능한 작업, 일단 system 계정으로 들어간 후 아래 명령어 수행, 한 줄씩 수행해야함 
create public synonym employeess for hr.employees; --synonym 별칭을 만들어서 원래 테이블이름인 hr.employees 말고 employeess 라고 조회해도 데이터에 접근 가능하게 함 
grant select on hr.employees to scott; -- scott 계정에도 권한을 부여하여 employees 테이블 조회 가능하게 만듦

select* 
  from employeess; --scott 계정에서 수행해보기 

--연습문제) emp 테이블과 employees 테이블을 합쳐 사원번호, 이름, job, sal 정보 출력하기
--employees에서 사원번호는 employee_id, 이름은 first_name, job은 job_id, sal은 salary사용, 
--단 사원번호는 모두 4자리로 통일

select lpad(employee_id,4,7) as empno, first_name as ename, job_id as job, salary as sal
 from employeess
union all 
select lpad(empno,4,0) , ename, job, sal 
 from emp;
 
--선생님
select empno, ename, job, sal as 연봉 --alias는 위에 있는 행에 입력해야지 출력됨  
  from EMP
 union all
select to_number(rpad(employee_id,4,0)), upper(first_name), job_id, salary  
  from employeess;

--join : 서로 다른 테이블에 분산되어 있는 정보를 하나로 다시 합치는 경우(특정 컬럼에 대한 추가 정보를 타 테이블에서 참조) 

select * from emp;
select * from dept; 

select *
  from EMP, dept;
--     emp 14건, dept 4건 즉 14*4건으로 총 56건이 발생 : 카티시안곱이 발생함 

--카티시안곱 해결방법, 
select empno, ename, dname, emp.deptno --deptno 를 사용할 때 where절과 같이 사용 
   from emp, dept
  where emp.deptno = dept.deptno; -- emp와 dept 데이터의 연결을 deptno로 함 
  
select empno, ename, dname, emp.deptno --deptno 를 사용할 때 where절과 같이 사용 
   from emp e, dept d --alias 설정 
  where e.deptno = d.deptno; -- alias를 설정했다면 where절에도 alias를 사용해줘야함 

--연습문제) student와 department 테이블을 사용하여 학생번호, 이름, 학년, 학과이름 출력
select studno, name, grade, dname
   from student s, department d
  where s.deptno1 = d.deptno ;
  
--선생님 
select s.studno, s.name, s.grade, d.dname --alias 붙여줘야함 
   from student s, department d
  where s.deptno1 = d.deptno ;
  
  
--연습문제) student와 exam_01 사용하여 학생번호, 이름, 학년, 시험성적 출력
select s.studno, name, grade, total
  from student s, exam_01 e 
 where s.studno = e.stuno ; 

--선생님
select s.studno, s.name, s.grade, e.total --alias 붙여줘야함 
  from student s, exam_01 e 
 where s.studno = e.studno ; 

--예제) 위 정보를 활용하여 학년별 시험성적 평균 출력 
select s.grade, avg(e.total)
    from student s, exam_01 e 
  where s.studno = e.STUDNO
 group by s.grade; 
 
 
 
--연습문제 emp테이블에서 부서별 평균연봉을 구하고 부서명, 평균연봉 형태로 출력 
select d.dname,avg(e.sal), d.deptno, d.loc --그룹바이절에 쓰이는 컬럼만 올릴 수 있음
   from emp e, dept d 
  where e.deptno = d.deptno 
 group by d.deptno, d.dname, d.loc; --detpno, dname, loc로 세분화해서 볼 필요가 있음, 이유는 중복되는 컬럼의 경우 출력이 되지 않을 수 있음 
 
-- --예시 deptno   loc
--         A      서울
--         A      부산
--         B      서울
--deptno만 출력할 경우 컬럼 2개 , deptno와 loc 면 컬럼 3개 나타남
  
--연습문제) student와 exam_01, department 사용하여 학생번호, 이름, 학년, 시험성적, 학과명 출력 3개 테이블의 연결조건을 잘 파악

select s.studno, s.name, s.grade, e.total, d.dname
   from student s, exam_01 e, DEPARTMENT d
  where s.studno = e.STUDNO 
    and s.deptno1= d.deptno;

--2. non equi join
--예제) gogak, gift 테이블을 사용하여 각 고객의 가용포인트별 받아갈 수 있는 가장 좋은 상품 1개씩 출력
select g1.gname as 고객명, g1.point as 포인트, g2.gname as 상품명
   from gogak g1, gift g2
  where g1.point between g2.G_START and g2.G_END;
  
--연습문제) 위 테이블을 사용하여 각 고객이 가져갈 수 있는 모든 상품을 출력 
select g1.gname as 고객명, g1.point as 포인트, g2.gname as 상품명
  from gogak g1, gift g2
 where g1.point >  g2.G_START 
 order by 고객명 ;
 
 --연습문제 )  gogak, gift 테이블을 사용하여 이벤트시 준비해야 할 각 상품의 최대 수량 출력 
select  g2.gname as 상품명,
        count(*)
     from gogak g1, gift g2
 where g1.point >=  g2.G_START 
 group by g2.name; --join을 먼저 설정하고, group을 설정함! 
 
 --연습문제) student, exam_01, Hakjum 테이블을 사용하여 각 학생의 이름, 학년, 시험점수, 학점 출력 
 select s.name, s.grade, e.total, h.grade
        from student s, exam_01 e, hakjum H
   where s.studno =  e.studno 
     and e.total between h.min_point and h.max_point; 
 
 --연습문제) student, exam_01, hakjum테이블을 사용하여 각 학점별(A,B,C,D// +와 0 하나로 합침), 
 --학생수, 평균점수, 최대점수, 최소점수 출력 
 select substr(h.grade,1,1) as 학점,
        count(s.studno) as 학생수,
        avg(e.total) as 평균점수, 
        min(e.total) as 최소점수,
        max(e.total) as 최대점수
        from student s, exam_01 e, hakjum H
   where s.studno =  e.studno 
     and e.total between h.min_point and h.max_point 
   group by substr(h.grade,1,1)
   order by 1; --컬럼의 순서대로 첫번째 컬럼인 학점 순서대로 정렬
   
--연습문제 1번 2번 5번 
select * from p_grade;
 
