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
    
 
  
   
   