--날짜함수
--5 last_day(날짜) : 해당날짜가 속한 월의 마지막 날짜
select sysdate, last_day(sysdate)
  from dual;
  
--6. round(날짜, 단위)
--7. trunc(날짜, 단위)
select sysdate,
       round(sysdate), --일단위 반올림
       round(sysdate, 'month'), --월단위 반올림
       round(sysdate, 'month') --월단위 버림 
    from dual; 
 
 --형 변환 함수 : 데이터 타입 변경 
 --1. to_char : 숫자, 날짜를 문자타입으로 변경
 --2. to_number : 문자는 숫자로 변환  
 select to_number('1') + 1
   from dual; -- 묵시적 형변환, 오라클 DB의 특징임 
 
 --3. to_date : 숫자, 문자를 날짜타입으로 변경************************중요 
 select '2020/02/05' + 100 --'2020/02/05'를 날짜로 인식하지 못하기 때문에 연산 오류 
   from dual; 
 select to_date('2020/02/05') + 100 --'2020/02/05'를 날짜로 인식하지 못했기 때문에 날짜타입으로 바꿔주는 명령어 사용
   from dual; 
   
  select to_date('02/05/2020', 'MM/DD/YYYY')  --형식을 지정해줘야함, 날짜의 포맷이 바뀌는게 아님, 포맷은 그대로 YYYY/MM/DD이고 날짜를 시스템에 맞춰 인식하여 오라클 포맷에 맞게 출력해줌  
   from dual; 
   
  select to_date('02/05/2020', 'DD/MM/YYYY')  --형식을 지정해줘야함 
   from dual; 
   
  select to_date('89/12/05','YY/MM/DD')  --YY라고 지정해주면 2000년대로 변환됨 
   from dual; 
  select to_date('89/12/05','RR/MM/DD')  --RR라고 지정해주면 90년대로 변환됨 
   from dual; 
  select to_date('89/12/05')  --지정안해주면 자동으로 지정함, 0089로 출력
   from dual; 
  select to_date('17/12/05')  --지정안해주면 자동으로 지정함, 0017로 출력  
   from dual; 
  
  --연습문제) student 테이블에서 jumin 컬럼을 사용하여 학생의 생년월일의 그 다음주 일요일의 날짜 출력
  select jumin, next_day(to_date(substr(jumin,1,6),'RR/MM/DD'),1)
    from student;
    

 --예제) 1981년 2월 22일에 입사한 직원을 찾아 출력하세요
select *
  from emp
 where hiredate = '19810222'; --sql의 장점, '19810222'가 문자열임에도 날짜로 묵시적으로 인식하여 읽음 

--1)컬럼을 문자타입으로 변경
select *
  from emp
 where to_char(hiredate, 'MM/DD/YYYY') = '02/22/1981';

--2)상수를 날짜로 변경, 이게 1번보다 성능이 좋음, 컬럼의 변형을 일으키지 않은 것이 인덱스의 조건 인덱스를 통해 정보를 찾는 것이 빠름  
select *
  from emp
 where hiredate = to_date('02/22/1981', 'MM/DD/YYYY');
  
--예제) 10% 인상된 sal이 3000 이상인 직원 출력
select *
  from EMP
 where sal*1.1 > = 3000;
 
select *
  from EMP
 where sal >= 3000/1.1; 
--첫번째 명령문과 두번째 명령문을 비교했을 때 컬럼의 변형을 일으키고 안일으키고의 차이, 컬럼의 변형을 일으키지 않은 두번째 명령문이 성능이 훨씬 좋음 
   
--일반함수
--1. nvl(데이터, null치환값) :  null 치환 함수
select ename, sal, comm+sal
   from emp; --null을 포함한 데이터는 더해도 null 
     
select ename, sal, comm+sal, sal+nvl(comm,0)
   from emp; --nvl을 통해 null을 0으로 치환 
   
select comm, nvl(comm, 'comm이 없다') --'comm이 없다'는 잘못된 치환, comm이 숫자의 값을 가지고 있기 때문에 숫자만 넣을 수 있음 즉 괄호 안의 데이터 타입이 일치해야 변경이 가능함 (숫자형식, 숫자형식) 혹은 (문자형식, 문자형식) \
   from emp; 

select hpage, nvl(hpage,0) --문자컬럼은 문자컬럼으로 치환이 되어야함, 오류는 뜨지 않지만 형식을 일치시켜야함  
   from professor;

select hpage, nvl(hpage,'0') --문자컬럼은 문자컬럼으로 치환이 되어야함, 오류는 뜨지 않지만 형식을 일치시켜야함  그래서 '' 붙임
   from professor;

--2. nvl2(데이터, 'null이 아닐때 치환', 'null일때 치환')
--예제) emp 테이블 직원의 보너스를 부여하려 한다. null인 경우는 300, null이 아닌 경우는 10% 인상
select comm, nvl(comm, 300),
   nvl2(comm, comm*1.1, 300), --숫자형식인 경우, 연산식가능
   nvl2(comm, 'comm이 있다','comm이 없다'), --nvl2는 두번째칸과 세번째칸의 형태가 같으면 치환이 됨 
   nvl2(comm, 'a', 0) --문자컬럼으로 만든 후 숫자로는 만들어짐
   --nvl2(comm, 0,'a') --숫자컬럼은 문자로 치환이 안됨, 연산오류남 
   from emp; 

--연습) student 테이블에서 학생의 학과번호를 출력, 학과번호는 제2전공번호로 출력하되 없으면 제 1전공번호
select name, deptno1, deptno2, nvl(deptno2, deptno1) as 학과번호
   from student;

--조건문 
--1. decode(검사대상, 조건1, 치환1[, 치환2]) 치환2가 null인 경우는 조건1과 일치하지 않는 경우는 null로 들어간다는 의미  
--예제) job이 clerk인 경우는 직원으로 치환 
select job, decode(job, 'CLERK', '직원') --clerk인 경우 직원으로 치환됨 
   from emp; 
--예제) job이 clerk인 경우는 직원, clerk이 아닌 경우는 사원으로 치환
select job, decode(job, 'CLERK', '직원', '사원')
   from emp;
--예제) job이 clerk인 경우는 직원, clerk이 아닌 경우는 변경 없음
select job, decode(job, 'CLERK', '직원', job)
   from emp;
--decode(대상, 조건1, 치환1,
--             조건2, 치환2,
               ------------
--             그 외 치환 값)
--예제1) CLERK 일때는 A, SALESMAN일때는 B, MANAGER 일때는 C, 그외는 D
select job, decode(job, 'CLERK', 'A',  
                        'SALESMAN', 'B',
                        'MANAGER', 'C', 
                        'D')  --D를 생략하는 경우는 null이 들어감 
   from emp;
 
  
   
   
