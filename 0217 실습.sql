--1) STUDENT테이블에서 각 학생의 이름, 제1전공학과명을 출력하고 담당지도교수 이름과 지도교수의 소속 학과명도 함께 출력하여라. 단, 지도교수가 없는 학생도 모두 출력.
select * from student;
select * from professor; 
select * from DEPARTMENT;

select s.name as 학생이름, d1.dname as 제1전공학과명, 
       p.name as 교수이름, d2.dname as 소속학과명 
   from student s, professor p, department d1, department d2 
  where s.profno = p.profno(+)
  and s.deptno1 = d1.deptno -- 학생과 전공학과명을 연결했을때 빠지는 정보가 없으니 (+) 붙일 필요 없음 
  and p.deptno = d2.deptno(+); -- 학생과 교수 테이블을 연결했을때 빠지는 정보가 있으니 교수의 학과명을 출력하고 학생도 모두 나오려면 (+) 붙여야함  
  


--2) student 테이블과 exam_01, department 테이블을 
--이용하여 각 학과별 평균 점수와 최고 점수, 최저 점수를 
--나타내되 학과이름, 학과번호와 함께 출력.
select * from student;
select * from DEPARTMENT;
select * from exam_01; 

select avg(total) as 평균, max(total) as 최고, min(total) as 최저, d.dname, s.deptno1
   from student s, department d , exam_01 e 
 where s.studno = e.studno 
 and d.deptno = s.deptno1 
group by s.deptno1, d.dname ;

--3) STUDENT테이블에서 같은 학년내 각 학생보다 키가 큰
--학생의 수를 출력하되, 학생이름, 학과번호, 학년을 
--함께 출력하여라.
select * from student;

select s1.name, s1.deptno1, s1.grade, count(s2.studno)
  from student s1, student s2
 where s1.grade = s2.grade(+) and s1.height > s2.height(+) --학년이 같고, 키가 s1 학생이 더 커야함, 또한 키가 제일 큰 학생도 생략없이 출력되야하기 때문에 (+) 붙이기 
group by s1.grade, s1.name, s1.deptno1 --그룹으로 묶여도 학생의 정보가 생략되지 않음 
order by s1.grade, s1.name; 



--4) professor 테이블에서 홈페이지 주소가 있으면 
--그대로 출력, 없으면 아래와 같이 출력
--http://www.naver.com/email_id
--단, email_id는 email 주소의 @ 앞의 문자라 가정한다.

select nvl(hpage, 'http://www.naver.com/'||(replace(email, substr(email, instr(email, '@',-1)), ' '))) 
   from professor; 


--5) 레포트를 작성하고자 한다.
--emp 테이블을 이용하여 각 부서별 직원수를 출력하되 
--다음과 같은 형식으로 작성하여라.
--
--레포트명	       10_직원수	 20_직원수	  30_학생수
----------------------------------------------------------
--본인이름 레포트	        3	         5           6


       
 select '레포트' as  레포트명,
        max(decode(deptno,10, count(deptno)))as "10_직원수", 
        max(decode(deptno,20, count(deptno))) as "20_직원수", 
        max(decode(deptno,30, count(deptno))) as "30_직원수"
   from EMP
  group by deptno; --null값을 없애기위해 max 사용 
  
select count(deptno) 
  from emp 
 group by deptno; 
  
  
--선생님
select deptno, count(empno)
   from EMP
 group by deptno; 
 
select '레포트' as  레포트명,
        count(decode(deptno,10,1)) as "10_직원수",
        count(decode(deptno,20,1)) as "20_직원수",
        count(decode(deptno,30,1)) as "30_직원수"
   from emp;
   


