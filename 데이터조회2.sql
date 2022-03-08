***order by 구문 : 정렬
--select에 속해있는 명령문 from, where, group by, having, order by 그리고 이 순서대로 명령문이 작성되어야함 (이 명령문의 생략은 가능) 
select *
  from emp
 order by sal ;
 
*** ASC: 오름차순(작은 것 부터 큰 것: 1,2,3,4 ...), order by의 기본값 
select *
  from emp
 order by sal asc ;
 
*** DESC: 내림차순(큰 것 부터 작은 것: 4,3,2,1 ...)  

--예제) EMP 테이블에서 부서번호별, 연봉별 정렬(큰순서대로)
select *
  from emp
 order by deptno asc,
       sal desc;
 
select empno as eno,
       ename,
       deptno,
       sal as salary
  from emp
 order by deptno asc,
       salary desc;
 
--alias 사용예제, order by절에서는 alias 사용 가능, 이유는 나머지 문법들(from, where 등등)은 select 이전에 수행되지만 order by절만 select 이후에 시행되기 때문에 alias에서 출력된 칼럼명 이름이 읽힘 

select empno as eno,
       ename,
       deptno,
       sal as salary
  from emp
 where salary >= 1000 --select절에 명시된 alias는 order by절에서만 사용 가능, 다른 명령문에서는 절대 사용 불가 
 order by deptno asc,
       sal desc;
 
--alias 사용예제 

--dual table : 테이블이 필요없는 select절 완성시 사용, dual이라는 테이블을 사용하여 연산, 현재날짜와 시간 등을 조외할 수 있음 
select 24*65
  from dual;
 
select sysdate
  from dual ;
 
select round(1234.56) --round 반올림 
  from dual ;
 
--함수 :  input이 함수의 특성에 맞게 변환되어 출력(output)

--initcap : 첫 글자만 대문자로 변환, 문자에만 쓰임 
select 'abcd',
       initcap('abcd') --camel 표기법 
  from dual;
 
select ename,
       initcap(ename)
  from emp;
 
--lower : 소문자 치환

--upper : 대문자 치환
select ename,
       lower(ename),
       upper(ename)
  from emp;
 
--length, lengthb : 글자의 크기 출력
select 'abcd',
       length('abcd'),
       lengthb('abcd'),
       '한글',
       length('한글'),
       lengthb('한글')
  from dual ;
 
--한글은 한 글자당 4바이트, 영어는 한 글자당 1바이트, length는 글자수 출력 lengthb는 바이트 출력 

--substr : 추출함수(중요) 

--substr(원본문자열, 추출할 문자(숫자)의 시작위치[, 개수]) select와 where절에서 주로 사용, order by에서도 쓸 수 있음 [] 부분은 생략할 수 있고 생략할 경우 끝까지 출력됨 
select 'abcdefg',
       substr('abcdefg', 1, 2)
  from dual;
 
select 'abcdefg',
       substr('abcdefg', 3) -- [] 부분은 생략할 수 있고 생략할 경우 끝까지 출력됨 
  from dual;
 
select 'abcdefg',
       substr('abcdefg', -2, 2) -- 마이너스를 붙이면 뒤에서부터 2번째를 시작으로 정방향으로 출력됨 이경우 fg가 출력 
  from dual;
 
--연습문제 student 테이블에서 주민번호를 통해 여학생 정보만 출력  
select *
  from student ;
 
select *
  from student
 where substr(jumin, 7, 1) =2 ;
 select *
  from student
 where jumin like '______2%' ;
 
--날짜포맷을 확인! 시스템에 따라 날짜 형식이 바뀔수 있기 때문에 좋은 형태의 명령어는 아님 
       alter session
   set nls_date_format = 'YYYY/MM/DD' ;
 
select sysdate,
       substr(sysdate, 1, 4) as "year",
       substr(sysdate, 6, 2) as "month",
       substr(sysdate, -2) as "day"
  from dual ;
 
--연습문제 student table에서 2월에 태어난 학생을 출력
select name,
       birthday
  from student
 where substr(jumin, 3, 2) ='02';
 select name,
       birthday
  from student
 where substr(birthday, 6, 2) ='02';
 
--날짜포맷을 확인!, /도 포함되어 세어야함 
select name,
       birthday
  from student
 where birthday like '____/02%' ;
 
select name,
       birthday
  from student;
 
--instr : 원본문자열에서 특정문자의 위치값을 출력 

--instr(원본문자열, 찾을문자열[, 시작위치, 발견되는 순서])
select 'abcab',
       instr('abcab', 'a', 1, 1)
  from dual;
 
