--1번 
create table student_test as select * from student; 
insert into student_test select * from student where deptno1 = 101; 
commit; 
 
create table student_test2 
as 
select distinct * from student_test;

drop table student_test;

rename student_test2 to student_test;

select * from student_test;

--2번
select column_name as "Column",
       decode(nullable, 'N', 'NOT NULL')   as "Nullable",
       case data_type 
       when 'NUMBER' then data_type 
                  || '(' 
                  || nvl(data_precision , data_length) 
                  || ','
                  || data_scale
                  || ')' 
       when 'VARCHAR2' then data_type 
                  || '(' 
                  || nvl(data_precision , data_length) 
                  || ')' 
       end
       as "Type"
  from user_tab_columns 
 where table_name='EMP';
 
--문제3
 select i1.table_name as 테이블명, i1.column_name as 컬럼명, i1.constraint_name as 제약조건이름, 
        i2.table_name as 부모테이블, i2.constraint_name as foreignkey, i2.column_name as reference
   from (select u1.table_name, u3.column_name, u1.constraint_name, u1.r_constraint_name
           from user_constraints u1, user_cons_columns u3 
           where u1.constraint_name = u3.constraint_name
             and u1.table_name = u3.table_name) i1,   
         (select u2.table_name, u4.column_name, u2.constraint_name, u2.index_name
            from user_constraints u2, user_cons_columns u4
            where u2.constraint_name = u4.constraint_name
              and u2.table_name = u4.table_name) i2
      where i1.r_constraint_name = i2.index_name(+) ;
        
