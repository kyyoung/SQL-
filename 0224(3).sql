--시퀀스(sequence)
--채번 오브젝트 : 주문거래번호나 통장번호 같은 것
--연속된 숫자를 자동으로 부여하기 위한 객체 
--cache n : 한꺼번에 n개 미리 뽑아놓고 아무거나 가져갈 수 있게 만들어 놓는 것, 이게 더 빠름 
--nocache : 순서대로 가져가게

--1. 시퀀스 생성
create sequence jumun_seq1 
increment by 1 
start with 1 --시작값 1로 설정했는데 2로 시작함 : 오라클 버그 , insert 하는 시점에서 이미 값이 입력되었고, nextval이 하나 증가함 
maxvalue 10; --max value 값까지 값이 insert됨 


--2. 테이블 생성 및 시퀀스를 통한 번호 부여
create table jumun(
no number,
name varchar2(10)); 

insert into jumun values(jumun_seq1.nextval, 'a');
insert into jumun values(jumun_seq1.nextval, 'b');
insert into jumun values(jumun_seq1.nextval, 'c');

select * from jumun;


--1. 시퀀스 생성 --cahce 옵션 
create sequence jumun_seq2
increment by 1
start with 1 --시작값이 1로 설정했고, 1로 시작함 
maxvalue 10 -1부터 10까지 값이 설정되면, 다시 1부터 10가지 사이클을 돌면서 데이터 생성 
minvalue 1
cycle
cache 2; --동시접속자가 들어왔을때 속도를 향상시키는 명령어 

--2. 테이블 생성 및 시퀀스를 통한 번호 부여
delete from jumun;
commit;

insert into jumun values(jumun_seq2.nextval, 'a');
select * from jumun;

--nextval에서 한 번 증가된 시퀀스는 데이터가 삭제되었다고 해서 없어지지않고 계속해서 다음 번호가 부여됨 그렇기 때문에 delete 해도 삭제되어 지지 않아서 aa가 insert되지 않음 maxval인 10까지 값을 입력시켰기 때문임
delete from jumun;
insert into jumun values(jumun_seq1.nextval, 'aa'); 


delete from jumun; 
select jumun_seq2.nextval from dual; --입력용 : nextval은 값을 증가시키기 때문에... 
select jumun_seq2.currval from dual; --조회용 

insert into jumun values(jumun_seq2.nextval, 'aa');

select jumun_seq1.currval from dual;