--abcab의 첫번째 a 의 위치값
select 'abcab',
       instr('abcab', 'a', 2, 1)
  from dual;
 
--abcab의 네번째 a 의 위치값
select 'abcab',
       instr('abcab', 'a')
  from dual;
 
--[]의 값은 생략 가능, 이 경우 최초 위치가 출력됨 
select 'abcab',
       instr('abcab', 'd')
  from dual;
--없는 문자는 0 , 어떤 문자가 포함되어있는지 없는지에 대해 활용 가능 
select 'abcab',
       instr('abcab', 'a', -3, 1)
  from dual;
 
--substr와 다르게 instr의 추출방향은 역방향 그렇기 때문에 a의 위치는 첫 번째 쓰인 a의 위치값이 출력됨 
select instr('abcababcad', 'a', -6, 2) --6번째 역방향으로 시작되는 2번째 발견되는 a의 위치 
  from dual ;
 
--실습문제1
select empno,
       ename,
       lower(job),
       upper(job),
       initcap(job)
  from emp
 where ename ='SCOTT';
 
--실습문제2
select empno,
       ename,
       job,
       SUBSTR(ENAME, 1, 1)
  from emp
 where substr(ename, 1, 1)>'K';
 
--문자도 대소 구분이 가능함 

--실습문제3
select ename,
       job
  from emp
 where length(ename)>=6 ;
 
--실습문제4
select ENAME,
       instr(ename, 'L', 1, 1)
  from EMP ;
 
--pad힘수 : 삽입함수, 왼쪽, 오른쪽 삽입 가능 양방향 삽입은 불가 

--pad(원본문자열, 총자리수, 채울문자열) 부족한 자리수(바이트수) 만큼 채울문자열이 자리를 메꿈 
select lpad(ename, 10, '*'), --왼쪽삽입 
       rpad(ename, 10, '*') --오른쪽삽입
  from emp;
 
select lpad(name, 10, '*'), --서진수, 이미 6바이트이므로 나머지 4바이트인 *이 4개만 들어감
       rpad(name, 10, '*')
  from student;
 
--trim : 제거함수, 방해물을 만났을 때는 삭제할 수 없음, 왼쪽, 오른쪽

--trim(원본문자열[, 제거문자열]) --**************************************데이터 현장에서 공백이 포함된 문자열이 많음(cmd 창으로 데이터 꼭 확인하기), 많이 사용함******************************
select 'abcba',
       ltrim('abcba', 'a'), --왼쪽제거
       rtrim('abcbaaa', 'a'), --오른쪽제거
       trim( ' abcd  ') --양쪽제거는 공백만 제거 가능 
  from dual;
 
--trim test

--1)test table 생성
       create table trim_test(col1 varchar2(5), col2 varchar2(5));
 
--2)test data 삽입
insert
  into trim_test
values('a',
               'a  ');
 
--3)test data 저장 
       commit;
 
--4)조회 
select *
  from trim_test
 where COL1 ='a';
 
select *
  from trim_test
 where trim(COL2) = 'a';
 
--**치환함수*** 매우중요

--1) replace(원본문자열, 찾을단어, 바꿀단어)

--2) translate(원본문자열, 찾을글자, 매칭된바꿀글자)
select 'abcda',
       replace ('abcda', 'a', 'A'),
       replace ('abcda', 'ab', 'AB'), --ab만 AB로 치환됨, 정확하게 ab와 매칭되있는 단어만 치환이됨 
       translate ('abcda', 'a', 'A'),
       translate ('abcda', 'ab', 'AB') --뒤에있는 a도 A로 치환됨 
  from dual;
 
--replace 삭제의 기능
select 'abcda',
       replace('abcda', 'a', ''),
       translate('abcda', 'a', '') -- translate 오류가 뜸, 공백을 인식하지 못함 
  from dual;
 
select 'abcda',
       replace('abcda', 'a', ''),
       translate('abcda', '1a', '1') -- 1은 아예 없으니깐 나타나지 않고, 찾을글자인 a는 없어지게 해놨으니 삭제됨 
  from dual;
 
select 'abcda',
       replace('abcda', 'a', ''),
       translate('abcda', '1ac', '1') --1은 아예 없으니깐 나타나지 않고, 찾을글자인 a와 c는 없어지게 해놨으니 삭제됨 
  from dual;

select translate ('abcda', '!ac', '!'), --삭제기능
       translate ('abcda', 'ac','acv') --아무변화없음 
   from dual;
