--������(sequence)
--ä�� ������Ʈ : �ֹ��ŷ���ȣ�� �����ȣ ���� ��
--���ӵ� ���ڸ� �ڵ����� �ο��ϱ� ���� ��ü 
--cache n : �Ѳ����� n�� �̸� �̾Ƴ��� �ƹ��ų� ������ �� �ְ� ����� ���� ��, �̰� �� ���� 
--nocache : ������� ��������

--1. ������ ����
create sequence jumun_seq1 
increment by 1 
start with 1 --���۰� 1�� �����ߴµ� 2�� ������ : ����Ŭ ���� , insert �ϴ� �������� �̹� ���� �ԷµǾ���, nextval�� �ϳ� ������ 
maxvalue 10; --max value ������ ���� insert�� 


--2. ���̺� ���� �� �������� ���� ��ȣ �ο�
create table jumun(
no number,
name varchar2(10)); 

insert into jumun values(jumun_seq1.nextval, 'a');
insert into jumun values(jumun_seq1.nextval, 'b');
insert into jumun values(jumun_seq1.nextval, 'c');

select * from jumun;


--1. ������ ���� --cahce �ɼ� 
create sequence jumun_seq2
increment by 1
start with 1 --���۰��� 1�� �����߰�, 1�� ������ 
maxvalue 10 -1���� 10���� ���� �����Ǹ�, �ٽ� 1���� 10���� ����Ŭ�� ���鼭 ������ ���� 
minvalue 1
cycle
cache 2; --���������ڰ� �������� �ӵ��� ����Ű�� ��ɾ� 

--2. ���̺� ���� �� �������� ���� ��ȣ �ο�
delete from jumun;
commit;

insert into jumun values(jumun_seq2.nextval, 'a');
select * from jumun;

--nextval���� �� �� ������ �������� �����Ͱ� �����Ǿ��ٰ� �ؼ� ���������ʰ� ����ؼ� ���� ��ȣ�� �ο��� �׷��� ������ delete �ص� �����Ǿ� ���� �ʾƼ� aa�� insert���� ���� maxval�� 10���� ���� �Է½��ױ� ������
delete from jumun;
insert into jumun values(jumun_seq1.nextval, 'aa'); 


delete from jumun; 
select jumun_seq2.nextval from dual; --�Է¿� : nextval�� ���� ������Ű�� ������... 
select jumun_seq2.currval from dual; --��ȸ�� 

insert into jumun values(jumun_seq2.nextval, 'aa');

select jumun_seq1.currval from dual;