--연습문제1) studentt 테이블에서 성별컬럼 생성(남자, 여자) 
select name, jumin,
    case when substr(JUMIN, 7,1) = '1' then '남성'
         when substr(JUMIN, 7,1) = '2' then '여성'
    end as 성별 
  from student; 
  
--축약
select name, jumin,
    case substr(JUMIN, 7,1) when '1' then '남성'
                                     else '여자' 
    end as 성별 
  from student; 
  
--decode사용
select name, jumin, substr(jumin,7,1), decode(substr(jumin,7,1),'1', '남자', '여자') as 성별1 --jumin 컬럼 문자열이기 때문에 1에 ''

desc student;

--연습문제2) emp 테이블에서 sal별 등급 부여, sal이 3000 초과인 경우 'A', 그 외 'B' 
select ename, sal,
    case when sal >3000  then 'A'
         when sal <=3000 then 'B'
     end as sal등급
   from emp;

--decode 
select ename,sal, decode(sign(sal-3000), 1, 'A', 'B') --sign함수를 이용하는 것이 핵심! 
  from emp; 