select translate ('1234', '12', 'ab'), --12가 ab로 치환
       translate ('123421', '12', 'ab'), --12와 21이 ab로 치환, 즉 ab 순서의 상관은 없음
       translate ('123421', '12', 'abc'), --12와 21이 ab로 치환, 글자의 갯수가 매칭되지 않았기 때문에 c는 치환되지 않음 
       translate ('123421', '123', 'ab') --123과 21이 ab로 치환 
   from dual; 
--예제) professor 테이블에서 교수 아이디에서 특수문자 모두 제거후 출력
select id,
       replace(replace(ID, '-', '') , '*', '') --id 에서 -을 공백으로 바꾼 후에 *를 또 공백으로 바꾸는 형식 
  from professor;
 
select id,
       translate(ID, '1!@#$%^&*-', '1') -- id에서 1을 제외한 존재하는 특수문자는 없어지게 매칭되게 했음으로 바껴짐 
  from professor;
 
--연습문제 emp 테이블에서 급여를 모두 동일한 자리수로 출력
select lpad (sal, 4, '*')
  from emp ;
--연습문제 student 테이블에서 이름의 두번째 글자를 #처리
select name, replace(name, substr(name,2,1), '#' )
  from student ; 

--연습문제 student 테이블에서 전화번호를 다음과 같은 형식으로 변경 055 381 2158
select tel,
       translate(tel, ')-', '  ') 
    from student ;  

select tel, replace( replace(tel, ')',' ') , '-', ' ')
  from student;

--숫자함수
--1. round(숫자[,자리수]) 자리수=소수점 자리수까지 보이는 것 
select 1234.567, round(1234.567), 
                 round(1234.567, 1), --소수점 첫째자리까지 보이기(반올림)
                 round(1234.567, 2), --소수점 둘째자리까지 보이기(반올림)
                 round(1234.44,1),
                 round(1234.567, -1) --정수 첫번째 자리에서 반올림, 정수로 변환됨  
   from dual; 

--2. trunc(숫자 [,자리수])
select 1234.567,
       trunc(1234.567),
       trunc(1234.567, 1), --소수점 첫째자리까지 보이기(버림)
       trunc(1234.567, 2) --소수점 둘째자리까지 보이기(버림)
    from dual; 

--3. mod(숫자, 숫자) : 나머지 구하는 것 
select mod(9,3), mod(9,2) --9를 3으로 나누면 0, 9를 2로 나누면 1
  from dual; 
--4. ceil(숫자) :  (숫자)보다 크면서 최소정수
--5. floor(숫자) : (숫자)보다 작으면서 최대정수

select 1.3,
       ceil(1.3), --2가 출력 
       floor(1.3) --1이 출력
  from dual;

--6. abs(숫자) : 절대값 
select abs(-3) 
  from dual;

--7. sign(숫자) : 부호판별 양수면 1, 음수면 -1, 0이면 0으로 리턴, 조건문과 결합하여 사용 
select sign(-10), sign(10), sign(0)
  from dual; 
--사용법 sal =3000이상이면 A, 
--decode(sign(sal-3000), 1, 'A', 'B'); 

--날짜함수 
--1. sysdate
select sysdate
  from dual; --현재날짜 
select sysdate + 2
  from dual; --현재날짜로부터 2일뒤 

  
--예제) emp 테이블에서 각 직원의 근무일수 출력 
select sysdate -hiredate
  from emp; --출력되는 소수점은 시분초까지 계산되는 것
select trunc(sysdate -hiredate) as 근무일수
  from emp;
select trunc((sysdate -hiredate) / 365) as 근속년수
  from emp;

--2. add_months(날짜, n) : n 개월수 계산
--예제) 현재 날짜로부터 3개월 후 날짜 출력 
select sysdate,
       sysdate +5*30, --월에 대한 기준이 부정확
       add_months(sysdate,5), --월에 대한 기준이 정확
       add_months(sysdate, -5) --5개월 전
   from dual; 

--3. months_between(날짜1, 날짜2)
--예제) emp 테이블에서 각 직원의 근무개월수 출력 
select ename, trunc(months_between(sysdate, hiredate) ) as 근무개월수
  from emp;

--4. next_day(날짜, 요일) : 바로 다음에 오는 특정요일 일수 리턴
--1: 일요일 2: 월요일 3: 화요일 --- 
select next_day(sysdate, 1) 
  from dual;

alter session set nls_date_language = 'korean' ;
select next_day(sysdate, '월')
  from dual; 

alter session set nls_date_language = 'american' ;
select next_day(sysdate, 'mon')
  from dual; --영어로 쓰려면 세션의 set을 바꿔야함 
